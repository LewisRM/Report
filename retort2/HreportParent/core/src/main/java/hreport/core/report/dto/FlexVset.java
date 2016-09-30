package hreport.core.report.dto;


import java.util.List;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.hand.hap.core.annotation.Children;
import com.hand.hap.core.annotation.MultiLanguage;
import com.hand.hap.core.annotation.MultiLanguageField;
import com.hand.hap.system.dto.BaseDTO;

/**
 * @name FlexVset
 * @description 值集头表DTO
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
@Table(name = "REP_FLEX_VSET_B")
@MultiLanguage
public class FlexVset extends BaseDTO {
	private static final long serialVersionUID = -1420922385880806027L;
	@Id
	@GeneratedValue(generator = GENERATOR_TYPE)
	@Column
	private Long flexValueSetId;
	@Column
	private String flexValueSetName;
	@Column
	private String validationType;
	@Column
	@MultiLanguageField
	private String description;
	@Column
	private String tableName;
	@Column
	private String whereCondition;
	@Column
	private Long width;
	@Column
	private Long height;
	@Column
	private String title;
	@Column
	private String delayedLoadingFlag;
	@Column
	private String enabledFlag;
	@Column
	private Long objectVersionNumber;

	@Transient
	@Children
	private List<ValidateTable> ValidationTables;

	@Transient
	private String validationTypeMeaning;
//	@Transient
//	@Children
//	private List<FlexValue> flexValues;

	@Column
	private String expandMethod;

	public String getExpandMethod() {
		return expandMethod;
	}

	public void setExpandMethod(String expandMethod) {
		this.expandMethod = expandMethod;
	}

	public Long getFlexValueSetId() {
		return flexValueSetId;
	}

	public String getValidationTypeMeaning() {
		return validationTypeMeaning;
	}

	public void setValidationTypeMeaning(String validationTypeMeaning) {
		this.validationTypeMeaning = validationTypeMeaning;
	}

	public List<ValidateTable> getValidationTables() {
		return ValidationTables;
	}

	public void setValidationTables(List<ValidateTable> validationTables) {
		ValidationTables = validationTables;
	}

	public void setFlexValueSetId(Long flexValueSetId) {
		this.flexValueSetId = flexValueSetId;
	}

//	public List<FlexValue> getFlexValues() {
//		return flexValues;
//	}
//
//	public void setFlexValues(List<FlexValue> flexValues) {
//		this.flexValues = flexValues;
//	}

	public String getFlexValueSetName() {
		return flexValueSetName;
	}

	public void setFlexValueSetName(String flexValueSetName) {
		this.flexValueSetName = flexValueSetName;
	}

	public String getValidationType() {
		return validationType;
	}

	public void setValidationType(String validationType) {
		this.validationType = validationType;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getWhereCondition() {
		return whereCondition;
	}

	public void setWhereCondition(String whereCondition) {
		this.whereCondition = whereCondition;
	}

	public Long getWidth() {
		return width;
	}

	public void setWidth(Long width) {
		this.width = width;
	}

	public Long getHeight() {
		return height;
	}

	public void setHeight(Long height) {
		this.height = height;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDelayedLoadingFlag() {
		return delayedLoadingFlag;
	}

	public void setDelayedLoadingFlag(String delayedLoadingFlag) {
		this.delayedLoadingFlag = delayedLoadingFlag;
	}

	public String getEnabledFlag() {
		return enabledFlag;
	}

	public void setEnabledFlag(String enabledFlag) {
		this.enabledFlag = enabledFlag;
	}

	public Long getObjectVersionNumber() {
		return objectVersionNumber;
	}

	public void setObjectVersionNumber(Long objectVersionNumber) {
		this.objectVersionNumber = objectVersionNumber;
	}

}
