package hreport.core.report.controllers;

import hreport.core.report.dto.ReportHeader;
import hreport.core.report.dto.ReportLine;
import hreport.core.report.service.IReportLineService;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hand.hap.core.IRequest;
import com.hand.hap.system.controllers.BaseController;
import com.hand.hap.system.dto.ResponseData;
/**
 * @name QueryParamsController
 * @description 报表列Controller
 * @author qiuzheng.wang@hand-china.com 2016年9月5日下午3:40:20
 * @version 1.0
 */
@RestController
@RequestMapping("/rep/reportLine")
public class ReportLineController extends BaseController{

	@Resource
	private IReportLineService reportLineService;
	
    /**
     * <p>
     * 解析列信息
     * </p>
     * @param reportHeader
     * 			报表头
     * @return ResponseData
     * 			查询结果
     */
	@ResponseBody 
	@RequestMapping("/getLines")
	public ResponseData getLines(ReportHeader reportHeader)
	{
		String sql=reportHeader.getSqlText();
		Long dsId=reportHeader.getDsId();
		Long headerId=reportHeader.getRepHeaderId();
		ResponseData response=reportLineService.getLines(sql, dsId,headerId);
		return response;
	}
	
    /**
     * <p>
     * 通过报表头查询所有列
     * </p>
     * @param headerId
     * 			报表头id
     * @return List<ReportLine>
     * 			查询结果
     */
	@ResponseBody 
	@RequestMapping("/getLinesByHeaderId")
	public List<ReportLine> getLinesByHeaderId(Long headerId)
	{
		List<ReportLine> list=reportLineService.getLinesByHeaderId(headerId);
		return list;
	}
	
	
    /**
     * <p>
     * 修改方法
     * </p>
     * @param reportLineList
     * 			修改内容
     * @return ResponseData
     * 			修改结果
     */
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData submit(HttpServletRequest request, @RequestBody List<ReportLine> reportLineList,
            BindingResult result) {

        getValidator().validate(reportLineList, result);
        if (result.hasErrors()) {
            ResponseData rs = new ResponseData(false);
            rs.setMessage(getErrorMessage(result, request));
            return rs;
        }
        IRequest iRequest = createRequestContext(request);
        return new ResponseData(reportLineService.batchUpdate(iRequest, reportLineList));
    }
	
}
