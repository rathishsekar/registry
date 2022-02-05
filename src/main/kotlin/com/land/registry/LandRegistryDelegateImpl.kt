package com.land.registry

import com.land.registry.controller.RegistryApiDelegate
import com.land.registry.model.LandDetails
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.stereotype.Service

@Service
class LandRegistryDelegateImpl(): RegistryApiDelegate {

    override fun registryLandIdGet(landId: Long):  ResponseEntity<LandDetails>{
        return ResponseEntity(LandDetails(1), HttpStatus.OK)
    }
}
