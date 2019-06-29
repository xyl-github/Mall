package top.lin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import top.lin.entity.Floor;
import top.lin.service.FloorService;
import top.lin.utils.QRCodeUtil;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/25
 * Time: 9:58
 */
@Controller
@RequestMapping(value = "floorAdmin", produces = "application/json; charset=utf-8")
@ResponseBody
public class FloorController {

    @Autowired
    FloorService floorService;

    @RequestMapping(value = "/find/{shopId}/floors")
    public String find(@PathVariable Integer shopId) {
        return floorService.inquireFloorByShopid(shopId);
    }

    @RequestMapping(value = "/findById")
    public String findById(@RequestParam("id") Integer fid) {
        return floorService.inquireFloorByFid(fid);
    }

    @RequestMapping("/add")
    public String add(@RequestParam("shopId") Integer shopid,
                      @RequestParam("name") String name,
                      @RequestParam("imageUrl") String image,
                      @RequestParam("floor") Integer floor,
                      @RequestParam("doBusinessSiteId") Integer bsid,
                      @RequestParam("status") Integer status,
                      @RequestParam("display") Integer display) {
        Floor floor1 = getFloor(null, name, image, floor, bsid, status, display);
        floor1.setQrcodeImage(QRCodeUtil.saveQRCodeImage(floor1));
        return floorService.insertFloor(floor1);
    }

    @RequestMapping("modify")
    public String modify(@RequestParam("id") Integer id,
                         @RequestParam("shopId") Integer shopid,
                         @RequestParam("name") String name,
                         @RequestParam("imageUrl") String image,
                         @RequestParam("floor") Integer floor,
                         @RequestParam("doBusinessSiteId") Integer bsid,
                         @RequestParam("status") Integer status,
                         @RequestParam("display") Integer display) {
        Floor floor1 = getFloor(id, name, image, floor, bsid, status, display);
        floor1.setQrcodeImage(QRCodeUtil.saveQRCodeImage(floor1));
        return floorService.updateFloor(floor1);
    }

    @RequestMapping("delete")
    public String delete(@RequestParam("id") Integer id) {
        return floorService.deleteFloor(id);
    }

    @RequestMapping("/modify/priority")
    public String modifyPriority(@RequestParam("riseId") String riseId,
                                 @RequestParam("declineId") String declineId){
        return floorService.updateFloorPriority(riseId, declineId);
    }


    Floor getFloor(Integer id, String name, String image, Integer floor, Integer bsid, Integer status, Integer display) {
        Floor re = new Floor();
        re.setFid(id);
        re.setFname(name);
        re.setImage(image);
        re.setFloor(floor);
        re.setBsid(bsid);
        re.setStatus(status);
        re.setDisplay(display);
        return re;
    }
}
