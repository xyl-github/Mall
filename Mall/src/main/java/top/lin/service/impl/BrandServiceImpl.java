package top.lin.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import top.lin.dao.BrandMapper;
import top.lin.entity.Brand;
import top.lin.service.BrandService;
import top.lin.utils.ExcelUtil;
import top.lin.utils.FileUtil;
import top.lin.utils.JSONResultUtil;

import java.io.File;
import java.util.AbstractMap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/25
 * Time: 11:17
 */
@Service
public class BrandServiceImpl implements BrandService {

    @Autowired
    BrandMapper brandMapper;

    JSONObject getBrandJSONObject(Brand brand) {
        JSONObject json = new JSONObject();
        json.put("id", brand.getBid());
        json.put("shopId", brand.getShopid());
        json.put("brandType", brand.getBname());
        json.put("logo", brand.getLogo());
        json.put("status", brand.getStatus());
        return json;
    }

    @Override
    public String inquireBrandByShopid(Integer id) {
        List<Brand> list = brandMapper.inquireBrandByShopid(id);
        JSONResultUtil.createResult();
        if (list != null) {
            JSONArray array = new JSONArray();
            for (Brand brand : list) {
                array.add(getBrandJSONObject(brand));
            }
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseList(array);
        } else {
            JSONResultUtil.setStatus("Fail");
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String insertOrUpdateBrand(Brand brand) {
        JSONResultUtil.createResult();
        if (brand.getBid() == null) {
            if (brandMapper.insertBrand(brand) > 0) {
                JSONResultUtil.setStatus("Success");
                JSONResultUtil.setResponseResult("添加成功");
            } else {
                JSONResultUtil.setStatus("Fail");
                JSONResultUtil.setResponseResult("添加失败");
            }
        } else {
            if (brandMapper.updateBrand(brand) > 0) {
                JSONResultUtil.setStatus("Success");
                JSONResultUtil.setResponseResult("修改成功");
            } else {
                JSONResultUtil.setStatus("Fail");
                JSONResultUtil.setResponseResult("修改失败");
            }
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String deleteBrandByBid(Integer id) {
        JSONResultUtil.createResult();
        if (brandMapper.deleteBrandByBid(id) > 0) {
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(true);
        } else {
            JSONResultUtil.setStatus("Fail");
            JSONResultUtil.setResponseResult(false);
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String insertBrandByExcel(MultipartFile file, Integer id) {
        JSONResultUtil.createResult();
        File f = null;
        try {
            f = new File(FileUtil.getPath(FileUtil.TMP) + file.getName());
            file.transferTo(f);
            Map<String, Map.Entry<String, String>> map = new HashMap<>();
            map.put("BrandType", new AbstractMap.SimpleEntry<>("bname", "string"));
            map.put("status", new AbstractMap.SimpleEntry<>("status", "int"));
            map.put("logo", new AbstractMap.SimpleEntry<>("logo", "string"));
            ExcelUtil<Brand> excelUtil = new ExcelUtil<>();
            List<Brand> list = excelUtil.parse(Brand.class, f, map);

            for (Object object : list) {
                Brand brand = (Brand) object;
                brand.setShopid(id);
                brandMapper.insertBrand(brand);
            }
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(true);
        } catch (Exception e) {
            JSONResultUtil.setStatus("Fail");
            JSONResultUtil.setResponseResult(false);
        } finally {
            if (f != null)
                f.delete();
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String inquireBrandByBid(Integer bid) {
        Brand brand = brandMapper.inquireBrandByBid(bid);
        JSONResultUtil.createResult();
        if (brand != null) {
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(getBrandJSONObject(brand));
        } else {
            JSONResultUtil.setStatus("Fail");
        }
        return JSONResultUtil.getResult().toJSONString();
    }
}
