package hreport.core.report.service;

import hreport.core.report.dto.ReportLine;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.hand.hap.core.IRequest;
import com.hand.hap.core.ProxySelf;
import com.hand.hap.system.dto.ResponseData;
import com.hand.hap.system.service.IBaseService;
/**
 * @name IReportLineService
 * @description 报表列Service
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
public interface IReportLineService extends IBaseService<ReportLine>, ProxySelf<IReportLineService>{

	public ResponseData getLines(String sql,Long dsId,Long headerId);
	
	public List<ReportLine> getLinesByHeaderId(Long headerId);
	
}
