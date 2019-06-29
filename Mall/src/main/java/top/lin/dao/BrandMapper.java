package top.lin.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import top.lin.entity.Brand;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/25
 * Time: 11:16
 */
@Repository
public interface BrandMapper {
    List<Brand> inquireBrandByShopid(@Param("shopid") Integer id);

    int insertBrand(Brand brand);

    int updateBrand(Brand brand);

    int deleteBrandByBid(@Param("bid") Integer id);

    @Select("select * from brand where bid = #{bid}")
    Brand inquireBrandByBid(@Param("bid") Integer bid);
}
