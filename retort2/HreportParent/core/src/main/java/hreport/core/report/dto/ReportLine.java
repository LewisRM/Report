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
 * @name ReportLine
 * @description 报表列DTO
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
@Table(name = "rep_report_line_b")
@MultiLanguage
public class ReportLine extends BaseDTO implements Serializable{

	@Id
    @Column
    @GeneratedValue
	private Long repLineId;
	
	@Column(name="rep_header_id")
	private Long headerId;
	
	@Column(name="column_name")
	private String columnName;
	
	@Column
	@MultiLanguageField
	private String name;
	
	@Column
	private String type;
	
	@Column(name="data_type")
	private String dataType;
	
	@Column(name="column_width")
	private Integer columnWidth;
	
	@Column(name="display_width")
	private Integer displayWidth;
	
	@Column
	private String format;
	
	@Column
	private String sort;
	
	@Column
	private String display;

	public ReportLine() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Long getRepLineId() {
		return repLineId;
	}

	public void setRepLineId(Long repLineId) {
		this.repLineId = repLineId;
	}

	public Long getHeaderId() {
		return headerId;
	}

	public void setHeaderId(Long headerId) {
		this.headerId = headerId;
	}

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public Integer getColumnWidth() {
		return columnWidth;
	}

	public void setColumnWidth(Integer columnWidth) {
		this.columnWidth = columnWidth;
	}

	public Integer getDisplayWidth() {
		return displayWidth;
	}

	public void setDisplayWidth(Integer displayWidth) {
		this.displayWidth = displayWidth;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getDisplay() {
		return display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


}
