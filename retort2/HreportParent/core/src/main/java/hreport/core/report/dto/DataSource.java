package hreport.core.report.dto;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.hand.hap.system.dto.BaseDTO;

/**
 * Created by hailor on 16/6/2.
 */
@Table(name = "rep_datasource")
public class DataSource extends BaseDTO implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
    @Column(name="datasource_id")
    @GeneratedValue
    private  Long dataSourceId;

    @Column
    private String jdbcUrl;
    
    @Column
    private String name;
    
	@Column
    private String username;
    
    @Column
    private String password;
    
    public Long getDataSourceId() {
		return dataSourceId;
	}

	public void setDataSourceId(Long dataSourceId) {
		this.dataSourceId = dataSourceId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getJdbcUrl() {
		return jdbcUrl;
	}

	public void setJdbcUrl(String jdbcUrl) {
		this.jdbcUrl = jdbcUrl;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
