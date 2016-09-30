package hreport.core.report.service.impl;



import java.util.List;

import javax.annotation.Resource;

import hreport.core.report.dto.ValidateTable;
import hreport.core.report.mapper.ValidateTableMapper;
import hreport.core.report.service.IValidateTableService;

import org.springframework.stereotype.Service;

import com.hand.hap.core.annotation.FreeMarkerBean;
import com.hand.hap.system.service.impl.BaseServiceImpl;

/**
 * @name ValidateTableServiceImpl
 * @description 值集行Service
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
@Service
@FreeMarkerBean
public class ValidateTableServiceImpl extends BaseServiceImpl<ValidateTable> implements IValidateTableService {

	@Resource
	private ValidateTableMapper validateTableMapper;
	
    /**
     * <p>
     * 通过值集头id查询所有值集行
     * </p>
     * @param flexValueSetId
     * 			值集头id
     * @return List<ValidateTable>
     * 			查询结果
     */
	@Override
	public List<ValidateTable> getByFlexValueSetId(Long flexValueSetId) {
		List<ValidateTable> list=validateTableMapper.getByFlexValueSetId(flexValueSetId);
		return list;
	}


	
}
