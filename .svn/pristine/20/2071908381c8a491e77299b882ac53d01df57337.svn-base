package top.lin.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.lin.dao.ShopMapper;
import top.lin.entity.Admin;
import top.lin.entity.Shop;
import top.lin.service.ShopService;
import top.lin.utils.FileUtil;
import top.lin.utils.JSONResultUtil;

import java.io.File;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/24
 * Time: 14:07
 */
@Service
public class ShopServiceImpl implements ShopService {

    @Autowired
    ShopMapper shopMapper;

    public JSONObject getShopJSONObject(Shop shop, Integer distance, String icon, String map) {
        JSONObject responseResult = new JSONObject();
        responseResult.put("id", shop.getSid());
        responseResult.put("name", shop.getSname());
        responseResult.put("address", shop.getAddress());
        responseResult.put("images", shop.getImage());
        responseResult.put("tel", shop.getTel());
        responseResult.put("businessHours", shop.getBusinessHours());
        responseResult.put("longitude", shop.getLongitude());
        responseResult.put("latitude", shop.getLatitude());
        responseResult.put("distance", distance);
        responseResult.put("icon", icon);
        responseResult.put("map", map);
        responseResult.put("hotSearch", shop.getHotSearch());
        responseResult.put("qrcodeImage", shop.getQrcodeImage());
        responseResult.put("qrcodeText", shop.getQrcodeText());
        responseResult.put("status", shop.getStatus());
        return responseResult;
    }

    @Override
    public String inquireAllShop() {
        List<Shop> list = shopMapper.inquireAllShops();
        JSONResultUtil.createResult();
        if (list != null) {
            JSONArray responseList = new JSONArray();
            for (Shop shop : list) {
                responseList.add(getShopJSONObject(shop, null, null, null));
            }
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseList(responseList);
        } else {
            JSONResultUtil.setStatus("Fail");
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String insertOrUpdateShop(Shop shop) {
        JSONResultUtil.createResult();
        if (shop.getSid() != null) {//修改
            String image = shopMapper.inquireQrCodeImageBySid(shop.getSid());
            if (shopMapper.updateShop(shop) > 0) {
                try {
                    FileUtil.deleteFile(FileUtil.getPath(FileUtil.IMAGE) + image.replaceAll("/wxx/", ""));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                JSONResultUtil.setResponseResult(true);
                JSONResultUtil.setStatus("Success");
            }
        } else {
            shopMapper.insertShop(shop);
            if (shop.getSid() != null) {
                JSONResultUtil.setStatus("Success");
                JSONResultUtil.setResponseResult(shop.getSid());
            } else {
                JSONResultUtil.setStatus("Fail");
            }
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String deleteShopBySid(Integer id) {
        JSONResultUtil.createResult();
        if (shopMapper.deleteShopBySid(id) > 0) {
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult("删除成功");
        } else {
            JSONResultUtil.setStatus("Fail");
            JSONResultUtil.setResponseResult("删除失败");
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String inquireShopById(Integer sid) {
        Shop shop = shopMapper.inquireShopByShopid(sid);
        JSONResultUtil.createResult();
        if (shop != null) {
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(getShopJSONObject(shop, null, null, null));
        } else
            JSONResultUtil.setStatus("Fail");
        return JSONResultUtil.getResult().toJSONString();
    }
}
