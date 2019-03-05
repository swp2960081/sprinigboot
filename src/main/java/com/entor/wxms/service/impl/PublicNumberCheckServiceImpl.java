package com.entor.wxms.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.entor.wxms.entity.PublicNumberCheck;
import com.entor.wxms.service.PublicNumberCheckService;

@Service("publicNumberCheckService")
public class PublicNumberCheckServiceImpl extends BaseServiceImpl<PublicNumberCheck> implements PublicNumberCheckService{

	@Override
	public void addMore(List<PublicNumberCheck> list) {
		super.addMore(list);
	}
}
