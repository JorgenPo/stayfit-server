package com.breezesoftware.stayfit.models

import javax.persistence.Column
import javax.persistence.Id

data class Program(
        @Id
        @Column(name = "id", unique = true, nullable = false)
        var id : Long = 0,

        @Column(name = "Name", nullable = false)
        var name : String = "",

        @Column(name = "Description", nullable = false)
        var description : String = "",

        @Column(name = "ShortDescription", nullable = false)
        var shortDescription : String = "",

        @Column(name = "Image", nullable = false)
        var image : String = "",

        @Column(name = "Difficulty", nullable = false)
        var difficulty : Int = 1,

        @Column(name = "Price", nullable = false)
        var price : Int = 0,

        @Column(name = "Rating", nullable = false)
        var rating : Float = 0.0f,

        @Column(name = "Voted", nullable = false)
        var voted : Long = 0
)