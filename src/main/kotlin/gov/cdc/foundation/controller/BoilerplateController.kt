package org.example.foundation.controller

import org.apache.commons.io.IOUtils
import org.springframework.http.HttpStatus
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
@RequestMapping("/api/1.0")
class BoilerplateController {

	@RequestMapping("/greeting", method = arrayOf(RequestMethod.GET))
	@ApiOperation(value = "Value", notes = "Notes")
	fun hello(@RequestParam(value = "name", defaultValue = "World") name: String): String {
		return "Hello, $name"
	}
}