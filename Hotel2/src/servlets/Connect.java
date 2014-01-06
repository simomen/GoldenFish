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

import classes.Client;
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
		String login = request.getParameter("login");
		String pass = request.getParameter("password");
		String profile = null;
		HttpSession utilisateur = request.getSession();
		HttpSession t = request.getSession();
		try {
			Statement s = ConnectionFactory.getConnection().createStatement();
			ResultSet rs = s.executeQuery("select * from users where login='"
					+ login + "' and pass ='" + pass + "'");

			if (rs.next()) {
				profile = rs.getString("profile");

				switch (profile) {
				case "client":
					Client cl = getClient(login);

					t.setAttribute("login", login);
					t.setAttribute("password", pass);
					utilisateur.setAttribute("user",
							cl.getNom() + " " + cl.getPrenom());
					utilisateur.setAttribute("profile", profile);
					response.sendRedirect("ClientReservation.jsp");

					break;
				case "admin":
					response.sendRedirect("Statestiques.jsp");

					break;
				case "receptinniste":
					response.sendRedirect("Statestiques.jsp");

					break;

				default:
					break;
				}

			} else {
				response.sendError(101, "Connect.jsp");
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public Client getClient(String login) {
		ResultSet rs;
		Statement s;
		Client cl = new Client();
		try {
			s = ConnectionFactory.getConnection().createStatement();
			rs = s.executeQuery("select * from client where login='" + login
					+ "'");

			if (rs.next()) {
				cl.setLogin(login);
				cl.setAdresse(rs.getString("adresse"));
				cl.setCode(rs.getInt("code"));
				cl.setMail(rs.getString("mail"));
				cl.setNom(rs.getString("nom"));
				cl.setPrenom(rs.getString("prenom"));
				cl.setTel(rs.getString("tel"));

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return cl;
	}

}
