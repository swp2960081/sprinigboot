package com.entor.wxms.controller;

import java.io.PrintWriter;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.entor.wxms.entity.UserPublicNumber;
import com.entor.wxms.service.UserPublicNumberService;

@Controller
@RequestMapping("/userPublicNumber")
public class UserPublicNumberController extends BaseController<UserPublicNumber>{

	@Resource
	private UserPublicNumberService userPublicNumberService;
	
	@RequestMapping("/savePublic")
	public void savePublic(String uids,String pids) {
		JSONObject jo = new JSONObject();
		PrintWriter out = null;
		try {
			out = super.getResponse().getWriter();
			//先删除用户已有的所有角色
			//userPublicNumberService.deleteUserPublicNumberByUids(UserPublicNumber.class,uids);
			//添加用户角色
			//List<UserPublicNumber> list = new ArrayList<>();
			//for(String uid:uids.split(",")) {
			//	for(String pid:pids.split(",")) {
					UserPublicNumber userPublicNumber = new UserPublicNumber();
					userPublicNumber.setUserId(uids);
					userPublicNumber.setpId(pids);
					//list.add(userPublicNumber);
					userPublicNumberService.add(userPublicNumber);
			//	}
			//}
			//userPublicNumberService.addMore(list);
			jo.put("state", 0);
			jo.put("msg", "审核成功");
		}catch(Exception e) {
			jo.put("state", -1);
			jo.put("msg", "审核失败："+e.getMessage());
		}finally {
			String str = JSON.toJSONString(jo);
			System.out.println(str);
			out.write(str);
			out.flush();
			out.close();
		}
	}
	
}
