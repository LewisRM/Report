package hreport.core.demo.dto;

import com.hand.hap.core.annotation.MultiLanguage;
import com.hand.hap.core.annotation.MultiLanguageField;
import com.hand.hap.system.dto.BaseDTO;

import javax.persistence.*;

/**
 * Created by hailor on 16/6/2.
 */
@Table(name = "hap_demo")
public class Demo  extends BaseDTO {
    @Id
    @GeneratedValue
    private  Long id;

    private String name;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
