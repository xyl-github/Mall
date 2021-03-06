package top.lin.controller;

import com.alibaba.fastjson.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;
import top.lin.entity.Admin;
import top.lin.service.AdminService;
import top.lin.utils.JSONResultUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/24
 * Time: 10:18
 */
@Controller
@RequestMapping(value = "/min", produces = "application/json; charset=utf-8")
@ResponseBody
public class AdminController {

    public static final String LOGINCOKKIE = "adfawerasdfadcc";

    @Autowired
    AdminService adminService;

    @RequestMapping("test")
    public String test() {
        return adminService.test();
    }

    @RequestMapping("/login")
    public String login(@RequestParam("user") String user, @RequestParam("password") String password, HttpServletResponse response) {
        String result = null;
        try{
            result = adminService.inquireAdminByUser(user, password);
            JSONObject json = JSONObject.parseObject(result);
            if (json.get("responseResult") != null) {
                Cookie cookie = new Cookie(LOGINCOKKIE, json.getString("responseResult"));
                cookie.setMaxAge(-1);
                cookie.setPath("/");
                response.addCookie(cookie);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        String token = null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(LOGINCOKKIE)) {
                token = cookie.getValue();
                break;
            }
        }
        Cookie cookie = new Cookie(LOGINCOKKIE, null);
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);

        JSONResultUtil.createResult();
        JSONResultUtil.setStatus("Success");
        JSONResultUtil.setResponseResult("退出成功");
        return JSONResultUtil.getResult().toJSONString();
    }

    @RequestMapping("/infoToken")
    public String infoToken(@RequestParam("token") String token) {
        return adminService.inquireAdminByToken(token);
    }

    @RequestMapping("/findAdminById")
    public String getAdminByAid(@RequestParam("id") Integer aid){
        return adminService.inquireAdminByAid(aid);
    }

    @RequestMapping("/find")
    public String find(@RequestParam("shopId") Integer shopid, @RequestParam("date") String date) {
        return adminService.inquireOptionStatusByShopid(shopid, date);
    }

    @RequestMapping(value = "findAdmin", method = RequestMethod.POST)
    public String findAdmin(@RequestParam("index") Integer index, @RequestParam("max") Integer max) {
        return adminService.inquireAdminFromIndex(index, max);
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(@RequestParam("type1") String type,
                          @RequestParam("shopIds") Integer shopid,
                          @RequestParam("name") String name,
                          @RequestParam("tel") String tel,
                          @RequestParam("user") String user,
                          @RequestParam("status") Integer status,
                          @RequestParam("password") String password) {
        return adminService.insertAdmin(getAdmin(null, type, user, status, password, tel, shopid, name));
    }

    @RequestMapping("/changeAdmin")
    public String changeAdmin(@RequestParam("id") Integer id,
                              @RequestParam("type") String type,
                              @RequestParam("shopIds") Integer shopid,
                              @RequestParam("name") String name,
                              @RequestParam("tel") String tel,
                              @RequestParam("user") String user,
                              @RequestParam("status") Integer status,
                              @RequestParam("password") String password) {
        return adminService.updateAdmin(getAdmin(id, type, user, status, password, tel, shopid, name));
    }

    @RequestMapping("/deleteAdmin")
    public String deleteAdmin(@Param("id") Integer id) {
        return adminService.deleteAdmin(id);
    }

    @RequestMapping("creatorExcel")
    public void creatorExcel(@RequestParam("shopId") Integer sid,
                             @RequestParam("date") String start,
                             @RequestParam("date2") String end,
                             HttpServletResponse response) {
        File file = adminService.inquireOptionStatusFromStart(sid, start, end);
        InputStream is = null;
        OutputStream out = null;
        try {
            if (file != null && file.exists()) {
                response.addHeader("Content-Disposition", "attachment;filename=" + file.getName());
                response.setContentType("multipart/form-data");
                is = new FileInputStream(file);
                out = response.getOutputStream();
                byte[] buffer = new byte[1024 * 1024];
                int len;
                while ((len = is.read(buffer)) > 0)
                    out.write(buffer, 0, len);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (is != null)
                    is.close();
                if (out != null)
                    out.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    @RequestMapping("/getAllType")
    public String getManagerType() {
        return adminService.inquireAdminType();
    }

    Admin getAdmin(Integer id, String type, String user, Integer status, String password, String tel, Integer shopid, String name) {
        Admin admin = new Admin();
        admin.setAid(id);
        admin.setType(type);
        admin.setUsername(user);
        admin.setStatus(status);
        admin.setPassword(password);
        admin.setTel(tel);
        admin.setShopid(shopid);
        admin.setAname(name);
        return admin;
    }
}
