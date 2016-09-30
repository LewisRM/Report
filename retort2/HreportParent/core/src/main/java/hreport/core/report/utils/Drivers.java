package hreport.core.report.utils;

import java.util.HashMap;
import java.util.Map;
/**
 * <p>
 * 保存数据库对应的驱动信息
 * Created by hailor on 16/4/1.
 * </p>
 */
public class Drivers {
	public static final Map<String, String> drivers = new HashMap<>();

	static {
		drivers.put("mysql", "com.mysql.jdbc.Driver");
		drivers.put("oracle", "oracle.jdbc.OracleDriver");
		drivers.put("microsoft", "com.microsoft.sqlserver.jdbc.SQLServerDriver");
	}

	public static String getDriver(String dataBaseName) {
		return drivers.get(dataBaseName);
	}
}
