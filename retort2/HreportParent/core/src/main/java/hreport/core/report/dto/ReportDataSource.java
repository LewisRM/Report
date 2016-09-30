package hreport.core.report.dto;

import java.util.List;
import java.util.Map;
/**
 * @name ReportDataSource
 * @description 报表内容DTO
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
public class ReportDataSource {

	
	private List<Map<String,String>> reportDataSource;

	public List<Map<String, String>> getReportDataSource() {
		return reportDataSource;
	}

	public void setReportDataSource(List<Map<String, String>> reportDataSource) {
		this.reportDataSource = reportDataSource;
	}

	
	

	

}
