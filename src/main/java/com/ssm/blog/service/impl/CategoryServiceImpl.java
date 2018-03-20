package com.ssm.blog.service.impl;

import com.ssm.blog.dao.CategoryDAO;
import com.ssm.blog.pojo.Category;
import com.ssm.blog.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryDAO categoryDAO;

    @Override
    public void addCategory(Category category) {
        categoryDAO.addCategory(category);
    }

    @Override
    public List<Category> getCategoryList(Category category) {
        return categoryDAO.getCategoryList(category);
    }
}
