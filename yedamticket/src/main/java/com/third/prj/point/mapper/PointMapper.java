package com.third.prj.point.mapper;

import com.third.prj.point.service.PointVO;

public interface PointMapper {
	//차감될 금액 삽입
	int payInsert(PointVO vo);
}
