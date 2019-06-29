package top.lin.service;

import org.springframework.web.multipart.MultipartFile;
import top.lin.entity.Brand;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/25
 * Time: 11:17
 */
public interface BrandService {
    String inquireBrandByShopid(Integer id);

    String insertOrUpdateBrand(Brand brand);

    String deleteBrandByBid(Integer id);

    String insertBrandByExcel(MultipartFile file, Integer id);

    String inquireBrandByBid(Integer bid);
}
