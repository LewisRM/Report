package hreport.core.report.service;

import hreport.core.report.dto.FlexVset;
import hreport.core.report.dto.ReportDataSource;

import java.util.List;

import com.hand.hap.core.IRequest;
import com.hand.hap.core.annotation.StdWho;
import com.hand.hap.system.service.IBaseService;

/**
 * @name IFlexVsetService
 * @description 值集头Service
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
public interface IFlexVsetService extends IBaseService<FlexVset> {



	public List<ReportDataSource> getLovDataSource(Long vsetId,Long dsId,String sql);
}
