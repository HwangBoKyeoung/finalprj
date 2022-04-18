package com.third.prj.user.service;


import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO implements UserDetails{
	
	private String UId; // not null
	private String email;
	private String pwd;
	private String addr;
	private Date birthDt;
	private String phone;
	private String name;
	private String dealAgreeCd;
	private int point;
	private String membership;
	private String loginCd;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date rdt;
	private String role;
	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> auth = new ArrayList<>(); 
		auth.add(new SimpleGrantedAuthority(this.role));
		return auth;
	}
	
	@Override
	public String getPassword() {
		return pwd;
	}
	
	@Override
	public String getUsername() {
		return UId;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	@Override
	public boolean isEnabled() {
		return true;
	}
	
}
	
	