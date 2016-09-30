package hreport.core.report.controllers;

import hreport.core.report.dto.DataSource;
import hreport.core.report.service.IDataSourceService;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hand.hap.core.IRequest;
import com.hand.hap.system.controllers.BaseController;
import com.hand.hap.system.dto.ResponseData;

/**
 * Created by hailor on 16/6/2.
 */
@Controller
@RequestMapping("/rep/dataSource")
public class DataSourceController  extends BaseController{


	@Resource
	private IDataSourceService dateSourceService;
	
	
	@RequestMapping(value = "/query", method = RequestMethod.POST)
    public @ResponseBody
    ResponseData query(HttpServletRequest request, DataSource example,
                       @RequestParam(defaultValue = DEFAULT_PAGE) int page,
                       @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pagesize) {
        IRequest iRequest = createRequestContext(request);
        return new ResponseData(dateSourceService.select(iRequest, example, page, pagesize));
    }
	
	
	
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData submit(HttpServletRequest request, @RequestBody List<DataSource> dataSourceList,
            BindingResult result) {
        getValidator().validate(dataSourceList, result);
        if (result.hasErrors()) {
            ResponseData rs = new ResponseData(false);
            rs.setMessage(getErrorMessage(result, request));
            return rs;
        }
        IRequest iRequest = createRequestContext(request);
        return new ResponseData(dateSourceService.batchUpdate(iRequest, dataSourceList));
    }
	
	

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData delete(HttpServletRequest request, @RequestBody List<DataSource> dataSourceList) {
    	dateSourceService.batchDelete(dataSourceList);
        return new ResponseData();
    }
    
    @RequestMapping(value = "/test", method = RequestMethod.POST)
    @ResponseBody
    public int test(@RequestBody DataSource dataSource) {
        return dateSourceService.testConnection(dataSource);
    }
}
