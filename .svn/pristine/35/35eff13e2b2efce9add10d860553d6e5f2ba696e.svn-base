package top.lin.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import top.lin.dao.BusinessSiteMapper;
import top.lin.entity.BusinessSite;
import top.lin.service.BusinessSiteService;
import top.lin.utils.JSONResultUtil;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/24
 * Time: 16:12
 */
@Service
public class BusinessSiteServiceImpl implements BusinessSiteService {

    @Autowired
    BusinessSiteMapper businessSiteMapper;

    JSONObject getBusinessSiteJSONObject(BusinessSite bs) {
        JSONObject responseResult = new JSONObject();
        responseResult.put("id", bs.getBsid());
        responseResult.put("shopId", bs.getShopid());
        responseResult.put("name", bs.getBsname());
        responseResult.put("introduce", bs.getIntroduce());
        responseResult.put("status", bs.getStatus());
        responseResult.put("qrcodeImage", bs.getQrcodeImage());
        responseResult.put("qrcodeText", bs.getQrcodeText());
        return responseResult;
    }


    @Override
    public String inquireBusinessSiteByShopid(Integer id) {
        List<BusinessSite> list = businessSiteMapper.inquireBusinessSiteByShopid(id);
        JSONResultUtil.createResult();
        if (list != null) {
            JSONResultUtil.setStatus("Success");
            JSONArray re = new JSONArray();
            for (BusinessSite businessSite : list) {
                re.add(getBusinessSiteJSONObject(businessSite));
            }
            JSONResultUtil.setResponseList(re);
        } else {
            JSONResultUtil.setStatus("Fail");
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String insertBusinessSite(BusinessSite businessSite) {
        JSONResultUtil.createResult();
        if (businessSiteMapper.insertBusinessSite(businessSite) > 0) {
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(businessSite.getBsid());
        } else
            JSONResultUtil.setStatus("Fail");

        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String updateBusinessSite(BusinessSite businessSite) {
        JSONResultUtil.createResult();
        if (businessSiteMapper.updateBusinessSite(businessSite) > 0) {
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(true);
        } else
            JSONResultUtil.setStatus("Fail");

        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String deleteBusinessSiteByBsid(Integer id) {
        JSONResultUtil.createResult();
        if (businessSiteMapper.deleteBusinessSite(id) > 0) {
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(true);
        } else
            JSONResultUtil.setStatus("Fail");

        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String inquireBusinessSiteByBsid(Integer id) {
        BusinessSite bs = businessSiteMapper.inquireBusinessSiteByBsid(id);
        JSONResultUtil.createResult();
        if (bs != null) {
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(getBusinessSiteJSONObject(bs));
        } else
            JSONResultUtil.setStatus("Fail");
        return JSONResultUtil.getResult().toJSONString();
    }
}
