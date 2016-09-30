package hreport.core.report.service.impl;



import hreport.core.report.dto.FlexVset;
import hreport.core.report.dto.ReportDataSource;
import hreport.core.report.dto.ValidateTable;
import hreport.core.report.service.IFlexVsetService;
import hreport.core.report.service.IValidateTableService;
import hreport.core.report.utils.DataSourceFactory;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.hap.system.service.impl.BaseServiceImpl;

/**
 * @name FlexVsetServiceImpl
 * @description 值集头Service
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
@Service
@Transactional
public class FlexVsetServiceImpl extends BaseServiceImpl<FlexVset> implements IFlexVsetService {

	@Resource
	private IValidateTableService validateTableService;
	
    /**
     * <p>
     * 删除值集及其行信息
     * </p>
     * @param list
     * 			值集列表
     * @return int
     * 			删除返回信息
     */
	@Override
	public int batchDelete(List<FlexVset> list) {
		Long flexValueSetId=list.get(0).getFlexValueSetId();
		List<ValidateTable> validateTables=validateTableService.getByFlexValueSetId(flexValueSetId);
		if(validateTables!=null && validateTables.size()!=0)
		{
			validateTableService.batchDelete(validateTables);
		}
		return super.batchDelete(list);
	}

    /**
     * <p>
     * 获取lov查询结果
     * </p>
     * @param vsetId
     * 			值集id
     * @param dsID
     * 			数据源id
     * @return List<ReportDataSource>
     * 			查询结果
     */
	@Override
	public List<ReportDataSource> getLovDataSource(Long vsetId, Long dsId,
			String sql) {
		List<ValidateTable> validateTables=validateTableService.getByFlexValueSetId(vsetId);
		List<ReportDataSource> list =DataSourceFactory.getLovDataSource(validateTables, sql, dsId);
		return list;
	}

	
	
	
	
}
