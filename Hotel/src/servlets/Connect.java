package servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.ConnectionFactory;

/**
 * Servlet implementation class Connect
 */
@WebServlet("/Connect")
public class Connect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public Connect() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("login");
		String pass = request.getParameter("pass");
		String profile=request.getParameter("profile");
		try {
		if(profile.equals("Client")){
	

						Statement s = ConnectionFactory.getConnection().createStatement();
						ResultSet rs = s
								.executeQuery("select * from client where mail='"
										+ user + "'and pass ='" + pass + "'");
						HttpSession utilisateur = request.getSession();
						HttpSession t = request.getSession();
						if (rs.next()) {
							t.setAttribute("login", user);
							t.setAttribute("pass", pass);
							utilisateur.setAttribute("user", rs.getString(2) +" "+ rs.getString(3));
							utilisateur.setAttribute("profile", rs.getString(4));
							response.sendRedirect("ClientReservation.jsp");
						} else{
							response.sendRedirect("Connect.jsp");
						}
	} else if(profile.equals("Admin")){
				if(rech(user, pass).next()){
					response.sendRedirect("Statestiques.jsp");
				}else{
					response.sendRedirect("Connect.jsp");
				}
	}else{
				if(rech(user, pass).next()){
					request.getSession().setAttribute("resep", user);
					response.sendRedirect("Reservation.jsp");
				}else{
					response.sendRedirect("Connect.jsp");
				}
	}
		
		
		}catch (SQLException e) {

				e.printStackTrace();
		}
		
}	

	
public ResultSet rech(String user,String pass){
	ResultSet rs=null;
	Statement s;
	try {
		s = ConnectionFactory.getConnection().createStatement();
		 rs = s.executeQuery("select * from users where login='"
				+ user + "'and pass ='" + pass + "'");
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	
	
	return rs;
}






}
