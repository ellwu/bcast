package com.shnlng.bcast.device.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.shnlng.bcast.device.entity.DeviceEo;

public interface DeviceRepo extends PagingAndSortingRepository<DeviceEo, String> {

}
