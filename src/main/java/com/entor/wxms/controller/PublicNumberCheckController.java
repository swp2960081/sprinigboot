package com.entor.wxms.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.entor.wxms.entity.PublicNumberCheck;
import com.entor.wxms.service.PublicNumberCheckService;

@Controller
@RequestMapping("/publicNumberCheck")
public class PublicNumberCheckController extends BaseController<PublicNumberCheck>{

	@Resource
	private PublicNumberCheckService publicNumberCheckService;
	
	@RequestMapping("/savePublicNumberCheck")
	public void PublicNumberCheck(String uids,String pids) {
		JSONObject jo = new JSONObject();
		PrintWriter out = null;
		try {
			out = super.getResponse().getWriter();
			//先删除用户已有的所有角色
			//publicNumberCheckService.deleteUserPublicNumberByUids(UserPublicNumber.class,uids);
			//添加用户角色
			List<PublicNumberCheck> list = new ArrayList<>();
			for(String uid:uids.split(",")) {
				for(String pid:pids.split(",")) {
					PublicNumberCheck publicNumberCheck = new PublicNumberCheck();
					publicNumberCheck.setUserId(uid);
					publicNumberCheck.setpId(pid);
					//publicNumberCheck.setApplyTime(new Date());
					list.add(publicNumberCheck);
					//userPublicNumberService.add(userPublicNumber);
				}
			}
			publicNumberCheckService.addMore(list);
			jo.put("state", 0);
			jo.put("msg", "绑定公众号分配成功");
		}catch(Exception e) {
			jo.put("state", -1);
			jo.put("msg", "绑定公众号分配失败："+e.getMessage());
		}finally {
			String str = JSON.toJSONString(jo);
			System.out.println(str);
			out.write(str);
			out.flush();
			out.close();
		}
	}
}
