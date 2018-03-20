package com.ssm.blog.controller;

import com.ssm.blog.pojo.Category;
import com.ssm.blog.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/category.html")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    //category.html?act=add
    @RequestMapping(params = "act=add")
    @ResponseBody
    public Map<String, Object> add(Category category) {
        categoryService.addCategory(category);
        Map<String, Object> result = new HashMap<>();
        result.put("status", true);
        result.put("message", "添加成功");
        return result;
    }

    @RequestMapping(params = "act=list")
    @ResponseBody
    public List<Category> list(Category category) {
        List<Category> categories = categoryService.getCategoryList(category);
        return categories;
    }
}
