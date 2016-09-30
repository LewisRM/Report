package hreport.core.report.service.impl;

import hreport.core.report.dto.QueryParams;
import hreport.core.report.dto.ReportDataSource;
import hreport.core.report.dto.ReportHeader;
import hreport.core.report.dto.ReportLine;
import hreport.core.report.mapper.ReportHeaderMapper;
import hreport.core.report.service.IQueryParamsService;
import hreport.core.report.service.IReportHeaderService;
import hreport.core.report.service.IReportLineService;
import hreport.core.report.utils.DataSourceFactory;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hand.hap.account.dto.Role;
import com.hand.hap.account.dto.UserRole;
import com.hand.hap.account.service.IUserRoleService;
import com.hand.hap.core.IRequest;
import com.hand.hap.function.dto.Function;
import com.hand.hap.function.dto.Resource;
import com.hand.hap.function.dto.RoleFunction;
import com.hand.hap.function.service.IFunctionService;
import com.hand.hap.function.service.IResourceService;
import com.hand.hap.function.service.IRoleFunctionService;
import com.hand.hap.system.service.impl.BaseServiceImpl;

/**
 * @name ReportHeaderServiceImpl
 * @description 报表头Service
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
@Service
public class ReportHeaderServiceImpl extends BaseServiceImpl<ReportHeader> implements IReportHeaderService{

	@Autowired
	private ReportHeaderMapper reportHeaderMapper; 
	@Autowired
	private IReportLineService reportLineService;
	@Autowired
	private IQueryParamsService queryParamsService;
	@Autowired
	private IResourceService resourceService;
	@Autowired
	private IFunctionService functionService;
	@Autowired
	private IRoleFunctionService roleFunctionService;
	@Autowired
	private IUserRoleService userRoleService;
	
    /**
     * <p>
     * 添加报表页面
     * </p>
     * @param headerId
     * 			报表头id
     */
	@Override
	public void addReport(Long headerId, IRequest request) {
		ReportHeader header=new ReportHeader();
    	header.setRepHeaderId(headerId);
    	header=selectByPrimaryKey(request, header);
    	
    	Resource resource=new Resource();		
    	String resUrl="report/report.html?id="+headerId;
    	String resType="HTML";
    	String resName=header.getName();
    	String resDiscription=header.getName();
    	resource.setUrl(resUrl);
    	resource.setType(resType);
    	resource.setName(resName);
    	resource.setDescription(resDiscription);
    	resource.setLoginRequire("N");
    	resource.setAccessCheck("N");
    	resource=resourceService.insertSelective(request, resource);

    	
    	Function function=new Function();
    	String funModuleCode="report";
    	String funCode=header.getProgramName();
    	String funName=header.getName();
    	String funIcon="icon-envelope";
    	Long funSequence=70l;
    	String funDescription=header.getName();
    	Long funParentFunctionId=177l;
    	Long funResourceId=resource.getResourceId();
    	function.setModuleCode(funModuleCode);
    	function.setFunctionCode(funCode);
    	function.setFunctionName(funName);
    	function.setFunctionIcon(funIcon);
    	function.setFunctionSequence(funSequence);
    	function.setFunctionDescription(funDescription);
    	function.setParentFunctionId(funParentFunctionId);
    	function.setResourceId(funResourceId);
    	function=functionService.insertSelective(request, function);
    	
    	
    	Long userId=function.getCreatedBy();
    	UserRole userRole=new UserRole();
    	userRole.setUserId(userId);
    	List<Role> roles=userRoleService.selectUserRoles(request, userRole);
    	
    	RoleFunction roleFunction=new RoleFunction();
    	roleFunction.setFunctionId(function.getFunctionId());
    	for(int i=0;i<roles.size();i++)
    	{
    		roleFunction.setRoleId(roles.get(i).getRoleId());
    		roleFunctionService.insertSelective(request, roleFunction);
    	}

	}

    /**
     * <p>
     * 获取报表内容
     * </p>
     * @param headerId
     * 			报表头id
     * @param dsId
     * 			数据源id
     * @param sql
     * 			查询sql语句
     * @return List<ReportDataSource>
     * 			查询的值集合
     */
	@Override
	public List<ReportDataSource> getReportDataSource(Long headerId,Long dsId,String sql) {
		List<ReportLine> lines=reportLineService.getLinesByHeaderId(headerId);  	
		List<ReportDataSource> datas=DataSourceFactory.getReportDataSource(lines,sql,dsId);
		return datas;
	}

	@Override
	public int batchDelete(List<ReportHeader> reportHeaderList) {
		// TODO Auto-generated method stub
		
    	for(int i=0;i<reportHeaderList.size();i++)
    	{
    		List<ReportLine> lines=reportLineService.getLinesByHeaderId(reportHeaderList.get(i).getRepHeaderId());
    		if(lines.size()!=0)
    		{
    			reportLineService.batchDelete(lines);
    		}
    		List<QueryParams> params=queryParamsService.getParamsByHeaderId(reportHeaderList.get(i).getRepHeaderId());
    		if(params.size()!=0){
    			queryParamsService.batchDelete(params);
    		}
    	}
		return super.batchDelete(reportHeaderList);
	}
	
	
	
}
