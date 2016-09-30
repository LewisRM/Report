package hreport.core.report.service.impl;

import hreport.core.report.dto.DataSource;
import hreport.core.report.mapper.DataSourceMapper;
import hreport.core.report.service.IDataSourceService;
import hreport.core.report.utils.DESUtils;
import hreport.core.report.utils.DataSourceFactory;
import hreport.core.report.utils.Drivers;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.hap.core.IRequest;
import com.hand.hap.system.service.impl.BaseServiceImpl;


@Transactional
public class DataSourceServiceImpl extends BaseServiceImpl<DataSource> implements IDataSourceService {

	private static Logger log = LoggerFactory.getLogger(DataSourceServiceImpl.class);
	
	/**
	 * @param DataSource
	 * @return int
	 */
	@Override
	public  int testConnection(DataSource dataSource) {
		Connection conn = null;
		try {
			String[] dataBaseNames = dataSource.getJdbcUrl().split(":");
			String dataBaseName = "";
			if (dataBaseNames != null && dataBaseNames.length > 1) {
				dataBaseName = dataBaseNames[1];
			}
			String driver = "";
			if (dataBaseName != "" && dataBaseName != null) {
				driver = Drivers.getDriver(dataBaseName);
			}
			Class.forName(driver);
			conn = DriverManager.getConnection(dataSource.getJdbcUrl(), dataSource.getUsername(),
					dataSource.getPassword());
			return 1;
		} catch (Exception e) {
			log.error("测试数据库连接失敗", e);
			return 2;
		} finally {
			this.releaseConnection(conn);
		}
	}

	private void releaseConnection(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException ex) {
				log.error("测试数据库连接后释放资源失败", ex);
			}
		}
	}
	
	@Override
	public List<DataSource> findAll() {
		return ((DataSourceMapper) this.mapper).findAll();
	}

	
	@Override
	public List<DataSource> batchUpdate(IRequest request, List<DataSource> list) {
		for(int i=0;i<list.size();i++)
		{
			DataSource data=list.get(i);
			try {
				data.setPassword(DESUtils.toHexString(DESUtils.encrypt(data.getPassword())));
			} catch (Exception e) {
				log.error("密碼加密失敗！", e);
				e.printStackTrace();
			}
			DataSourceFactory.registerComboPooledDataSource(data);
		}
		List<DataSource> dataSources=super.batchUpdate(request, list);
		for(int i=0;i<dataSources.size();i++)
		{
			System.out.println(dataSources.get(i).get__status());
			if("add".equals(dataSources.get(i).get__status()))
			{
				try {
					dataSources.get(i).setPassword(URLDecoder.decode(DESUtils.decrypt(dataSources.get(i).getPassword()), "utf-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				DataSourceFactory.registerComboPooledDataSource(dataSources.get(i));
			}
		}
		for(int i=0;i<dataSources.size();i++)
		{
			DataSource data=dataSources.get(i);
			try {
				data.setPassword(URLDecoder.decode(DESUtils.decrypt(data.getPassword()), "utf-8"));
			} catch (Exception e) {
				log.error("密碼解密失敗！", e);
				e.printStackTrace();
			}
		}
		return dataSources;
	}

	@Override
	public List<DataSource> select(IRequest request, DataSource condition,
			int pageNum, int pageSize) {
		List<DataSource> list=super.select(request, condition, pageNum, pageSize);
		for(int i=0;i<list.size();i++)
		{
			DataSource data=list.get(i);
			try {
				data.setPassword(URLDecoder.decode(DESUtils.decrypt(data.getPassword()), "utf-8"));
			} catch (Exception e) {
				log.error("密碼解密失敗！", e);
				e.printStackTrace();
			}
		}
		return list;
	}
	
	
	

}
