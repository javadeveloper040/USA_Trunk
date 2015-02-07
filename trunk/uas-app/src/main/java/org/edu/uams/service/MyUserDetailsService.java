/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.edu.uams.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.edu.uams.api.Users;
import org.edu.uams.api.UsersDao;
import org.edu.uams.api.UsersRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

/**
 *
 * @author Pandu.Simbohtu
 */
@Component
public class MyUserDetailsService implements UserDetailsService {

    @Autowired
    @Qualifier("UsersDao")
    UsersDao userDao;

    public UsersDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UsersDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Users users = getUserDao().findByUserName(username);
        if (users != null) {
			//boolean enabled = rs.getBoolean("enabled");
            //boolean accountNonExpired = rs.getBoolean("accountNonExpired");
            //boolean credentialsNonExpired = rs.getBoolean("credentialsNonExpired");
            //boolean accountNonLocked = rs.getBoolean("accountNonLocked");

            return new User(users.getUserName(), users.getPassWord(), true, true, true,
                    true, /*AuthorityUtils.NO_AUTHORITIES*/ getGrantAuthorityList(users.getUsersRoles()));
        }
        return null;
    }

    public List<GrantedAuthority> getGrantAuthorityList(Set<UsersRoles> userRoleNameList) {
        List<GrantedAuthority> authorityList = new ArrayList<GrantedAuthority>();

        for (UsersRoles userRole : userRoleNameList) {
            authorityList.add(new SimpleGrantedAuthority(userRole.getUsersRoleType().getDescription()));
        }

        return authorityList;
    }

}
