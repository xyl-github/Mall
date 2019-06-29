package top.lin.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import top.lin.dao.FloorMapper;
import top.lin.entity.Floor;
import top.lin.service.FloorService;
import top.lin.utils.FileUtil;
import top.lin.utils.JSONResultUtil;

import java.io.File;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/25
 * Time: 10:00
 */
@Service
public class FloorServiceImpl implements FloorService {

    @Autowired
    FloorMapper floorMapper;

    JSONObject getFloorJSONObject(Floor floor, String storeLocations) {
        JSONObject json = new JSONObject();
        json.put("id", floor.getFid());
        json.put("shopId", floor.getShop().getSid());
        json.put("doBusinessSiteId", floor.getBusinessSite().getBsid());
        json.put("doBusinessSiteName", floor.getBusinessSite().getBsname());
        json.put("shopName", floor.getShop().getSname());
        json.put("name", floor.getFname());
        json.put("imageUrl", floor.getImage());
        json.put("floor", floor.getFloor());
        json.put("storeLocations", storeLocations);
        json.put("qrcodeImage", floor.getQrcodeImage());
        json.put("qrcodeText", floor.getQrcodeText());
        json.put("status", floor.getStatus());
        json.put("grade", floor.getPriority());
        json.put("display", floor.getDisplay());
        return json;
    }

    @Override
    public String inquireFloorByShopid(Integer shopId) {
        List<Floor> list = floorMapper.inquireFloorByShopid(shopId);
        JSONResultUtil.createResult();
        try {
            if (list != null) {
                JSONArray array = new JSONArray();
                for (Floor floor : list) {
                    array.add(getFloorJSONObject(floor, null));
                }

                JSONResultUtil.setStatus("Success");
                JSONResultUtil.setResponseList(array);
            } else {
                JSONResultUtil.setStatus("Fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String insertFloor(Floor floor) {
        JSONResultUtil.createResult();
        if (floorMapper.insertFloor(floor) > 0) {
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(true);
        } else {
            JSONResultUtil.setStatus("Fail");
            JSONResultUtil.setResponseResult(false);
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String updateFloor(Floor floor) {
        JSONResultUtil.createResult();
        String image = floorMapper.inquireQrcodeImageByFid(floor.getFid());
        System.out.println(floor.getQrcodeImage());
        if (floorMapper.updateFloor(floor) > 0) {
            try {
                FileUtil.deleteFile(FileUtil.getPath(FileUtil.IMAGE) + image.replaceAll("/wxx/", ""));
            } catch (Exception e) {
                e.printStackTrace();
            }
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(true);
        } else {
            JSONResultUtil.setStatus("Fail");
            JSONResultUtil.setResponseResult(false);
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String deleteFloor(Integer id) {
        JSONResultUtil.createResult();
        if (floorMapper.deleteFloorByFid(id) > 0) {
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(true);
        } else {
            JSONResultUtil.setStatus("Fail");
            JSONResultUtil.setResponseResult(false);
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String updateFloorPriority(String riseId, String declineId) {
        JSONResultUtil.createResult();
        boolean flag = false;
        try {
            Integer reId = Integer.valueOf(riseId);
            if (floorMapper.risePriority(reId) > 0) {
                JSONResultUtil.setStatus("Success");
                JSONResultUtil.setResponseResult("修改成功");
                flag = true;
            }
        } catch (Exception e) {
        }
        try {
            Integer deId = Integer.valueOf(declineId);
            if (floorMapper.declinePriority(deId) > 0) {
                JSONResultUtil.setStatus("Success");
                JSONResultUtil.setResponseResult("修改成功");
                flag = true;
            }
        } catch (Exception e) {
        }
        if (!flag) {
            JSONResultUtil.setStatus("Fail");
            JSONResultUtil.setResponseResult("修改失败");
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String inquireFloorByFid(Integer fid) {
        Floor floor = floorMapper.inquireFloorByFid(fid);
        JSONResultUtil.createResult();
        if (floor != null) {
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(getFloorJSONObject(floor, null));
        } else
            JSONResultUtil.setStatus("Fail");
        return JSONResultUtil.getResult().toJSONString();
    }
}
