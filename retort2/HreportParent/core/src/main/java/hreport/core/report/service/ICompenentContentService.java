package hreport.core.report.service;

import hreport.core.report.dto.CompenentContent;

import java.util.List;

import com.hand.hap.core.IRequest;
import com.hand.hap.core.ProxySelf;
import com.hand.hap.system.dto.CodeValue;
import com.hand.hap.system.service.IBaseService;

/**
 * @name ICompenentContentService
 * @description 快码与下拉控件绑定Service
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
public interface ICompenentContentService extends IBaseService<CompenentContent>, ProxySelf<ICompenentContentService> {

	public List<CodeValue> getByCompentent(IRequest request,String code,String compenent); 
}
