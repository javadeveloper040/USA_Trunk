/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.edu.uams.security;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.edu.uams.service.MyUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

/**
 *
 * @author Pandu.Simbohtu
 */
@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    MyUserDetailsService myUserDetailsService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String name = authentication.getName();
        String password = authentication.getCredentials().toString();
        UserDetails details = myUserDetailsService.loadUserByUsername(name);

        if (name.equals(details.getUsername()) && password.equals(details.getUsername())) {
            Authentication auth = new UsernamePasswordAuthenticationToken(name, password, details.getAuthorities());
            return auth;
        } else {
            throw new BadCredentialsException("Username/Password does not match for " + authentication.getPrincipal());
        }
    }

    public List<GrantedAuthority> getGrantAuthorityList(List<String> userRoleNameList) {
        List<GrantedAuthority> authorityList = new ArrayList<GrantedAuthority>();

        for (Iterator<String> iterator = userRoleNameList.iterator(); iterator.hasNext();) {
            String userRoleName = iterator.next();

            authorityList.add(new SimpleGrantedAuthority(userRoleName));
        }

        return authorityList;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}
