package hreport.core.report.service.impl;

import hreport.core.report.dto.CompenentContent;
import hreport.core.report.mapper.CompenentContentMapper;
import hreport.core.report.service.ICompenentContentService;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.hap.core.IRequest;
import com.hand.hap.system.dto.CodeValue;
import com.hand.hap.system.service.ICodeService;
import com.hand.hap.system.service.impl.BaseServiceImpl;

/**
 * @name CompenentContentServiceImpl
 * @description 快码与下拉控件绑定Service
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
@Transactional
@Service
public class CompenentContentServiceImpl extends BaseServiceImpl<CompenentContent> implements ICompenentContentService {

	@Resource
	private CompenentContentMapper compenentContentMapper;
	@Resource
	private ICodeService codeService;
	
    /**
     * <p>
     * 根据快码编号和控件类型查询快码意义
     * </p>
     * @param code
     * 			快码编号
     * @param compenent
     * 			控件类型
     * @return List<CodeValue>
     * 			快码的值集合
     */
	@Override
	public List<CodeValue> getByCompentent(IRequest request,String code,String compenent) {
		
		List<CodeValue> codeValues=codeService.selectCodeValuesByCodeName(request, code);
		List<CompenentContent> compenentContents=compenentContentMapper.getByCompentent(compenent);
		List<CodeValue> values=new ArrayList<CodeValue>();
		for(int i=0;i<codeValues.size();i++)
		{
			for(int j=0;j<compenentContents.size();j++)
			{
				if(codeValues.get(i).getValue().equals(compenentContents.get(j).getContent()))
				{
					values.add(codeValues.get(i));
				}
			}
		}
		return values;
	}
	
	

	

}
