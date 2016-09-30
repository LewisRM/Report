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
 * @name QueryParams
 * @description 报表参数DTO
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
@Table(name = "rep_query_params_b")
@MultiLanguage
public class QueryParams extends BaseDTO implements Serializable,Cloneable{

	@Id
    @Column
    @GeneratedValue
	private Long queryParamsId;
	
	@Column(name="rep_header_id")
	private Long headerId;
	
	@Column
	private String paramsName;
	
	@Column
	@MultiLanguageField
	private String name;
	
	@Column
	private String text;
	
	@Column
	private String defaultType;
	
	@Column
	private String defaultValue;
	
	@Column
	private String defaultText;
	
	@Column
	private String dataType;
	
	@Column
	private Integer width;
	
	@Column
	private Integer showWidth;
	
	@Column
	private String formElement;
	
	@Column
	private String contentSource;
	
	@Column
	private String content;
	
	@Column
	private String required;
	
	@Column
	private String display;
	
	
	public QueryParams() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Long getQueryParamsId() {
		return queryParamsId;
	}


	public void setQueryParamsId(Long queryParamsId) {
		this.queryParamsId = queryParamsId;
	}

	public Long getHeaderId() {
		return headerId;
	}


	public void setHeaderId(Long headerId) {
		this.headerId = headerId;
	}



	public String getParamsName() {
		return paramsName;
	}


	public void setParamsName(String paramsName) {
		this.paramsName = paramsName;
	}


	public String getText() {
		return text;
	}


	public void setText(String text) {
		this.text = text;
	}


	public String getDefaultType() {
		return defaultType;
	}


	public void setDefaultType(String defaultType) {
		this.defaultType = defaultType;
	}


	public String getDefaultValue() {
		return defaultValue;
	}


	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}


	public String getDefaultText() {
		return defaultText;
	}


	public void setDefaultText(String defaultText) {
		this.defaultText = defaultText;
	}


	public String getDataType() {
		return dataType;
	}


	public void setDataType(String dataType) {
		this.dataType = dataType;
	}


	public Integer getWidth() {
		return width;
	}


	public void setWidth(Integer width) {
		this.width = width;
	}


	public Integer getShowWidth() {
		return showWidth;
	}


	public void setShowWidth(Integer showWidth) {
		this.showWidth = showWidth;
	}


	public String getFormElement() {
		return formElement;
	}


	public void setFormElement(String formElement) {
		this.formElement = formElement;
	}


	public String getContentSource() {
		return contentSource;
	}


	public void setContentSource(String contentSource) {
		this.contentSource = contentSource;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getRequired() {
		return required;
	}


	public void setRequired(String required) {
		this.required = required;
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


	 @Override  
	    public Object clone() throws CloneNotSupportedException {  
	        return super.clone();  
	    }  

	
	
}
