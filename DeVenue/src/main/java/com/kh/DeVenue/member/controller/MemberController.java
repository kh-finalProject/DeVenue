package com.kh.DeVenue.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.DeVenue.member.model.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService mService;
	
	
}
