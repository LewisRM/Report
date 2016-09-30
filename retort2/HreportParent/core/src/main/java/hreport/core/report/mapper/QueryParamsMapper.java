package hreport.core.report.mapper;



import hreport.core.report.dto.QueryParams;

import java.util.List;

import com.hand.hap.mybatis.common.Mapper;
/**
 * @name QueryParamsMapper
 * @description 报表参数Mapper
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
public interface QueryParamsMapper extends Mapper<QueryParams>{

	public List<QueryParams> getParamsByHeaderId(Long headerId);
	
}
