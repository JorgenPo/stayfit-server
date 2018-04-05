package com.breezesoftware.stayfit.repository

import com.breezesoftware.stayfit.models.BrowserCategory
import com.breezesoftware.stayfit.models.BrowserCategoryItem
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.PageRequest
import org.springframework.jdbc.core.JdbcTemplate

class BrowserCategoryRepositoryImpl : BrowserCategoryRepositoryCustom {

    @Autowired
    private lateinit var db: JdbcTemplate

    @Autowired
    private lateinit var repository: BrowserCategoryRepository

    companion object {
        const val PAGE_SIZE = 10
    }

    override fun getBrowserCategories(page: Int): List<BrowserCategory> {
        val list = ArrayList<BrowserCategory>()

        val pageRequest = PageRequest.of(page, PAGE_SIZE)

        val categories = repository.findAll(pageRequest)

        for (category in categories) {
            category.items = getBrowserCategoryItems(category.id)
            list.add(category)
        }

        return list
    }

    private fun getBrowserCategoryItems(categoryId: Long): List<BrowserCategoryItem> {
        val list : List<BrowserCategoryItem>

        try {
            list = BrowserCategory.BrowserCategorySP(db, categoryId).execute()
        } catch (e: Exception) {
            return ArrayList()
        }

        return list
    }
}