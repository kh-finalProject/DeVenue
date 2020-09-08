package com.kh.DeVenue.model.vo;

import javax.servlet.http.HttpSession;

public class HttpSessionVO {
	HttpSession httpSession;

	public HttpSessionVO() {
		super();
	}

	public HttpSessionVO(HttpSession httpSession) {
		super();
		this.httpSession = httpSession;
	}

	public HttpSession getHttpSession() {
		return httpSession;
	}

	public void setHttpSession(HttpSession httpSession) {
		this.httpSession = httpSession;
	}
	
	
}
