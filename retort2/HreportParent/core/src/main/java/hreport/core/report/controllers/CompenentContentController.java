package hreport.core.report.controllers;

import hreport.core.report.service.ICompenentContentService;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hand.hap.core.IRequest;
import com.hand.hap.system.controllers.BaseController;
import com.hand.hap.system.dto.CodeValue;
import com.hand.hap.system.service.ICodeService;

/**
 * @name CompenentContentController
 * @description 快码与下拉控件绑定Controller
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
@Controller
@RequestMapping("/rep/compenentContent")
public class CompenentContentController  extends BaseController{

	@Resource
	private ICompenentContentService compenentContentService;
	@Resource
	private ICodeService codeService;
	
	
    /**
     * <p>
     * 根据快码编号查询快码意义
     * </p>
     * @param code
     * 			快码编号
     * @return List<CodeValue>
     * 			快码的值集合
     */
	@RequestMapping("/getCodeValuesByCode")
	@ResponseBody
	public List<CodeValue> getCodeValuesByCode(HttpServletRequest request,String code)
	{
		IRequest iRequest = createRequestContext(request);
		List<CodeValue> codeValues=codeService.selectCodeValuesByCodeName(iRequest, code);
		return codeValues;
	}
	
    /**
     * <p>
     * 通过控件名称查询快码意义
     * </p>
     * @param code
     * 			快码编号
     * @param formElement
     * 			控件名称
     * @return List<CodeValue>
     * 			快码的值集合
     */
	@RequestMapping("/getContentSourceByFormElement")
	@ResponseBody
	public List<CodeValue> getContentSourceByFormElement(HttpServletRequest request,String code,String formElement){
		IRequest iRequest = createRequestContext(request);
		List<CodeValue> list=compenentContentService.getByCompentent(iRequest, code, formElement);
		return list;
	}
	
	
	
	
}
