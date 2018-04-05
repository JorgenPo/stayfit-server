package com.breezesoftware.stayfit.controllers

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import com.breezesoftware.stayfit.models.BrowserCategory
import com.breezesoftware.stayfit.repository.BrowserCategoryRepository
import com.breezesoftware.stayfit.repository.BrowserCategoryRepositoryImpl
import org.springframework.beans.factory.annotation.Autowired

@RestController
class BrowserController {

    @Autowired
    private lateinit var browserCategoryRepository : BrowserCategoryRepository

    /**
     * Возвращает массив категорий клиенту в виде json массива
     */
    @GetMapping("/get/browserCategories")
    fun getBrowserCategories(
            @RequestParam(value = "from", defaultValue = "0") from : String,
            @RequestParam(value = "to", defaultValue = "0") to : String)
            : List<BrowserCategory>
    {
        return browserCategoryRepository.getBrowserCategories(0)
    }
}