package org.movie.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Log4j
@Log
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.info("로그인 성공");
		// 모든 권한을 문자열로 체크하여 해당 권한을 가졌다면
		//해당url로 이동
		List<String> roleNames= new ArrayList<String>();
		authentication.getAuthorities().forEach(authority ->{
			roleNames.add(authority.getAuthority());
		});
		log.info("로그인 이름 : " + roleNames);
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/sample/admin");
			return;
		}
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/sample/member");
			return;
		}
		response.sendRedirect("/");
	}
	
}
