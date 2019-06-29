package top.lin.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import top.lin.entity.BusinessSite;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/24
 * Time: 16:12
 */
public interface BusinessSiteMapper {

    @Select("select * from business_site where bsid = #{bsid}")
    BusinessSite inquireBusinessSiteByBsid(@Param("bsid") Integer id);

    List<BusinessSite> inquireBusinessSiteByShopid(@Param("shopid") Integer id);

    int insertBusinessSite(BusinessSite businessSite);

    int updateBusinessSite(BusinessSite businessSite);

    int deleteBusinessSite(@Param("bsid") Integer id);
}
