package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogOffServlet
 */
@WebServlet("/LogOutControl")
public class LogOutControl extends HttpServlet {
    private static final long serialVersionUID = 1L;
	
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("adminRoles") == null) {
		    session.invalidate();
		    response.sendRedirect(request.getContextPath() + "/common_pages/home.jsp");
		} else {
		    session.invalidate();
		    response.sendRedirect(request.getContextPath() + "/common_pages/login_admin.jsp");
		}

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
    	doGet(request, response);
    }

}
