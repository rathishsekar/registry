import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
	id("org.springframework.boot") version "2.6.2"
	id("io.spring.dependency-management") version "1.0.11.RELEASE"
	id("org.openapi.generator") version "5.1.1"
	kotlin("jvm") version "1.6.10"
	kotlin("plugin.spring") version "1.6.10"
}

group = "com.land"
version = "0.0.1-SNAPSHOT"
java.sourceCompatibility = JavaVersion.VERSION_11

repositories {
	mavenCentral()
}

dependencies {
	implementation("org.springframework.boot:spring-boot-starter")
	implementation("org.springframework.boot:spring-boot-starter-web")
	implementation("org.jetbrains.kotlin:kotlin-reflect")
	implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")
	implementation("org.springdoc:springdoc-openapi-kotlin:1.5.12")
	implementation("org.springdoc:springdoc-openapi-ui:1.5.12")
	compileOnly("javax.servlet:servlet-api:2.5")
	testImplementation("org.springframework.boot:spring-boot-starter-test")
}

tasks.withType<KotlinCompile> {
	dependsOn("openApiGenerate")
	kotlinOptions {
		freeCompilerArgs = listOf("-Xjsr305=strict")
		jvmTarget = "11"
	}
}

tasks.withType<Test> {
	useJUnitPlatform()
}

tasks.bootJar {
	manifest {
		attributes ["Start-Class"] = "com.land.registry.RegistryApplicationKt"
	}
}

openApiGenerate {
	generatorName.set("kotlin-spring")
	inputSpec.set("src/main/resources/spec.yml")
	outputDir.set("$buildDir/generated")
	apiPackage.set("com.land.registry.controller")
	modelPackage.set("com.land.registry.model")
	configFile.set("$rootDir/src/main/resources/api-config.json")
}

configure<SourceSetContainer>{
	named("main"){
		java.srcDir("$buildDir/generated/src/main/kotlin")
		java.exclude("**/Application.Kt")
	}
}
