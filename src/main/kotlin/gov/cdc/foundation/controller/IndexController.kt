package org.example.foundation.controller

import org.apache.commons.codec.Charsets
import org.apache.commons.io.IOUtils
import org.springframework.http.HttpStatus
import org.springframework.http.MediaType
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.ResponseStatus
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.bind.annotation.RestController

import io.swagger.annotations.ApiOperation;

@CrossOrigin(allowCredentials="true")
@RestController
@RequestMapping("/")
open class IndexController {

	@RequestMapping(method = arrayOf(RequestMethod.GET), produces = arrayOf(MediaType.TEXT_HTML_VALUE))
	@ApiOperation(value = "Value", notes = "Notes")
    @ResponseBody
	fun index(): String {
		return IOUtils.toString(IndexController::class.java.getResourceAsStream("/index.html"), Charsets.UTF_8);
	}
}