package com.land.registry

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class RegistryApplication

fun main(args: Array<String>) {
	runApplication<RegistryApplication>(*args)
}
