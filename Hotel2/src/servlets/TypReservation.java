package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TypReservation
 */
@WebServlet("/TypReservation")
public class TypReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TypReservation() {
		super();

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
		int index = Integer.parseInt(request.getParameter("index"));
		if (request.getSession().getAttribute("resep") != null) {
			request.getSession().setAttribute("index", index);
			response.sendRedirect("FormulaireReservationDirect.jsp");

		} else {
			request.getSession().setAttribute("index", index);
			response.sendRedirect("FormulaireReservation.jsp");
		}
	}

}
