package hreport.core.report.controllers;



import java.util.List;

import hreport.core.report.dto.DataSource;
import hreport.core.report.dto.FlexVset;
import hreport.core.report.dto.ReportDataSource;
import hreport.core.report.service.IFlexVsetService;

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
 * @name FlexVsetController
 * @description 值集头处理Controller
 * @author qiuzheng.wang@hand-china.com
 * @version 1.0
 */
@Controller
@RequestMapping("/rep/flexVset")
public class FlexVsetController extends BaseController {
	@Autowired
	private IFlexVsetService flexVsetService;


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
    ResponseData query(HttpServletRequest request, FlexVset example,
                       @RequestParam(defaultValue = DEFAULT_PAGE) int page,
                       @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pagesize) {
        IRequest iRequest = createRequestContext(request);
        return new ResponseData(flexVsetService.select(iRequest, example, page, pagesize));
    }
	
    /**
     * <p>
     * 修改方法
     * </p>
     * @param flexVsetList
     * 			修改内容
     * @return ResponseData
     * 			修改结果
     */
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData submit(HttpServletRequest request, @RequestBody List<FlexVset> flexVsetList,
            BindingResult result) {
        getValidator().validate(flexVsetList, result);
        if (result.hasErrors()) {
            ResponseData rs = new ResponseData(false);
            rs.setMessage(getErrorMessage(result, request));
            return rs;
        }
        IRequest iRequest = createRequestContext(request);
        return new ResponseData(flexVsetService.batchUpdate(iRequest, flexVsetList));
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
    public ResponseData delete(HttpServletRequest request, @RequestBody List<FlexVset> flexVsetList) {
    	flexVsetService.batchDelete(flexVsetList);
        return new ResponseData();
    }
    
    /**
     * <p>
     * 通过值集id查询值集
     * </p>
     * @param vsetId
     * 			值集id
     * @return FlexVset
     * 			查询结果
     */
    @RequestMapping("/getByVsetId")
    @ResponseBody
    public FlexVset getByVsetId(HttpServletRequest request,Long vsetId)
    {
    	IRequest iRequest = createRequestContext(request);
    	FlexVset vset=new FlexVset();
    	vset.setFlexValueSetId(vsetId);
    	return flexVsetService.selectByPrimaryKey(iRequest, vset);
    }
    /**
     * <p>
     * 通过值集条件修改值集
     * </p>
     * @param vset
     * 			存放修改条件
     */
    @RequestMapping(value = "/updateVset", method = RequestMethod.POST)
    @ResponseBody
    public void updateVset(HttpServletRequest request,@RequestBody FlexVset vset)
    {
    	IRequest iRequest = createRequestContext(request);
    	flexVsetService.updateByPrimaryKeySelective(iRequest, vset);
    }
    /**
     * <p>
     * 查询值集的结果
     * </p>
     * @param vsetId
     * 			值集id
     * @param dsId
     * 			数据源id
     * @param sql
     * 			查询sql语句
     * @return List<ReportDataSource>
     * 			查询结果
     */
    @RequestMapping("/getLovDataSource")
	@ResponseBody
    public List<ReportDataSource> getLovDataSource(Long vsetId,Long dsId,String sql){
    	List<ReportDataSource> datas=flexVsetService.getLovDataSource(vsetId, dsId, sql);
		return datas;
    }
	
}
