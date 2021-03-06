package top.lin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/22
 * Time: 11:55
 */

@Controller
@RequestMapping("/page")
public class PageController {

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("basicOperation")
    public String basicOperation(){
        return "basicOperation";
    }

    @RequestMapping("permission")
    public String permission(){
        return "permission";
    }

    @RequestMapping("shopManage")
    public String shopManage(){
        return "shopManage";
    }

    @RequestMapping("businessPlace")
    public String businessPlace(){
        return "businessPlace";
    }

    @RequestMapping("category")
    public String category(){
        return "category";
    }

    @RequestMapping("floorPlane")
    public String floorPlane(){
        return "floorPlane";
    }

    @RequestMapping("brand")
    public String brand(){
        return "brand";
    }

    @RequestMapping("shops")
    public String shops(){
        return "shops";
    }

    @RequestMapping("shopType")
    public String shopType(){
        return "shopType";
    }

    @RequestMapping("publicServiceType")
    public String publicServiceType(){
        return "publicServiceType";
    }

    @RequestMapping("publicServicePlaces")
    public String publicServicePlaces(){
        return "publicServicePlaces";
    }

    @RequestMapping("parkinglotPlaces")
    public String parkinglotPlaces(){
        return "parkinglotPlaces";
    }

    @RequestMapping("parkingspace")
    public String parkingspace(){
        return "parkingspace";
    }

    @RequestMapping("coupon")
    public String coupon(){
        return "coupon";
    }

    @RequestMapping("game")
    public String game(){
        return "game";
    }

    @RequestMapping("notification")
    public String notification(){
        return "notification";
    }

    @RequestMapping("comment")
    public String comment(){
        return "comment";
    }

    @RequestMapping("feedback")
    public String feedback(){
        return "feedback";
    }

    @RequestMapping("banner")
    public String banner(){
        return "banner";
    }

    @RequestMapping("linkConfig")
    public String linkConfig(){
        return "linkConfig";
    }

    @RequestMapping("broadcast")
    public String broadcast(){
        return "broadcast";
    }

    @RequestMapping("advertise")
    public String advertise(){
        return "advertise";
    }

    @RequestMapping("navigate")
    public String navigate(){
        return "navigate";
    }

    @RequestMapping("floorManage")
    public String floorManage(){
        return "floorManage";
    }

    @RequestMapping("index")
    public String index(){
        return "index";
    }
}
