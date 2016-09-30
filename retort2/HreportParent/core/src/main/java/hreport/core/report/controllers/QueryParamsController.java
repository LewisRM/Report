package hreport.core.report.controllers;

import hreport.core.report.dto.DropList;
import hreport.core.report.dto.QueryParams;
import hreport.core.report.service.IQueryParamsService;
import hreport.core.report.utils.DataSourceFactory;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hand.hap.core.IRequest;
import com.hand.hap.system.controllers.BaseController;
import com.hand.hap.system.dto.ResponseData;

/**
 * @name QueryParamsController
 * @description 报表参数Controller
 * @author qiuzheng.wang@hand-china.com 2016年9月5日下午3:40:20
 * @version 1.0
 */
@RestController
@RequestMapping("/rep/queryParams")
public class QueryParamsController extends BaseController{

	@Resource
	private IQueryParamsService queryParamsService;

    /**
     * <p>
     * 通过报表头查询所有参数
     * </p>
     * @param headerId
     * 			报表头id
     * @return ResponseData
     * 			修改结果
     */
	@RequestMapping("/getParamsByHeaderId")
	@ResponseBody
	public ResponseData getParamsByHeaderId(Long headerId)
	{
		List<QueryParams> list=queryParamsService.getParamsByHeaderId(headerId);
		return new ResponseData(list);
	}
	
    /**
     * <p>
     * 修改方法
     * </p>
     * @param queryParamsList
     * 			修改内容
     * @return ResponseData
     * 			修改结果
     */
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData submit(HttpServletRequest request, @RequestBody List<QueryParams> queryParamsList,
            BindingResult result) {
		
        getValidator().validate(queryParamsList, result);
        if (result.hasErrors()) {
            ResponseData rs = new ResponseData(false);
            rs.setMessage(getErrorMessage(result, request));
            return rs;
        }
        IRequest iRequest = createRequestContext(request);
        return new ResponseData(queryParamsService.batchUpdate(iRequest, queryParamsList));
    }
	
    /**
     * <p>
     *	自动解析后保存方法
     * </p>
     * @param params
     * 			保存内容
     * @return List<QueryParams>
     * 			保存结果
     */
	@RequestMapping(value = "/saveParams", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData saveParams(@RequestBody List<QueryParams> params)
	{	
		ResponseData response=queryParamsService.savaParams(params);
		return response;
	}
	
	
    /**
     * <p>
     *	获取下拉框数据
     * </p>
     * @param sql
     * 			下拉框数据查询sql语句
     * @param dsId
     * 			数据源id
     * @return List<DropList>
     * 			查询结果
     */
	@RequestMapping("/getParamsValue")
	@ResponseBody
	public List<DropList> getParamsValue(String sql,Long dsId) 
	{
		List<DropList> list=DataSourceFactory.getParamsValue(sql, dsId);
		return list;
	}
	
    /**
     * <p>
     *	获取参数默认值数据
     * </p>
     * @param sql
     * 			参数默认值数据查询sql语句
     * @param dsId
     * 			数据源id
     * @return List<DropList>
     * 			查询结果
     */
	@RequestMapping("/getDefaultValue")
	@ResponseBody
	public List<DropList> getDefaultValue(String sql,Long dsId) 
	{
		List<DropList> list=DataSourceFactory.getDefaultValue(sql, dsId);
		return list;
	}


}
