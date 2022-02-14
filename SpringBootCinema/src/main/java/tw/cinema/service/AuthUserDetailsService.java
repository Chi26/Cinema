package tw.cinema.service;



import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tw.cinema.model.Members;

@Service
public class AuthUserDetailsService implements UserDetailsService {

	@Autowired
	private UserProfilesService upService;
	

	

	
	private Map<String, User> roles = new HashMap<String, User>();

	
	@PostConstruct
	public void init() {

		roles.put("admin",
				new User("admin", "{noop}test12345", Collections.singletonList(new SimpleGrantedAuthority("Admin"))));

	}


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		if (("admin").equals(username)) {
			return roles.get("admin");
		}

		Members members = upService.getByName(username);

		System.out.println(members.getUsername());
		return new User(members.getUsername(), members.getPassword(),
//				Collections.singletonList(new SimpleGrantedAuthority("User")));
		Collections.singletonList(new SimpleGrantedAuthority(members.getRole())));

	}

//	private Collection < ? extends GrantedAuthority > mapRolesToAuthorities(Collection < Role > roles) {
//        return roles.stream()
//            .map(role - > new SimpleGrantedAuthority(role.getName()))
//            .collect(Collectors.toList());
//    }

}

