package top.lin.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import top.lin.dao.AdminMapper;
import top.lin.entity.Admin;
import top.lin.entity.OptionStatus;
import top.lin.service.AdminService;
import top.lin.utils.*;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/22
 * Time: 15:23
 */
@Service
public class AdminServiceImpl implements AdminService {

    public static final String ADMIN = "admin_map";

    @Autowired
    AdminMapper adminMapper;

    @Autowired
    JedisPool jedisPool;

    @Override
    public String inquireAdminByUser(String user, String password) {
        Admin admin = adminMapper.inquireAdminByUser(user);
        JSONResultUtil.createResult();
        if (admin != null && admin.getPassword().equals(password)) {
            String token = JwtUtil.sign(admin.getUsername(), admin.getAid());
            Jedis jedis = null;
            try {
                jedis = jedisPool.getResource();
                jedis.hset(ADMIN, admin.getAid() + "", JSON.toJSONString(admin));
            } finally {
                if (jedis != null)
                    jedis.close();
            }

            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(token);
        } else {
            JSONResultUtil.setStatus("Fail");
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String inquireAdminByToken(String token) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            Admin admin = null;
            DecodedJWT verify = JwtUtil.verify(token);
            String username = verify.getClaim(JwtUtil.USER).asString();
            Integer id = verify.getClaim(JwtUtil.ID).asInt();
            JSONResultUtil.createResult();
            if (jedis.hexists(ADMIN, id + "")) {
                String json = jedis.hget(ADMIN, token);
                admin = JSON.parseObject(json, Admin.class);
            } else {
                admin = adminMapper.inquireAdminByUser(username);
                jedis.hset(ADMIN, admin.getAid() + "", JSON.toJSONString(admin));
            }
            if (admin != null) {
                JSONResultUtil.setStatus("Success");
                admin.setPassword(null);
                admin.setStatus(null);
                JSONObject responseResult = getAdminJSONObject(admin, null);
                JSONResultUtil.setResponseResult(responseResult);
            } else {
                JSONResultUtil.setStatus("Fail");
            }
            return JSONResultUtil.getResult().toJSONString();
        } finally {
            if (jedis != null)
                jedis.close();
        }
    }

    @Override
    public String inquireOptionStatusByShopid(Integer shopid, String date) {
        List<OptionStatus> op = adminMapper.inquireOptionStatusByShopid(shopid, date, date);
        JSONResultUtil.createResult();
        if (op != null) {
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(JSONObject.toJSON(op));
        } else
            JSONResultUtil.setStatus("Fail");
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String inquireAdminFromIndex(Integer index, Integer max) {
        List<Admin> list = adminMapper.inquireAdminFromIndex(index, max);
        JSONResultUtil.createResult();
        if (list != null) {
            JSONArray responseList = new JSONArray();
            for (Admin admin : list) {
                responseList.add(getAdminJSONObject(admin, null));
            }
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseList(responseList);
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String insertAdmin(Admin admin) {
        JSONResultUtil.createResult();
        try {
            int mid = adminMapper.inquireMidByMname(admin.getType());
            admin.setType(String.valueOf(mid));
            int c = adminMapper.insertAdmin(admin);
            if (c > 0) {
                JSONResultUtil.setStatus("Success");
                JSONResultUtil.setResponseResult("注册成功");
            }
        } catch (Exception e) {
            JSONResultUtil.setStatus("Fail");
            JSONResultUtil.setResponseResult("注册失败");
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String updateAdmin(Admin admin) {
        int mid = adminMapper.inquireMidByMname(admin.getType());
        admin.setType(String.valueOf(mid));
        int c = adminMapper.updateAdmin(admin);
        JSONResultUtil.createResult();
        if (c > 0) {
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult("修改成功");
        } else {
            JSONResultUtil.setStatus("Fail");
            JSONResultUtil.setResponseResult("修改失败");
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String deleteAdmin(Integer id) {
        JSONResultUtil.createResult();
        if (adminMapper.deleteAdminById(id) > 0) {
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult("删除成功");
        } else {
            JSONResultUtil.setStatus("Fail");
            JSONResultUtil.setResponseResult("删除失败");
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public File inquireOptionStatusFromStart(Integer sid, String start, String end) {
        File file = null;
        List<OptionStatus> list = null;
        try {
            file = new File(FileUtil.getPath(FileUtil.EXCEL) + start + "-" + end + ".xls");
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date endDate = format.parse(end);
            Date today = new Date(System.currentTimeMillis());
            today = format.parse(format.format(today));
            System.out.println("重复" + start + "-" + end + " " + today.getTime() + " " + endDate.getTime());
            if (file.exists() && today.getTime() > endDate.getTime()) {
                System.out.println("重复" + start + "-" + end + " " + today.getTime() + " " + endDate.getTime());
                return file;
            }
            list = adminMapper.inquireOptionStatusByShopid(sid, start, end);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ExcelUtil.getExcelFile(list, start, end);
    }

    @Override
    public String inquireAdminType() {
        JSONResultUtil.createResult();
        List<String> list = adminMapper.inquireAdminType();
        if (list != null) {
            JSONArray array = new JSONArray();
            for (String s : list) {
                array.add(s);
            }

            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseList(array);
        } else {
            JSONResultUtil.setStatus("Fail");
        }
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String inquireAdminByAid(Integer aid) {
        Admin admin = adminMapper.inquireAdminByAid(aid);
        JSONResultUtil.createResult();
        if (admin != null) {
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult(getAdminJSONObject(admin, null));
        } else
            JSONResultUtil.setStatus("Fail");
        return JSONResultUtil.getResult().toJSONString();
    }

    @Override
    public String test() {
        return String.valueOf(adminMapper.inquireMidByMname("超级管理员"));
    }

    public JSONObject getAdminJSONObject(Admin admin, String token) {
        JSONObject responseResult = new JSONObject();
        responseResult.put("id", admin.getAid());
        responseResult.put("type", admin.getType());
        responseResult.put("shopIds", admin.getShopid());
        responseResult.put("name", admin.getAname());
        responseResult.put("tel", admin.getTel());
        responseResult.put("user", admin.getUsername());
        responseResult.put("password", admin.getPassword());
        responseResult.put("status", admin.getStatus());
        responseResult.put("token", token);
        return responseResult;
    }


}
