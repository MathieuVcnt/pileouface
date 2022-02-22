package metier;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;

@WebFilter(urlPatterns = { "/jeu.jsp", "/scores.jsp" })
public class Auth implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		PrintWriter out = response.getWriter();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		if (session.getAttribute("login") == null) {
			try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				out.println(e.getMessage());
			}
			try {
				Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/test2", "postgres", "vincent");
				PreparedStatement ps = con.prepareStatement("SELECT login FROM users WHERE login=? AND passwd=?");
				ps.setString(1, request.getParameter("login"));
				ps.setString(2, request.getParameter("passwd"));
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					session.setAttribute("login", rs.getString("login"));
					chain.doFilter(request, response);
				} else {
					resp.sendRedirect("./");
				}
			} catch (SQLException e) {
				out.println(e.getMessage());
			}
		} else {
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}
}
