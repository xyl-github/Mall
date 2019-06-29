package top.lin.filter;

import com.alibaba.fastjson.JSONObject;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.springframework.beans.factory.annotation.Autowired;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import top.lin.controller.AdminController;
import top.lin.service.AdminService;
import top.lin.service.impl.AdminServiceImpl;
import top.lin.utils.JwtUtil;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/27
 * Time: 9:49
 */
public class LoginFilter implements Filter {
    private static String[] notFilterUrl = {"/login", "/js/", "/css/"};

    @Autowired
    AdminService adminService;

    @Autowired
    JedisPool jedisPool;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
//        Jedis jedis = null;
//        try {
//            String url = httpRequest.getRequestURL().toString();
//            System.out.println(url);
//            for (String u : notFilterUrl) {
//                if (url.indexOf(u) >= 0) {
//                    System.out.println(u);
//                    chain.doFilter(request, response);
//                    return;
//                }
//            }
//            Cookie[] cookies = httpRequest.getCookies();
//            String token = null;
//            for (Cookie cookie : cookies) {
//                if (cookie.getName().equals(AdminController.LOGINCOKKIE)) {
//                    token = cookie.getValue();
//                    break;
//                }
//            }
//            if (token != null) {
//                jedis = jedisPool.getResource();
//                DecodedJWT verify = JwtUtil.verify(token);
//                Integer id = verify.getClaim(JwtUtil.ID).asInt();
//                if (jedis.hexists(AdminServiceImpl.ADMIN, id + "")) {
//                    chain.doFilter(request, response);
//                } else {
//                    JSONObject json = JSONObject.parseObject(adminService.inquireAdminByToken(token));
//                    if (json.get("responseResult") != null) {
//                        chain.doFilter(request, response);
//                    } else
//                        httpResponse.sendRedirect("/page/login");
//                }
//            } else
//                httpResponse.sendRedirect("/page/login");
//        } catch (Exception e) {
//            httpResponse.sendRedirect("/page/login");
//        } finally {
//            if (jedis != null) {
//                jedis.close();
//            }
//        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
