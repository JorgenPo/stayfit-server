package com.breezesoftware.stayfit.models

import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.Table

@Entity
@Table(name = "muscle_groups")
data class MuscleGroup(
        @Id
        @Column(name = "id", unique = true, nullable = false)
        var id : Long = 0,

        @Column(name = "Name", unique = true, nullable = false)
        var name : String = "",

        @Column(name = "Description", nullable = false)
        var description : String = ""
)