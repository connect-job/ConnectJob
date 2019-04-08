package com.connect.job.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PolicyController {

	@RequestMapping("privacyPolicy.do")
	public String policy() {
		return "policy/policy";
	}
	
	@RequestMapping("emailUnthClct.do")
	public String email() {
		return "email/email";
	}
	
	@RequestMapping("trmUse.do")
	public String trmUse() {
		return "trmUse/trmUse";
	}
	
	
}
