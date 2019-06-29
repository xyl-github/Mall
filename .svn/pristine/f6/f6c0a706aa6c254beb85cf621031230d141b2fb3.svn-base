package top.lin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import top.lin.entity.BusinessSite;
import top.lin.service.BusinessSiteService;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/24
 * Time: 16:12
 */
@Controller
@RequestMapping(value = "/doBusinessSite", produces = "application/json; charset=utf-8")
@ResponseBody
public class BusinessSiteController {

    @Autowired
    BusinessSiteService businessSiteService;

    @RequestMapping("/find")
    public String find(@RequestParam("shopId") Integer id) {
        return businessSiteService.inquireBusinessSiteByShopid(id);
    }

    @RequestMapping("/findById")
    public String findById(@RequestParam("id") Integer id) {
        return businessSiteService.inquireBusinessSiteByBsid(id);
    }

    @RequestMapping("/add")
    public String add(@RequestParam("shopId") Integer sid, @RequestParam("name") String sname,
                      @RequestParam("status") Integer status, @RequestParam("introduce") String introduce) {
        return businessSiteService.insertBusinessSite(getBusinessSite(null, sid, sname, status, introduce));
    }

    @RequestMapping("/change")
    public String change(@RequestParam("id") Integer id, @RequestParam("shopId") Integer sid, @RequestParam("name") String sname,
                         @RequestParam("status") Integer status, @RequestParam("introduce") String introduce) {
        return businessSiteService.updateBusinessSite(getBusinessSite(id, sid, sname, status, introduce));
    }
    @RequestMapping("/delete")
    public String delete(@RequestParam("id") Integer id
                         ) {
        return businessSiteService.deleteBusinessSiteByBsid(id);
    }

    BusinessSite getBusinessSite(Integer bsid, Integer sid, String sname, Integer status, String introduce) {
        BusinessSite bs = new BusinessSite();
        bs.setBsid(bsid);
        bs.setShopid(sid);
        bs.setBsname(sname);
        bs.setStatus(status);
        bs.setIntroduce(introduce);
        return bs;
    }
}
