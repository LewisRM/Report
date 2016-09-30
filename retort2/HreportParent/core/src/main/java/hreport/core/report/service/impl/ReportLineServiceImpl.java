package hreport.core.report.service.impl;


import hreport.core.report.dto.ReportLine;
import hreport.core.report.mapper.ReportLineMapper;
import hreport.core.report.service.IReportLineService;
import hreport.core.report.utils.DataSourceFactory;

import java.sql.Connection;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.hap.core.IRequest;
import com.hand.hap.system.dto.ResponseData;
import com.hand.hap.system.service.impl.BaseServiceImpl;
/**
 * @name ReportLineServiceImpl
 * @description 报表列Service
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
@Service
@Transactional
public class ReportLineServiceImpl extends BaseServiceImpl<ReportLine> implements IReportLineService{

	@Resource
	private ReportLineMapper reportLineMapper;
	
    /**
     * <p>
     * 解析列
     * </p>
     * @param sql
     * 			用来解析的sql语句
     * @param dsId
     * 			数据源id
     * @param headerId
     * 			报表头id
     * @return List<ReportLine>
     * 			解析结果
     */
	@Override
	public ResponseData getLines(String sql,Long dsId,Long headerId)
	{
		List<ReportLine> list=null;
		ResponseData response=new ResponseData();
		boolean b=false;
		try {
			Connection c=DataSourceFactory.getConnectionById(dsId);
			list = DataSourceFactory.getColumnNameAndType(c, sql);
			
			List<ReportLine> lines=this.getLinesByHeaderId(headerId);
			if(lines.size()!=0)
			{
				this.batchDelete(lines);
			}
			
			for(int i=0;i<list.size();i++)
			{
				list.get(i).setHeaderId(headerId);
				list.get(i).setSort("A");
				list.get(i).setDisplay("Y");
				list.get(i).setDisplayWidth(150);
				this.mapper.insertSelective(list.get(i));
			}
			b=true;
			response.setRows(list);
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
     * 通过报表头获取列
     * </p>
     * @param headerId
     * 			报表头id
     * @return List<ReportLine>
     * 			查询值集合
     */
	@Override
	public List<ReportLine> getLinesByHeaderId(Long headerId) {
		// TODO Auto-generated method stub
		List<ReportLine> list=reportLineMapper.getLinesByHeaderId(headerId);
		return list;
	}

    /**
     * <p>
     * 修改列
     * </p>
     * @param reportLineList
     * 			修改的集合
     * @return List<ReportLine>
     * 			修改结果
     */
	@Override
	public List<ReportLine> batchUpdate(IRequest request, List<ReportLine> reportLineList) {
		
		if(reportLineList.size()!=0)
		{
			ReportLine line=reportLineList.get(0);
			Long headerId=line.getHeaderId();
			if("add".equals(line.get__status()))
			{
				List<ReportLine> lines=this.getLinesByHeaderId(headerId);
				if(lines.size()!=0)
				{
					this.batchDelete(lines);
				}
			}
		}
		
		return super.batchUpdate(request, reportLineList);
	}

	
	
}
