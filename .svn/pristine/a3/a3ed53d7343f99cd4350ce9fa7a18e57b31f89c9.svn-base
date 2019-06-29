package top.lin.service;

import org.apache.ibatis.annotations.Param;
import top.lin.entity.Admin;

import java.io.File;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/22
 * Time: 15:23
 */
public interface AdminService {

    String inquireAdminByUser(String user, String password);

    String inquireAdminByToken(String token);

    String inquireOptionStatusByShopid(@Param("shopid") Integer shopid, String date);

    String inquireAdminFromIndex(@Param("index") Integer index, @Param("max") Integer max);

    String insertAdmin(Admin admin);

    String updateAdmin(Admin admin);

    String deleteAdmin(Integer id);

    String test();

    File inquireOptionStatusFromStart(Integer sid, String start, String end);

    String inquireAdminType();

    String inquireAdminByAid(Integer aid);
}
