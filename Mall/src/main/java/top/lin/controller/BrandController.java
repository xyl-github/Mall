package top.lin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import top.lin.entity.Brand;
import top.lin.service.BrandService;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/25
 * Time: 11:23
 */
@Controller
@RequestMapping(value = "brandAdmin", produces = "application/json; charset=utf-8")
@ResponseBody
public class BrandController {

    @Autowired
    BrandService brandService;

    @RequestMapping("finds")
    public String finds(@RequestParam("shopId") Integer id) {
        return brandService.inquireBrandByShopid(id);
    }

    @RequestMapping("/findBrandById")
    public String findBrandByBid(@RequestParam("id") Integer bid){
        return brandService.inquireBrandByBid(bid);

    }

    @RequestMapping("add")
    public String add(@RequestParam(value = "id", required = false) Integer id,
                      @RequestParam("shopId") Integer sid,
                      @RequestParam("brandType") String type,
                      @RequestParam("logo") String logo,
                      @RequestParam("status") Integer status) {
        return brandService.insertOrUpdateBrand(getBrand(id, sid, type, logo, status));
    }

    @RequestMapping("delete")
    public String delete(@RequestParam("id") Integer id) {
        return brandService.deleteBrandByBid(id);
    }

    @RequestMapping("upload")
    public String upload(@RequestParam("file") MultipartFile file, @RequestParam("shopId") Integer id, HttpServletRequest request){
        return brandService.insertBrandByExcel(file, id);
    }


    Brand getBrand(Integer id, Integer sid, String type, String logo, Integer status) {
        Brand brand = new Brand();
        brand.setBid(id);
        brand.setShopid(sid);
        brand.setBname(type);
        brand.setLogo(logo);
        brand.setStatus(status);
        return brand;
    }
}
