package tw.cinema.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebAppConfig implements WebMvcConfigurer {

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		
		registry.addViewController("/login/page").setViewName("login");
		registry.addViewController("/Home").setViewName("Home");
		registry.addViewController("/logout").setViewName("logoutResult");
		registry.addViewController("/logout/page").setViewName("logout");
		registry.addViewController("/admins/welcomeadmin").setViewName("welcomeadmin");
		registry.addViewController("/forgotpwd").setViewName("members/forestage/forgotpwd");
        registry.addViewController("/resetpwd").setViewName("members/forestage/resetpwd");
        registry.addViewController("/memberCenter").setViewName("members/forestage/memberCenter");
        registry.addViewController("/memberSuccess").setViewName("members/backstage/memberSuccess"); 
}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/resources/images/");
	}
    
}
