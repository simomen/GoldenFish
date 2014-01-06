package graphe;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.data.time.Month;
import org.jfree.data.time.TimeSeries;
import org.jfree.data.time.TimeSeriesCollection;
import org.jfree.data.time.Year;


import classes.InfoReservationDAO;

/**
 * Servlet implementation class Graphe_productivite_all_years
 */
@WebServlet("/Graphe_productivite_all_years")
public class Graphe_productivite_all_years extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Graphe_productivite_all_years() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
TimeSeries series = new TimeSeries("Nombre de clients par mois", Month.class);
		
		ResultSet rs = InfoReservationDAO.getInstance().graphe_productivite_all_years();
		 try {
	 while(rs.next()){
		 
		 	Year year = new Year(Integer.valueOf(rs.getInt(3)));
		 	
			series.add(new Month(Integer.valueOf(rs.getInt(2)), year), Integer.valueOf(rs.getInt(1)));
			
	 }
    
	 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   
    final TimeSeriesCollection dataset = new TimeSeriesCollection(series);
    final JFreeChart chart = ChartFactory.createTimeSeriesChart(
        "Productivité de tous les années",
        "Month", 
        "Value",
        dataset,
        true,
        true,
        false
    );
    chart.fireChartChanged();
    chart.isBorderVisible();
    
    
    
    
    
     

    OutputStream out = response.getOutputStream(); 
    response.setContentType("image/png"); 
  	ChartUtilities.writeChartAsPNG(out, chart, 550, 400);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
