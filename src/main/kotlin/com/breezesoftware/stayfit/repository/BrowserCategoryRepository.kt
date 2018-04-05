package com.breezesoftware.stayfit.repository

import com.breezesoftware.stayfit.models.BrowserCategory
import org.springframework.data.repository.PagingAndSortingRepository
import org.springframework.stereotype.Repository

interface BrowserCategoryRepositoryCustom {
    /**
     * Возвращает список категорий
     *
     * @param page integer Страница
     *
     * Если оба параметра = 0, то возвращаются все категории
     */
    fun getBrowserCategories(page : Int) : List<BrowserCategory>
}

@Repository
interface BrowserCategoryRepository
    : PagingAndSortingRepository<BrowserCategory, Long>, BrowserCategoryRepositoryCustom