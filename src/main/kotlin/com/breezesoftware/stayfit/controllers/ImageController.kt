package com.breezesoftware.stayfit.controllers

import org.springframework.core.io.InputStreamResource
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RestController
import java.io.File
import java.io.InputStream

@RestController
class ImageController {

    @GetMapping(value = ["/get/image/{image}"], produces = ["image/jpeg"])
    fun getImage(@PathVariable(name = "image") image : String): ByteArray? {
        val imageFile = File(this.javaClass.getResource("featured01.jpg").file)

        if (!imageFile.exists()) {
            return null
        }

        return imageFile.readBytes()
    }
}