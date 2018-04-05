package com.breezesoftware.stayfit.repository

import com.breezesoftware.stayfit.models.Exercise
import org.springframework.data.repository.CrudRepository

interface ExerciseRepositoryCrud : CrudRepository<Exercise, Long>
