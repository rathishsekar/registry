package com.land.registry

import com.land.registry.model.LandDetails
import io.kotest.core.spec.style.DescribeSpec
import io.kotest.matchers.shouldBe
import org.springframework.http.HttpStatus

class LandRegistryDelegateImplTest : DescribeSpec({

    describe("registryLandIdGet") {
        it("test1"){
            val expectedBody = LandDetails(5)
            val response = LandRegistryDelegateImpl().registryLandIdGet(5)
            response.statusCode shouldBe HttpStatus.OK
            response.body shouldBe expectedBody
        }
    }
})
