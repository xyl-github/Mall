package top.lin.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.sun.org.apache.bcel.internal.generic.JSR;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.lin.dao.CategoryMapper;
import top.lin.entity.Category;
import top.lin.service.CategoryService;
import top.lin.utils.JSONResultUtil;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/25
 * Time: 10:46
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryMapper categoryMapper;

    JSONObject getCategoryJSONObdect(Category category) {
        JSONObject json = new JSONObject();
        json.put("id", category.getCid());
        json.put("shopId", category.getShop().getSid());
        json.put("shopName", category.getShop().getSname());
        json.put("type", category.getType());
        json.put("status", category.getStatus());
        json.put("grade", category.getPriority());
        return json;
    }

    @Override
    public String inquireCategory(Integer id) {
        List<Category> list = categoryMapper.inquireCategoryByShopid(id);
        JSONResultUtil.createResult();
        if (list != null) {
            JSONArray array = new JSONArray();
            for (Category category : list) {
                array.add(getCategoryJSONObdect(category));
            }

            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseList(array);
        } else {
            JSONResultUtil.setStatus("Fail");
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String insertCategory(Category category) {
        JSONResultUtil.createResult();
        if (categoryMapper.insertCategory(category) > 0) {
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(true);
        } else {
            JSONResultUtil.setStatus("Fail");
            JSONResultUtil.setResponseResult(false);
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String updateCategory(Category category) {
        JSONResultUtil.createResult();
        if (categoryMapper.updateCategory(category) > 0) {
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(true);
        } else {
            JSONResultUtil.setStatus("Fail");
            JSONResultUtil.setResponseResult(false);
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String deleteCategory(Integer id) {
        JSONResultUtil.createResult();
        if (categoryMapper.deleteCategoryByCid(id) > 0) {
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(true);
        } else {
            JSONResultUtil.setStatus("Fail");
            JSONResultUtil.setResponseResult(false);
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String updateCategoryPriority(String riseId, String declineId) {
        JSONResultUtil.createResult();
        boolean flag = false;
        try {
            int reId = Integer.valueOf(riseId);
            if (categoryMapper.risePriority(reId) > 0) {
                JSONResultUtil.setStatus("Success");
                JSONResultUtil.setResponseResult("修改成功");
                flag = true;
            }
        } catch (Exception e) {
        }
        try {
            int deId = Integer.valueOf(declineId);
            if (categoryMapper.declinePriority(deId) > 0) {
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
    public String inquireCategoryByCid(Integer cid) {
        Category category = categoryMapper.inquireCategoryByCid(cid);
        JSONResultUtil.createResult();
        if(category != null){
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(getCategoryJSONObdect(category));
        }else
            JSONResultUtil.setStatus("Fail");
        return JSONResultUtil.getResult().toJSONString();
    }
}
