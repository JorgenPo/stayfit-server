package com.breezesoftware.stayfit.models

import java.security.KeyStore

/**
 * Содержит общие поля между всеми основными объектами,
 * такими как Программы тренировок, упражнения, данные
 * объекты предназначены для отображения в броузере программ
 * и упражнений.
 */
data class BrowserCategoryItem(
        var name : String,
        var description : String,
        var shortDescription : String,
        var image : String,
        var rating : Float,
        var voted : Long,
        var price : Int = 0
) {
    companion object {
        fun fromHashMap(map : Map<String, Any>) : BrowserCategoryItem {

            return BrowserCategoryItem(
                    name = map["Name"] as String,
                    description = map["Description"] as String,
                    shortDescription = map["ShortDescription"] as String,
                    image = map["Image"] as String,
                    rating = map["Rating"] as Float,
                    voted = map["Voted"] as Long
                    )
        }
    }
}