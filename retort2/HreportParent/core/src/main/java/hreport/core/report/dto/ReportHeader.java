package hreport.core.report.dto;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.hand.hap.core.annotation.MultiLanguage;
import com.hand.hap.core.annotation.MultiLanguageField;
import com.hand.hap.system.dto.BaseDTO;
/**
 * @name ReportHeader
 * @description 报表头DTO
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
@Table(name = "rep_report_header_b")
@MultiLanguage
public class ReportHeader extends BaseDTO implements Serializable{



	@Id
    @Column
    @GeneratedValue(generator = GENERATOR_TYPE)
	private Long repHeaderId;
	
	@Column
	private Long dsId;
	
	@Column
	private String programName;
	
	@Column
	private String sqlText;
	
	@Column
	private String enable;

	@Column
	@MultiLanguageField
	private String name;
	


	public ReportHeader() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Long getRepHeaderId() {
		return repHeaderId;
	}

	public void setRepHeaderId(Long repHeaderId) {
		this.repHeaderId = repHeaderId;
	}


	public Long getDsId() {
		return dsId;
	}

	public void setDsId(Long dsId) {
		this.dsId = dsId;
	}

	public String getProgramName() {
		return programName;
	}

	public void setProgramName(String programName) {
		this.programName = programName;
	}

	public String getSqlText() {
		return sqlText;
	}

	public void setSqlText(String sqlText) {
		this.sqlText = sqlText;
	}

	public String getEnable() {
		return enable;
	}

	public void setEnable(String enable) {
		this.enable = enable;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	

}
