package hreport.core.report.service;

import hreport.core.report.dto.QueryParams;

import java.util.List;

import com.hand.hap.core.IRequest;
import com.hand.hap.core.ProxySelf;
import com.hand.hap.system.dto.Code;
import com.hand.hap.system.dto.CodeValue;
import com.hand.hap.system.dto.ResponseData;
import com.hand.hap.system.service.IBaseService;

/**
 * @name IQueryParamsService
 * @description 报表参数Service
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
public interface IQueryParamsService extends IBaseService<QueryParams>, ProxySelf<IQueryParamsService>{
	
	
	
	
	public List<QueryParams> getParamsByHeaderId(Long headerId);
	
	
	
	public ResponseData savaParams(List<QueryParams> params);
	
	
	 

}
