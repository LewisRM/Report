package hreport.core.demo.controllers;

import hreport.core.demo.dto.Demo;
import hreport.core.demo.service.IDemoService;

import com.hand.hap.core.IRequest;
import com.hand.hap.system.controllers.BaseController;
import com.hand.hap.system.dto.ResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by hailor on 16/6/2.
 */
@Controller
public class DemoController  extends BaseController{

    @Autowired
    private IDemoService demoService;

    @RequestMapping("/demo/query")
    @ResponseBody
    public ResponseData selectList(HttpServletRequest request, Demo condition,
                                   @RequestParam(defaultValue = DEFAULT_PAGE) int page,
                                   @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pagesize) {
        IRequest iRequest = createRequestContext(request);
        List<Demo> datas = demoService.select(iRequest, condition, page, pagesize);
        return new ResponseData(datas);
    }

    @RequestMapping(value = "/demo/submit", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData submit(HttpServletRequest request, @RequestBody List<Demo> demos) {
        IRequest iRequest = createRequestContext(request);
        List<Demo> datas = demoService.batchUpdate(iRequest, demos);
        return new ResponseData(datas);
    }

    @RequestMapping(value = "/demo/delete", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData delete(HttpServletRequest request, @RequestBody List<Demo> demos) {
        IRequest iRequest = createRequestContext(request);
        demoService.batchDelete(demos);
        return new ResponseData();
    }
}
