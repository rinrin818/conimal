package dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String login = (String) session.getAttribute("id");
		
		if (login == null || !login.equals("admin")) {
			response.sendRedirect(request.getContextPath() + "/member/alert?id=admin");
			return false;
		} else {
			return true;
		}
		
	}
}
