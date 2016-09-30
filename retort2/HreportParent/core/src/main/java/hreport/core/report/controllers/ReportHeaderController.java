package hreport.core.report.controllers;



import hreport.core.report.dto.QueryParams;
import hreport.core.report.dto.ReportDataSource;
import hreport.core.report.dto.ReportHeader;
import hreport.core.report.dto.ReportLine;
import hreport.core.report.service.IQueryParamsService;
import hreport.core.report.service.IReportHeaderService;
import hreport.core.report.service.IReportLineService;
import hreport.core.report.utils.DataSourceFactory;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

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
 * @description 报表头Controller
 * @author qiuzheng.wang@hand-china.com 2016年9月5日下午3:40:20
 * @version 1.0
 */
@RestController
@RequestMapping("/rep/reportHeader")
public class ReportHeaderController extends BaseController{

	@Resource
	private IReportHeaderService reportHeaderService;
	@Resource
	private IQueryParamsService queryParamsService;
	@Resource
	private IReportLineService reportLineService;
	
    /**
     * <p>
     * 分页查询
     * </p>
     * @param example
     * 			保存查询条件
     *  * @param page
     * 			第几页
     *  * @param pagesize
     * 			每页几条记录
     * @return ResponseData
     * 			查询结果
     */
	@RequestMapping(value = "/query", method = RequestMethod.POST)
    public @ResponseBody
    ResponseData query(HttpServletRequest request, ReportHeader example,
                       @RequestParam(defaultValue = DEFAULT_PAGE) int page,
                       @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pagesize) {
        IRequest iRequest = createRequestContext(request);
        return new ResponseData(reportHeaderService.select(iRequest, example, page, pagesize));
    }
	
	
    /**
     * <p>
     * 修改方法
     * </p>
     * @param reportHeaderList
     * 			修改内容
     * @return ResponseData
     * 			修改结果
     */
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData submit(HttpServletRequest request, @RequestBody List<ReportHeader> reportHeaderList,
            BindingResult result) {
        getValidator().validate(reportHeaderList, result);
        if (result.hasErrors()) {
            ResponseData rs = new ResponseData(false);
            rs.setMessage(getErrorMessage(result, request));
            return rs;
        }
        IRequest iRequest = createRequestContext(request);
        return new ResponseData(reportHeaderService.batchUpdate(iRequest, reportHeaderList));
    }
	
	
    /**
     * <p>
     * 删除方法
     * </p>
     * @param flexVsetList
     * 			修改内容
     * @return ResponseData
     * 			删除结果
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData delete(HttpServletRequest request, @RequestBody List<ReportHeader> reportHeaderList) {
    	
    	reportHeaderService.batchDelete(reportHeaderList);
        return new ResponseData();
    }
    
    /**
     * <p>
     * 获取报表结果
     * </p>
     * @param headerId
     * 			报表头id
     * @param dsId
     * 			数据源id
     * @param sql
     * 			查询sql语句
     * @return ResponseData
     * 			删除结果
     */
    @RequestMapping("/getReportDataSource")
	@ResponseBody
    public List<ReportDataSource> getReportDataSource(Long headerId,Long dsId,String sql){
    	List<ReportDataSource> datas=reportHeaderService.getReportDataSource(headerId, dsId, sql);
		return datas;
    }
    
    /**
     * <p>
     * 通过id查询报表头
     * </p>
     * @param id
     * 			报表头id
     * @return ResponseData
     * 			删除结果
     */
    @RequestMapping("/getById")
	@ResponseBody
    public ReportHeader getById(Long id,HttpServletRequest request){
    	IRequest iRequest = createRequestContext(request);
    	ReportHeader header=new ReportHeader();
    	header.setRepHeaderId(id);
    	header=reportHeaderService.selectByPrimaryKey(iRequest, header);
    	return header;
    }
    
    /**
     * <p>
     * 添加报表页面
     * </p>
     * @param headerId
     * 			报表头id
     * @return ResponseData
     * 			删除结果
     */
    @RequestMapping("/addReport")
	@ResponseBody
    public void addReport(Long headerId,HttpServletRequest request)
    {
    	IRequest iRequest = createRequestContext(request);
    	reportHeaderService.addReport(headerId, iRequest);
    }
}
