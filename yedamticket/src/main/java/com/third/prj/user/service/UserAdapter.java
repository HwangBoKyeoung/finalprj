package com.third.prj.user.service;

import java.util.List;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class UserAdapter extends User {
	private UserVO user;

	public UserAdapter(UserVO user) {
	        super(user.getUsername(), user.getPassword(), List.of(new SimpleGrantedAuthority(user.getRole())));
	        this.user = user;
	    }

}
