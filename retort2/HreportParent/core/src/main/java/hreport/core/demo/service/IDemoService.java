package hreport.core.demo.service;

import hreport.core.demo.dto.Demo;

import com.hand.hap.system.service.IBaseService;
import com.hand.hap.core.ProxySelf;

import com.hand.hap.core.IRequest;

import java.util.List;

/**
 * Created by hailor on 16/6/2.
 */
public interface IDemoService extends IBaseService<Demo>, ProxySelf<IDemoService> {


}
