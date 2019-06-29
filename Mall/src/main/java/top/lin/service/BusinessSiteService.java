package top.lin.service;

import top.lin.entity.BusinessSite;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/24
 * Time: 16:12
 */
public interface BusinessSiteService {
    String inquireBusinessSiteByShopid(Integer id);

    String insertBusinessSite(BusinessSite businessSite);

    String updateBusinessSite(BusinessSite businessSite);

    String deleteBusinessSiteByBsid(Integer id);

    String inquireBusinessSiteByBsid(Integer id);
}
