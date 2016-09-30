package hreport.core.report.utils;



import hreport.core.report.dto.DataSource;
import hreport.core.report.dto.DropList;
import hreport.core.report.dto.ReportDataSource;
import hreport.core.report.dto.ReportLine;
import hreport.core.report.dto.ValidateTable;
import hreport.core.report.service.IDataSourceService;

import java.beans.PropertyVetoException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DataSourceFactory {
	
	private IDataSourceService dataSourceService;
	
	private static Logger log = LoggerFactory.getLogger(DataSourceFactory.class);
	/*
	 * 保存可用的数据库连接池
	 * @param
	 * 	Long:数据库连接池的id
	 * 	ComboPooledDataSource:数据库连接池对象
	 */
	public static Map<Long, ComboPooledDataSource> dataSources = new HashMap<>();
	
	public void setDataSourceService(IDataSourceService dataSourceService) {
		this.dataSourceService = dataSourceService;
	}	

    /**
     * <p>
     * 获取数据库连接池对象
     * </p>
     * @param id
     * 			 数据库连接池的id
     * @return ComboPooledDataSource
     * 			数据库连接池对象
     */
	public static ComboPooledDataSource getComboPooledDataSourceById(Long id){
		 return dataSources.get(id);
	}
    /**
     * <p>
     * 根据 ID 查询
     * </p>
     * @param id
     * 			 数据库连接池的id
     * @return Connection
     * 			数据库连接池Connection
     */
	public static Connection getConnectionById(Long id){
		try {
			return dataSources.get(id).getConnection();
		} catch (SQLException e) {
			log.info("获取数据源链接失败!", e);
		}
		return null;
	}
	
	public static boolean isInComboPool(Long dataSourceId){
		if(dataSources.containsKey(dataSourceId))
		{
			return true;
		}
		return false;
	}
	
	/*
	 * 初始化函数，作为一个bean随着服务器的启动而被加载，
	 * 配置在hreport.core.config.ModuleService.xml
	 */
	public void init(){
		//得到所有的数据源对象
		List<DataSource> ds = dataSourceService.findAll();
		for (DataSource d : ds){
			//密码解密
			try {
				d.setPassword(URLDecoder.decode(DESUtils.decrypt(d.getPassword()), "utf-8"));
			} catch (Exception e) {
				log.info("数据源密码解密失败",e);
			}
			//测试数据源是否可连接
			if (dataSourceService.testConnection(d) == 1){
				ComboPooledDataSource dataSource = instanceComboPooledDataSource(d);
		        dataSources.put(d.getDataSourceId(), dataSource);	
			}
			
		}
	}
	
	/**
     * <p>
     * 实例化一个数据库连接池
     * </p>
     * @param DataSource
     * 			 数据源
     * @return ComboPooledDataSource
     * 			数据库连接池ComboPooledDataSource
     */
	public static ComboPooledDataSource instanceComboPooledDataSource(DataSource dataSource){
		ComboPooledDataSource cpd = new ComboPooledDataSource();
		cpd.setUser(dataSource.getUsername());
		cpd.setPassword(dataSource.getPassword());
		cpd.setJdbcUrl(dataSource.getJdbcUrl());
        String[] dataBaseNames = dataSource.getJdbcUrl().split(":");
    	String dataBaseName = "";
    	if (dataBaseNames != null && dataBaseNames.length > 1){
    		dataBaseName = dataBaseNames[1];
    	}
    	String driver = "";
    	if (dataBaseName != "" && dataBaseName != null){
    		driver = Drivers.getDriver(dataBaseName);
    	}
        try {
        	cpd.setDriverClass(driver);
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
        cpd.setInitialPoolSize(10);
        cpd.setMinPoolSize(5);
        cpd.setMaxPoolSize(50);
        cpd.setMaxStatements(100);
        cpd.setMaxIdleTime(60);
        return cpd;
	}
	
	
	
	/**
     * <p>
     * 插入一个数据源
     * </p>
     * @param DataSource
     * 			 数据库连接池
     */
	public static void registerComboPooledDataSource(DataSource dataSource){
		ComboPooledDataSource dpd = instanceComboPooledDataSource(dataSource);
		dataSources.put(dataSource.getDataSourceId(), dpd);
	}
    /**
     * <p>
     * 解析列
     * </p>
     * @param conn
     * 			数据库连接
     * @param sql
     * 			查询sql语句
     * @return List<ReportLine>
     * 			解析结果
     */
	public static List<ReportLine> getColumnNameAndType(Connection conn ,String sql){
		if (sql == null || sql == ""){
			throw new RuntimeException("sql can not be null");
		}
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<ReportLine> lists = new ArrayList<>();
		if(sql.indexOf("where")>0)
		{
			String[] split = sql.split("where");
			if (split.length > 1){
				sql = split[0] + " where 1 = 0";
			}
			if(split[1].indexOf("group")>0)
			{
				String[] split2 = split[1].split("group");
				if (split2.length > 1){
					sql +=" group "+split2[1];
				}
			}
			else if(split[1].indexOf("GROUP")>0)
			{
				String[] split2 = split[1].split("GROUP");
				if (split2.length > 1){
					sql +=" GROUP "+split2[1];
				}
			}
		}
		else if(sql.indexOf("WHERE")>0)
		{
			String[] split = sql.split("WHERE");
			if (split.length > 1){
				sql = split[0] + " where 1 = 0";
			}
			if(split[1].indexOf("group")>0)
			{
				String[] split2 = split[1].split("group");
				if (split2.length > 1){
					sql +=" group "+split2[1];
				}
			}
			else if(split[1].indexOf("GROUP")>0)
			{
				String[] split2 = split[1].split("GROUP");
				if (split2.length > 1){
					sql +=" GROUP "+split2[1];
				}
			}
		}
		System.out.println(sql);

		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			ResultSetMetaData data = rs.getMetaData();
			for (int i = 1; i <= data.getColumnCount(); i++) {
				ReportLine line = new ReportLine();
 				String columnName = data.getColumnLabel(i);
				String columnTypeName=data.getColumnTypeName(i);
				int columnWidth=data.getColumnDisplaySize(i);
				System.out.println(columnName + " " + columnTypeName+" "+columnWidth);
				line.setColumnWidth(columnWidth);
				line.setColumnName(columnName);
				line.setName(columnName);
				line.setDataType(columnTypeName);
				lists.add(line);
			}
		} catch (SQLException e) {
			log.info("数据库连接失败",e);
		}
		finally
		{
			try {
				stmt.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return lists;
	}
	
	
	
    /**
     * <p>
     * 查询lov的结果
     * </p>
     * @param conn
     * 			数据库连接
     * @param sql
     * 			查询sql语句
     * @return List<Map<String,Object>>
     * 			查询结果
     */
	public static List<Map<String,Object>> getSqlResult(Connection conn ,String sql){
		if (sql == null || sql == ""){
			throw new RuntimeException("sql can not be null");
		}
		PreparedStatement stmt = null;
		List<Map<String,Object>> lists = new ArrayList<>();

		try {
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery(sql);
			ResultSetMetaData data = rs.getMetaData();
			int columnCount = data.getColumnCount();
			while(rs.next())
			{
				Map<String,Object> rowData = new HashMap<String,Object>(columnCount);  
				for (int i = 1; i <= columnCount; i++) {
	 				rowData.put(data.getColumnName(i), rs.getObject(i));
				}
				lists.add(rowData);
			}
		} catch (SQLException e) {
			log.info("数据库连接失败",e);
		}
		return lists;
	}
	
	public static List<ReportDataSource> getReportDataSource(List<ReportLine> lines,String sql,Long dsId)
	{
		List<ReportDataSource> datas=new ArrayList<ReportDataSource>();
		Connection conn=DataSourceFactory.getConnectionById(dsId);
		Statement stat=null;
		ResultSet rs=null;
		ReportDataSource data=null;
		List<Map<String,String>> list=null;
		try {
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			while(rs.next())
			{
				data=new ReportDataSource();
		    	list=new ArrayList<Map<String,String>>();
				for(int i=0;i<lines.size();i++)
				{
					Map<String,String> map=new TreeMap<String,String>();
					//map.put(lines.get(i).getColumnName(), rs.getString(lines.get(i).getColumnName()));
					map.put(lines.get(i).getColumnName(), rs.getString(lines.get(i).getColumnName()));
					list.add(map);
				}
				data.setReportDataSource(list);
				datas.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			try {
				stat.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return datas;
	}
    /**
     * <p>
     * 获取下拉型参数控件的下拉内容
     * </p>
     * @param sql
     * 			查询sql语句
     * @param dsId
     * 			数据源id
     * @return List<DropList>
     * 			查询结果
     * @throws UnsupportedEncodingException 
     */
	public static List<DropList> getParamsValue(String sql,Long dsId){
		List<DropList> list=new ArrayList<DropList>();
		Connection conn=DataSourceFactory.getConnectionById(dsId);
		Statement stat=null;
		ResultSet rs=null;
		try {
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			DropList dropList=null;
			while(rs.next())
			{
				dropList=new DropList();
				dropList.setId(rs.getString(1));
				dropList.setName(rs.getString(2));
				list.add(dropList);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			try {
				rs.close();
				stat.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	/**
     * <p>
     * 获取参数默认值
     * </p>
     * @param sql
     * 			查询sql语句
     * @param dsId
     * 			数据源id
     * @return List<DropList>
     * 			查询结果
     */
	public static List<DropList> getDefaultValue(String sql,Long dsId){
		List<DropList> list=new ArrayList<DropList>();
		Connection conn=DataSourceFactory.getConnectionById(dsId);
		Statement stat=null;
		ResultSet rs=null;
		try {
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			DropList dropList=null;
			while(rs.next())
			{
				dropList=new DropList();
				dropList.setId(rs.getString(1));
				list.add(dropList);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			try {
				rs.close();
				stat.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	
	
	
    /**
     * <p>
     * 查询lov的结果
     * </p>
     * @param validateTables
     * 			值集行集合
     * @param sql
     * 			查询sql语句
     * @param dsId
     * 			数据源id
     * @return List<ReportDataSource>
     * 			查询结果
     */
	public static List<ReportDataSource> getLovDataSource(List<ValidateTable> validateTables,String sql,Long dsId)
	{
		List<ReportDataSource> datas=new ArrayList<ReportDataSource>();
		Connection conn=DataSourceFactory.getConnectionById(dsId);
		Statement stat=null;
		ResultSet rs=null;
		ReportDataSource data=null;
		List<Map<String,String>> list=null;
		try {
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			while(rs.next())
			{
				data=new ReportDataSource();
		    	list=new ArrayList<Map<String,String>>();
				for(int i=0;i<validateTables.size();i++)
				{
					if("Y".equals(validateTables.get(i).getEnabledFlag()))
					{
						Map<String,String> map=new TreeMap<String,String>();
						map.put(validateTables.get(i).getColumnAlias(), rs.getString(validateTables.get(i).getColumnAlias()));
						list.add(map);
					}
				}
				data.setReportDataSource(list);
				datas.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			try {
				stat.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return datas;
	}
}
