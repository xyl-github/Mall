package top.lin.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import top.lin.entity.Floor;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/25
 * Time: 10:00
 */
@Repository
public interface FloorMapper {

    List<Floor> inquireFloorByShopid(@Param("shopid") Integer shopId);

    int insertFloor(Floor floor);

    int updateFloor(Floor floor);

    int deleteFloorByFid(@Param("fid") Integer id);

    String inquireQrcodeImageByFid(@Param("fid") Integer fid);

    @Update("update floor set priority = priority + 1 where fid = #{fid}")
    int risePriority(@Param("fid") Integer reId);

    @Update("update floor set priority = priority - 1 where fid = #{fid}")
    int declinePriority(@Param("fid") Integer deId);

    Floor inquireFloorByFid(@Param("fid") Integer fid);
}
