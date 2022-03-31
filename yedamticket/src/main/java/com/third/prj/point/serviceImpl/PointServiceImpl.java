package com.third.prj.point.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.point.mapper.PointMapper;
import com.third.prj.point.service.PointService;

@Repository("pointDao")
public class PointServiceImpl implements PointService {

	@Autowired
	private PointMapper map;
}
