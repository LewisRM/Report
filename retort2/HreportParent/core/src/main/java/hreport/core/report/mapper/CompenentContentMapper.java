package hreport.core.report.mapper;

import java.util.List;

import hreport.core.report.dto.CompenentContent;

import com.hand.hap.mybatis.common.Mapper;

/**
 * @name ICompenentContentService
 * @description 快码与下拉控件绑定Service
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
public interface CompenentContentMapper extends Mapper<CompenentContent> {
	
	public List<CompenentContent> getByCompentent(String compenent); 
}
