package com.entor.wxms.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.entor.wxms.entity.UserPublicNumber;
import com.entor.wxms.service.UserPublicNumberService;

@Service("userPublicNumberService")
public class UserPublicNumberServiceImpl extends BaseServiceImpl<UserPublicNumber> implements UserPublicNumberService{

	@Override
	public void addMore(List<UserPublicNumber> list) {
		super.addMore(list);
	}
	
}
