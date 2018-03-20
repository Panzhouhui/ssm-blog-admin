package com.ssm.blog.dao;

import com.ssm.blog.pojo.Category;

import java.util.List;

public interface CategoryDAO {

    void addCategory(Category category);

    List<Category> getCategoryList(Category category);
}
