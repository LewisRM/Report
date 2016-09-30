package hreport.core.report.controllers;



import java.util.List;

import hreport.core.report.dto.FlexVset;
import hreport.core.report.dto.ValidateTable;
import hreport.core.report.service.IValidateTableService;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
 * @name QueryParamsController
 * @description 值集行Controller
 * @author qiuzheng.wang@hand-china.com 2016年9月5日下午3:40:20
 * @version 1.0
 */
@Controller
@RequestMapping("/rep/validateTable")
public class ValidateTableController extends BaseController{

	@Autowired
	private IValidateTableService validationTableService;

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
    ResponseData query(HttpServletRequest request, ValidateTable example,
                       @RequestParam(defaultValue = DEFAULT_PAGE) int page,
                       @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pagesize) {
        IRequest iRequest = createRequestContext(request);
        return new ResponseData(validationTableService.select(iRequest, example, page, pagesize));
    }
	
    /**
     * <p>
     * 修改方法
     * </p>
     * @param validateTableList
     * 			修改内容
     * @return ResponseData
     * 			修改结果
     */
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData submit(HttpServletRequest request, @RequestBody List<ValidateTable> validateTableList,
            BindingResult result) {
        getValidator().validate(validateTableList, result);
        if (result.hasErrors()) {
            ResponseData rs = new ResponseData(false);
            rs.setMessage(getErrorMessage(result, request));
            return rs;
        }
        IRequest iRequest = createRequestContext(request);
        return new ResponseData(validationTableService.batchUpdate(iRequest, validateTableList));
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
    public ResponseData delete(HttpServletRequest request, @RequestBody List<ValidateTable> validateTableList) {
    	validationTableService.batchDelete(validateTableList);
        return new ResponseData();
    }
    /**
     * <p>
     * 通过值集id查询所有值集的行
     * </p>
     * @param vsetId
     * 			值集id
     * @return List<ValidateTable>
     * 			查询结果
     */
    @RequestMapping("/getByVsetId")
    @ResponseBody
    public List<ValidateTable> getByVsetId(Long vsetId)
    {
    	List<ValidateTable> list=validationTableService.getByFlexValueSetId(vsetId);
    	return list;
    }
	
}
