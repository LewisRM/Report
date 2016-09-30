package hreport.core.report.mapper;



import hreport.core.report.dto.ValidateTable;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hand.hap.core.annotation.StdWho;
import com.hand.hap.mybatis.common.Mapper;



/**
 * @name ValidateTableMapper
 * @description 值集行Mapper
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
public interface ValidateTableMapper extends Mapper<ValidateTable> {

	public List<ValidateTable> getByFlexValueSetId(Long flexValueSetId); 
}
