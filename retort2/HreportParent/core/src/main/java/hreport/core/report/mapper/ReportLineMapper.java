package hreport.core.report.mapper;

import hreport.core.report.dto.ReportLine;

import java.util.List;

import com.hand.hap.mybatis.common.Mapper;
/**
 * @name ReportLineMapper
 * @description 报表列Mapper
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
public interface ReportLineMapper extends Mapper<ReportLine>{

	
	public List<ReportLine> getLinesByHeaderId(Long headerId);

}
