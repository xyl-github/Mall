package top.lin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import top.lin.service.BrandService;

@Controller
@RequestMapping("shopAdmin1")
@ResponseBody
public class TestController {

    @Autowired
    BrandService brandService;

    @RequestMapping("find")
    public String finds() {
        System.out.println("shopAdmin1的find方法");
        return "shopManage";
    }
}
