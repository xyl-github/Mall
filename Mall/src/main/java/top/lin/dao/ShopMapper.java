package top.lin.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import top.lin.entity.Shop;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/24
 * Time: 10:34
 */
@Repository
public interface ShopMapper {

    Shop inquireShopByBsid(@Param("bsid") Integer bsid);

    Shop inquireShopByShopid(@Param("shopid") Integer shopid);

    @Select("select qrcode_image from shop where sid = #{sid}")
    String inquireQrCodeImageBySid(@Param("sid") Integer id);

    List<Shop> inquireAllShops();

    void insertShop(Shop shop);

    int updateShop(Shop shop);

    int deleteShopBySid(@Param("sid") Integer sid);
}
