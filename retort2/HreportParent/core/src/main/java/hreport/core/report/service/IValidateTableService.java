package hreport.core.report.service;



import java.util.List;

import hreport.core.report.dto.ValidateTable;

import com.hand.hap.core.ProxySelf;
import com.hand.hap.system.service.IBaseService;

/**
 * @name IValidateTableService
 * @description 值集行Service
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
public interface IValidateTableService extends IBaseService<ValidateTable>, ProxySelf<IValidateTableService> {


	public List<ValidateTable> getByFlexValueSetId(Long flexValueSetId); 
}
