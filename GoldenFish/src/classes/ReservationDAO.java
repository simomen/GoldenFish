package classes;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 import net.sf.jasperreports.engine.JRException;
 import net.sf.jasperreports.engine.JasperCompileManager;
 import net.sf.jasperreports.engine.JasperExportManager;
 import net.sf.jasperreports.engine.JasperFillManager;
 import net.sf.jasperreports.engine.JasperPrint;
 import net.sf.jasperreports.engine.JasperReport;
 import net.sf.jasperreports.engine.design.JasperDesign;
 import net.sf.jasperreports.engine.xml.JRXmlLoader;
 */
public class ReservationDAO {

	private static ReservationDAO instance = null;

	private ReservationDAO() {
	}

	public static ReservationDAO getInstance() {
		if (instance == null) {
			instance = new ReservationDAO();
		}
		return instance;
	}

	// debut du code a verifier
	public void ajouter(Reservation cl) {
		try {

			PreparedStatement prs = ConnectionFactory
					.getConnection()
					.prepareCall(
							"insert into reservation(libe,idch,code,datedebut,datefin,nbrjour,avance) values(?,?,?,?,?,?,?)");

			prs.setString(1, cl.getLib());
			prs.setString(2, cl.getIdch());
			prs.setInt(3, cl.getCode());
			prs.setString(4, cl.getDb());
			prs.setString(5, cl.getDf());
			prs.setInt(6, cl.getNbjour());
			prs.setDouble(7, cl.getAvance());

			prs.execute();
		} catch (SQLException ex) {
			Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE,
					null, ex);
		}
	}

	public void Supprimer(String idch, String db, String df) {
		try {

			PreparedStatement prs = ConnectionFactory
					.getConnection()
					.prepareCall(
							"delete from reservation where idch=? and datedebut=? and datefin=?");

			prs.setString(1, idch);
			prs.setString(2, db);
			prs.setString(3, df);

			prs.execute();
		} catch (SQLException ex) {
			Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE,
					null, ex);
		}
	}

	public static int nbjour(String db, String df) {
		long CONST_DURATION_OF_DAY = 1000l * 60 * 60 * 24;
		Calendar calendar1 = new GregorianCalendar();
		calendar1.set(Calendar.YEAR, Integer.parseInt(db.substring(0, 4)));
		calendar1.set(Calendar.MONTH, Integer.parseInt(db.substring(5, 7)));
		calendar1.set(Calendar.DAY_OF_MONTH,
				Integer.parseInt(db.substring(8, 10)));
		Date date1 = calendar1.getTime();
		Calendar calendar2 = new GregorianCalendar();
		calendar2.set(Calendar.YEAR, Integer.parseInt(df.substring(0, 4)));
		calendar2.set(Calendar.MONTH, Integer.parseInt(df.substring(5, 7)));
		calendar2.set(Calendar.DAY_OF_MONTH,
				Integer.parseInt(df.substring(8, 10)));
		Date date2 = calendar2.getTime();
		long diff = Math.abs(date2.getTime() - date1.getTime());
		long numberOfDay = (long) diff / CONST_DURATION_OF_DAY;
		return (int) numberOfDay;

	}

	// fin du code a verifier

	public Chambre verifDispo(String dateDeb, String dateFin, String categChmb,
			int nbChmb, String ville) {

		try {
			String reqSQL = "SELECT DISTINCT c.* FROM chambre AS c, reservation AS r, hotel AS h WHERE c.idch NOT  IN ( SELECT idch FROM reservation WHERE datedebut <= '"
					+ dateFin
					+ "' AND datefin >=  '"
					+ dateDeb
					+ "' ) AND c.codehotel = h.codehotel AND h.ville = '"
					+ ville
					+ "' AND c.idcat = '"
					+ categChmb
					+ "' ORDER BY c.idch";

			System.out.println(reqSQL);
			Statement s = ConnectionFactory.getConnection().createStatement();
			ResultSet rs = s.executeQuery(reqSQL);
			System.out.println("verifier dispo");
			if (rs.next()) {
				System.out.println("chambre disponible");
				return new Chambre(rs.getString("idch"),
						rs.getString("codehotel"), rs.getString("idcat"),
						rs.getString("numero"), rs.getString("tel"),
						rs.getString("etage"), rs.getString("image"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;

	}
	/*
	 * public static void facturer(int code, String db) { String url =
	 * "jdbc:mysql://localhost/gestionhotel"; String login = "root"; String
	 * password = "youssef"; Connection connection = null; try {
	 * System.out.println(0); java.sql.Driver monDriver = new
	 * com.mysql.jdbc.Driver(); DriverManager.registerDriver(monDriver);
	 * connection = DriverManager.getConnection(url, login, password);
	 * 
	 * // - Chargement et compilation du rapport JasperDesign jasperDesign =
	 * JRXmlLoader .load("C://Users//vaio//hotele.jrxml");
	 * 
	 * JasperReport jasperReport = JasperCompileManager
	 * .compileReport(jasperDesign);
	 * 
	 * // - Paramètres à envoyer au rapport Map parameters = new HashMap();
	 * parameters.put("code", code); parameters.put("datedebut", db); // -
	 * Execution du rapport JasperPrint jasperPrint =
	 * JasperFillManager.fillReport( jasperReport, parameters, connection); int
	 * y = (int) (Math.random() * 100 + 1); String file="classic"+y+".pdf";
	 * 
	 * // - Création du rapport au format PDF
	 * 
	 * JasperExportManager.exportReportToPdfFile(jasperPrint,
	 * "C://Users//vaio//"+file); Runtime.getRuntime().exec(
	 * "rundll32 url.dll,FileProtocolHandler " + "C://Users//vaio//"+file); }
	 * catch (JRException e) {
	 * 
	 * e.printStackTrace(); } catch (Exception e) {
	 * 
	 * e.printStackTrace(); } finally { try {
	 * 
	 * } catch (Exception e) {
	 * 
	 * e.printStackTrace(); } } }
	 */

}
