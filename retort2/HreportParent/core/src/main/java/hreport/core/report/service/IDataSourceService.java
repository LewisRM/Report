package hreport.core.report.service;

import java.util.List;

import hreport.core.report.dto.DataSource;

import com.hand.hap.core.ProxySelf;
import com.hand.hap.system.service.IBaseService;

/**
 * Created by hailor on 16/6/2.
 */
public interface IDataSourceService extends IBaseService<DataSource>, ProxySelf<IDataSourceService> {


	/**
     * <p>
     * 测试DataSource是否可用
     * </p>
     * @param DataSource
     * 			
     * @return int
     */
	public int testConnection(DataSource dataSource);
	
	public List<DataSource> findAll();
}
