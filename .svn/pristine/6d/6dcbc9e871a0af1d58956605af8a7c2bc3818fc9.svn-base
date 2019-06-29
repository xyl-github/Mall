package top.lin.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import top.lin.entity.Category;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/25
 * Time: 10:45
 */
@Repository
public interface CategoryMapper {

    List<Category> inquireCategoryByShopid(@Param("shopid") Integer id);

    int insertCategory(Category category);

    int updateCategory(Category category);

    int deleteCategoryByCid(@Param("cid") Integer cid);

    @Update("update category set priority = priority + 1 where cid = #{cid}")
    int risePriority(@Param("cid") Integer reId);

    @Update("update category set priority = priority - 1 where cid = #{cid}")
    int declinePriority(@Param("cid") Integer deId);

    Category inquireCategoryByCid(@Param("cid") Integer cid);
}
