import org.junit.Test;
import top.lin.entity.Brand;
import top.lin.utils.ExcelUtil;

import java.io.File;
import java.util.AbstractMap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/25
 * Time: 13:18
 */

public class ExcelTest {

    @Test
    public void getBrand() {
        List<Brand> list = null;
        try {
            Map<String, Map.Entry<String, String>> map = new HashMap<>();
            map.put("BrandType", new AbstractMap.SimpleEntry<>("bname", "string"));
            map.put("status", new AbstractMap.SimpleEntry<>("status", "int"));
            map.put("logo", new AbstractMap.SimpleEntry<>("logo", "string"));
            ExcelUtil<Brand> excelUtil = new ExcelUtil<>();
            list = excelUtil.parse(Brand.class, new File("E:/brand.xls"), map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(list);
    }
}
