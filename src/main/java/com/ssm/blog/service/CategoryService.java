package com.ssm.blog.service;

import com.ssm.blog.pojo.Category;

import java.util.List;

public interface CategoryService {
    void addCategory(Category category);
    List<Category> getCategoryList(Category category);
}
