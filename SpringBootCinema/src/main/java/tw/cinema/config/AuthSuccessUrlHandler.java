package tw.cinema.config;



import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import tw.cinema.model.Members;
import tw.cinema.service.AuthUserDetailsService;
import tw.cinema.service.UserProfilesService;

@Component
public class AuthSuccessUrlHandler implements AuthenticationSuccessHandler {

	@Autowired
	public UserProfilesService userService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		String username = request.getParameter("username");
		Members members = userService.checkByUsername(username);
		HttpSession session = request.getSession();
		session.setAttribute("members", members);

		String redirectURL = request.getContextPath();

		Collection<? extends GrantedAuthority> collection = authentication.getAuthorities();

		for (GrantedAuthority grantedAuthority : collection) {

			System.out.println("Hello, " + grantedAuthority.getAuthority());
			if (grantedAuthority.getAuthority().equals("ROLE_Admin")) {

				session.setAttribute("admin", grantedAuthority.getAuthority());

				redirectURL = "/admin/managermembers";
				response.sendRedirect(redirectURL);
			} else {

				redirectURL = "/memberCenter";
				response.sendRedirect(redirectURL);

//				request.getSession(true).setAttribute("members", members);
//				System.out.println(request.getAttribute("members"));
			}
//			if(grantedAuthority.getAuthority().equals("ROLE_User")) {
//				
//				redirectURL = "/memberCenter";
//				response.sendRedirect(redirectURL);
//			}			
//			else {
//			
//				redirectURL = "/Home";
//				response.sendRedirect(redirectURL);
//		}
//		}


//		redirectURL = "/login/welcomeadmin";
//		response.sendRedirect(redirectURL);

	}

}
}
