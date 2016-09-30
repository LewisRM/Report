package hreport.core.report.mapper;

import hreport.core.report.dto.DataSource;

import java.util.List;

import com.hand.hap.mybatis.common.Mapper;

/**
 * Created by hailor on 16/6/2.
 */
public interface DataSourceMapper extends Mapper<DataSource> {
	
	public List<DataSource> findAll();
}
