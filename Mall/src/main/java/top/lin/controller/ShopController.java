package top.lin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import top.lin.entity.Shop;
import top.lin.service.ShopService;
import top.lin.utils.QRCodeUtil;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/24
 * Time: 11:53
 */
@Controller
@ResponseBody
@RequestMapping(value = "/shopAdmin", produces = "application/json; charset=utf-8")
public class ShopController {

    @Autowired
    ShopService shopService;

    @RequestMapping("/find")
    public String find() {
        return shopService.inquireAllShop();
    }

    @RequestMapping("/findById")
    public String findById(@RequestParam("id") Integer sid){
        return shopService.inquireShopById(sid);
    }

    @RequestMapping("add")
    public String add(@RequestParam(value = "id", required = false) Integer id,
                      @RequestParam("name") String name,
                      @RequestParam("address") String address,
                      @RequestParam("tel") String tel,
                      @RequestParam("businessHours") String businessHours,
                      @RequestParam("longitude") Double longitude,
                      @RequestParam("latitude") Double latitude,
                      @RequestParam("Images") String image,
                      @RequestParam("status") Integer status,
                      @RequestParam("hotSearch") String hotSearch) {
        Shop shop = getShop(id, name, address, tel, businessHours, longitude, latitude, image, status, hotSearch);
        shop.setQrcodeImage(QRCodeUtil.saveQRCodeImage(shop));
        return shopService.insertOrUpdateShop(shop);

    }

    @RequestMapping("/deleteShop")
    public String deleteShop(@RequestParam("id") Integer id) {
        return shopService.deleteShopBySid(id);
    }


    Shop getShop(Integer id, String name, String address, String tel, String businessHours,
                 Double longitude, Double latitude, String image, Integer status, String hotSearch) {
        Shop shop = new Shop();
        shop.setSid(id);
        shop.setSname(name);
        shop.setAddress(address);
        shop.setTel(tel);
        shop.setBusinessHours(businessHours);
        shop.setLongitude(longitude);
        shop.setLatitude(latitude);
        shop.setImage(image);
        shop.setStatus(status);
        shop.setHotSearch(hotSearch);
        return shop;
    }
}
