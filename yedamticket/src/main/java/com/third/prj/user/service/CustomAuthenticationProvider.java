package com.third.prj.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	@Autowired
	CustomUserDetailsService customUserDetailsService;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        UsernamePasswordAuthenticationToken authToken = (UsernamePasswordAuthenticationToken) authentication; 
 
        UserDetails userInfo = customUserDetailsService.loadUserByUsername(authToken.getName()); 
        if (userInfo == null) {
          throw new UsernameNotFoundException(authToken.getName());
        }
 
        List<GrantedAuthority> authorities = (List<GrantedAuthority>) userInfo.getAuthorities();
        
        return new UsernamePasswordAuthenticationToken(userInfo,null,authorities);
    }
 
    @Override
    public boolean supports(Class<?> authentication) {
         return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
    }
    
}
