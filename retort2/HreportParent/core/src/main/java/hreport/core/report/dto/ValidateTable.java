package hreport.core.report.dto;



import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.hand.hap.core.annotation.MultiLanguage;
import com.hand.hap.core.annotation.MultiLanguageField;
import com.hand.hap.system.dto.BaseDTO;


/**
 * @name ValidateTable
 * @description 表值集行表DTO
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
@Table(name = "rep_validate_table_b")
@MultiLanguage
public class ValidateTable extends BaseDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6822172005689887344L;

	@Id
	@Column
	@GeneratedValue(generator = GENERATOR_TYPE)
	private Long validateTableId;
	@Column
	@NotNull
	private Long flexValueSetId;
	@Column
	@NotEmpty
	private String columnName;
	@Column
	private String columnFlag;
	@Column
	@MultiLanguageField
	private String description;
	@Column
	private String valueField;
	@Column
	private String textField;
	@Column
	private String hiddenFlag;
	@Column
	private String algin;
	@Column
	private String enabledFlag;
	@Column
	private String conditionFlag;
	@Column
	private Integer width;
	@Column
	private String columnAlias;

	/*
	 * @Column private Long createdBy;
	 * 
	 * public Long getCreatedBy() { return createdBy; }
	 * 
	 * public void setCreatedBy(Long createdBy) { this.createdBy = createdBy; }
	 */

	public Integer getWidth() {
		return width;
	}

	public String getColumnAlias() {
		return columnAlias;
	}

	public void setColumnAlias(String columnAlias) {
		this.columnAlias = columnAlias;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public String getConditionFlag() {
		return conditionFlag;
	}

	public void setConditionFlag(String conditionFlag) {
		this.conditionFlag = conditionFlag;
	}

	public Long getValidateTableId() {
		return validateTableId;
	}

	public void setValidateTableId(Long validateTableId) {
		this.validateTableId = validateTableId;
	}

	public Long getFlexValueSetId() {
		return flexValueSetId;
	}

	public void setFlexValueSetId(Long flexValueSetId) {
		this.flexValueSetId = flexValueSetId;
	}

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getColumnFlag() {
		return columnFlag;
	}

	public void setColumnFlag(String columnFlag) {
		this.columnFlag = columnFlag;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getValueField() {
		return valueField;
	}

	public void setValueField(String valueField) {
		this.valueField = valueField;
	}

	public String getTextField() {
		return textField;
	}

	public void setTextField(String textField) {
		this.textField = textField;
	}

	public String getHiddenFlag() {
		return hiddenFlag;
	}

	public void setHiddenFlag(String hiddenFlag) {
		this.hiddenFlag = hiddenFlag;
	}

	public String getAlgin() {
		return algin;
	}

	public void setAlgin(String algin) {
		this.algin = algin;
	}

	public String getEnabledFlag() {
		return enabledFlag;
	}

	public void setEnabledFlag(String enabledFlag) {
		this.enabledFlag = enabledFlag;
	}

}
