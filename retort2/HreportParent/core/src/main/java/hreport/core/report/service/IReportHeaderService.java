package hreport.core.report.service;



import java.util.List;

import hreport.core.report.dto.ReportDataSource;
import hreport.core.report.dto.ReportHeader;

import com.hand.hap.core.IRequest;
import com.hand.hap.core.ProxySelf;
import com.hand.hap.system.service.IBaseService;
/**
 * @name IReportHeaderService
 * @description 报表头Service
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
public interface IReportHeaderService extends IBaseService<ReportHeader>, ProxySelf<IReportHeaderService>{

	
	public void addReport(Long headerId,IRequest request);
	
	public List<ReportDataSource> getReportDataSource(Long headerId,Long dsId,String sql);
}
