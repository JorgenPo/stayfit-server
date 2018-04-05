package com.breezesoftware.stayfit.models

import org.springframework.jdbc.`object`.StoredProcedure
import org.springframework.jdbc.core.JdbcTemplate
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.Table

@Entity
@Table(name = "browser_categories")
data class BrowserCategory(
        @Id
        @Column(name = "id", unique = true, nullable = false)
        var id: Long = 0,

        @Column(name = "Name", unique = true, nullable = false)
        var name: String = "",

        @Column(name = "Description", nullable = false)
        var description: String = "",

        @Column(name = "ItemType", nullable = false)
        var itemType: String = "",

        @Transient
        var items: List<BrowserCategoryItem> = ArrayList()
) {

    /**
     * Процедура для получения элементов категорий
     */
    class BrowserCategorySP(jdbcTemplate: JdbcTemplate, categoryId: Long)
        : StoredProcedure(jdbcTemplate, String.format("category%s", categoryId)) {

        init {
            isFunction = false
        }

        companion object {
            const val RESULT_SET = "#result-set-1"
        }

        fun execute(): List<BrowserCategoryItem> {
            val list = super.execute()[RESULT_SET] as List<*>

            val itemList = list.filterIsInstance<Map<String, Any>>()

            val browserItemList = ArrayList<BrowserCategoryItem>()
            for (item in itemList) {
                browserItemList.add(BrowserCategoryItem.fromHashMap(item))
            }

            return browserItemList
        }
    }
}