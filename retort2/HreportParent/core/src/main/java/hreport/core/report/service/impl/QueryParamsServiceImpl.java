package hreport.core.report.service.impl;

import hreport.core.report.dto.QueryParams;
import hreport.core.report.dto.ReportHeader;
import hreport.core.report.mapper.QueryParamsMapper;
import hreport.core.report.service.IQueryParamsService;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hand.hap.core.IRequest;
import com.hand.hap.system.dto.ResponseData;
import com.hand.hap.system.service.impl.BaseServiceImpl;
/**
 * @name QueryParamsServiceImpl
 * @description 报表参数Service
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
@Service
public class QueryParamsServiceImpl extends BaseServiceImpl<QueryParams>
		implements IQueryParamsService {

	@Resource
	private QueryParamsMapper queryParamsMapper;

    /**
     * <p>
     * 根据报表头查询所有参数
     * </p>
     * @param headerId
     * 			报表头id
     * @return List<QueryParams>
     * 			查询结果集合
     */
	@Override
	public List<QueryParams> getParamsByHeaderId(Long headerId) {
		// TODO Auto-generated method stub
		return queryParamsMapper.getParamsByHeaderId(headerId);
	}
	
    /**
     * <p>
     * 参数第一次解析后自动保存参数
     * </p>
     * @param params
     * 			参数的集合
     * @return List<QueryParams>
     * 			保存结果集合
     */
	@Override
	public ResponseData savaParams(List<QueryParams> params) {
		ResponseData response=new ResponseData();
		boolean b=false;
		try 
		{
			if(params.size()>0)
			{
				Long headerId=params.get(0).getHeaderId();
				List<QueryParams> paramList=this.getParamsByHeaderId(headerId);
				if(paramList.size()!=0)
				{
					this.batchDelete(paramList);
				}
			}
			if(!"".equals(params.get(0).getParamsName()) && params.get(0).getParamsName()!=null)
			{
				for(int i=0;i<params.size();i++)
				{
					params.get(i).setDefaultType("STRING");
					params.get(i).setDataType("STRING");
					params.get(i).setWidth(150);
					params.get(i).setShowWidth(150);
					params.get(i).setFormElement("INPUT");
					params.get(i).setContentSource("NULL");
					params.get(i).setRequired("Y");
					params.get(i).setDisplay("Y");
					queryParamsMapper.insertSelective(params.get(i));
				}
			}
			else
			{
				params.remove(0);
			}
			b=true;
			response.setRows(params);
		} catch (Exception e) {
			b=false;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setSuccess(b);
		return response;
	}

    /**
     * <p>
     * 修改参数
     * </p>
     * @param queryParamsList
     * 			参数集合
     * @return List<QueryParams>
     * 			修改结果集合
     */
	@Override
	public List<QueryParams> batchUpdate(IRequest request,
			List<QueryParams> queryParamsList) {
		if(queryParamsList.size()!=0)
		{
			QueryParams param=queryParamsList.get(0);
			Long headerId=param.getHeaderId();
			if("add".equals(param.get__status()))
			{
				List<QueryParams> lines=this.getParamsByHeaderId(headerId);
				if(lines.size()!=0)
				{
					this.batchDelete(lines);
				}
			}
		}
		
		return super.batchUpdate(request, queryParamsList);
	}
	
	
	






}
