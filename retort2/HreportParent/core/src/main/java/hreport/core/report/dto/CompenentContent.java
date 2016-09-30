package hreport.core.report.dto;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.hand.hap.system.dto.BaseDTO;
/**
 * @name CompenentContent
 * @description 下拉内容与下拉控件关联DTO
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
@Table(name = "rep_compenent_content")
public class CompenentContent extends BaseDTO implements Serializable{

	
	@Id
    @Column
    @GeneratedValue
	private Long mapperId;
	
	@Column
	private String compenent;
	
	@Column
	private String content;

	public Long getMapperId() {
		return mapperId;
	}

	public void setMapperId(Long mapperId) {
		this.mapperId = mapperId;
	}

	public String getCompenent() {
		return compenent;
	}

	public void setCompenent(String compenent) {
		this.compenent = compenent;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
