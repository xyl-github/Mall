package top.lin.dao;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import top.lin.entity.Admin;
import top.lin.entity.OptionStatus;
import top.lin.entity.Shop;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/22
 * Time: 15:22
 */
@Repository
public interface AdminMapper {

    Admin inquireAdminByUser(@Param("username") String user);

    List<OptionStatus> inquireOptionStatusByShopid(@Param("shopid") Integer shopid, @Param("startDate") String date1, @Param("endDate") String date2);

    List<Admin> inquireAdminFromIndex(@Param("index") Integer index, @Param("max") Integer max);

    @Select("select mid from manager where mname = #{mname}")
    int inquireMidByMname(@Param("mname") String mname);

    int insertAdmin(Admin admin);

    int updateAdmin(Admin admin);

    int deleteAdminById(@Param("aid") Integer aid);

    @Select("select distinct mname from manager")
    List<String> inquireAdminType();

    Admin inquireAdminByAid(@Param("aid") Integer aid);
}
