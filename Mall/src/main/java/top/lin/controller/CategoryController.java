package top.lin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import top.lin.entity.Category;
import top.lin.service.CategoryService;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/25
 * Time: 10:47
 */
@Controller
@RequestMapping(value = "category", produces = "application/json; charset=utf-8")
@ResponseBody
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    @RequestMapping("finds")
    public String finds(@RequestParam("shopId") Integer id) {
        return categoryService.inquireCategory(id);
    }

    @RequestMapping("findById")
    public String findById(@RequestParam("id") Integer cid){
        return categoryService.inquireCategoryByCid(cid);
    }

    @RequestMapping("add")
    public String add(@RequestParam("shopId") Integer sid,
                      @RequestParam("status") Integer status,
                      @RequestParam("type") String type) {
        return categoryService.insertCategory(getCategory(null, sid, status, type));
    }
    @RequestMapping("modify")
    public String modify(@RequestParam("id") Integer id,
                         @RequestParam("shopId") Integer sid,
                      @RequestParam("status") Integer status,
                      @RequestParam("type") String type) {
        return categoryService.updateCategory(getCategory(id, sid, status, type));
    }
    @RequestMapping("delete")
    public String delete(@RequestParam("id") Integer id) {
        return categoryService.deleteCategory(id);
    }

    @RequestMapping("/modify/priority")
    public String modifyPriority(@RequestParam("riseId") String riseId,
                                 @RequestParam("declineId") String declineId){
        return categoryService.updateCategoryPriority(riseId, declineId);
    }

    Category getCategory(Integer cid, Integer sid, Integer status, String type) {
        Category category = new Category();
        category.setCid(cid);
        category.setShopid(sid);
        category.setStatus(status);
        category.setType(type);
        return category;
    }
}
