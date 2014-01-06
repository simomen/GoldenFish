package classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class InfoReservationDAO {

	private static InfoReservationDAO instance = null;

	private InfoReservationDAO() {

	}

	public static InfoReservationDAO getInstance() {
		if (instance == null) {
			instance = new InfoReservationDAO();
		}
		return instance;
	}

	public Vector<InfoReservation> listInfoReservation(String hotel, String db,
			String df, int nbch) {
		Statement s = null;
		ResultSet rs = null;
		Vector<InfoReservation> data = new Vector<InfoReservation>();

		try {
			s = ConnectionFactory.getConnection().createStatement();
			String reqSQL = "SELECT DISTINCT c.* , cat.*  FROM chambre AS c, categoriechambre cat, reservation AS r, hotel AS h WHERE c.idcat=cat.idcat and c.idch NOT  IN ( SELECT idch FROM reservation WHERE datedebut <= '"
					+ df
					+ "' AND datefin >=  '"
					+ db
					+ "' ) AND c.codehotel = h.codehotel AND c.codehotel = '"
					+ hotel + "'  ORDER BY c.idch";

			rs = s.executeQuery(reqSQL);
			int k = 1;
			while (k <= rs.getMetaData().getColumnCount()) {
				System.out.println(rs.getMetaData().getColumnName(k));
				k++;
			}

			while (rs.next()) {
				System.out.println("chamre");
				InfoReservation bc = new InfoReservation();
				bc.setNbch(nbch);
				bc.setDb(db);
				bc.setDf(df);
				bc.setHotel(rs.getString("codehotel"));
				bc.setChambre(rs.getString("idch"));
				bc.setTypechamb(rs.getString("typech"));
				bc.setDescripcham(rs.getString("description"));
				bc.setEtage(rs.getInt("etage"));
				bc.setImage(rs.getString("image"));
				bc.setPrixbase(rs.getDouble("prixbase"));
				bc.setPrixtotal(bc.getPrixbase() * nbch);
				bc.setNblit(rs.getInt("nblit"));
				data.add(bc);
			}

		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return data;

	}

	public Vector<InfoReservation> listInfo(String mail, String pass) {
		Statement s = null;
		ResultSet rs = null;
		Vector<InfoReservation> data = new Vector<InfoReservation>();

		try {
			s = ConnectionFactory.getConnection().createStatement();
			rs = s.executeQuery("select hotel.codehotel,chambre.idch,etage,prixbase,chambre.image,datedebut,datefin,avance from hotel,chambre,categoriechambre,reservation,client where  mail='"
					+ mail
					+ "'and pass ='"
					+ pass
					+ "' and chambre.idcat=categoriechambre.idcat and hotel.codehotel=chambre.codehotel  and client.code=reservation.code and reservation.idch=chambre.idch "
					+ " and datedebut > CURDATE() ");

			while (rs.next()) {
				InfoReservation bc = new InfoReservation();
				bc.setDb(rs.getString(6));
				bc.setDf(rs.getString(7));
				bc.setHotel(rs.getString(1));
				bc.setChambre(rs.getString(2));
				bc.setEtage(rs.getInt(3));
				bc.setImage(rs.getString(5));
				bc.setPrixbase(rs.getDouble(4));
				bc.setPrixtotal(rs.getDouble(8));
				data.add(bc);
			}

		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return data;

	}

	// /////////////partie graphe calcule statisqiue

	public ResultSet graphe_NB_reserv_mois() {
		ResultSet rs = null;

		try {
			rs = ConnectionFactory
					.getConnection()
					.createStatement()
					.executeQuery(
							"select  count(*),MONTH(datedebut) from reservation where YEAR(curdate()) = YEAR(datedebut) group by MONTH(datedebut)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}

	public ResultSet graphe_CAT_DEMAND_année() {
		ResultSet rs = null;

		try {
			rs = ConnectionFactory
					.getConnection()
					.createStatement()
					.executeQuery(
							"select categoriechambre.typech,count(*) from  reservation ,categoriechambre ,chambre  where reservation.idch = chambre.idch and chambre.idcat = categoriechambre.idcat group by categoriechambre.typech");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}

	public ResultSet graphe_productivite_all_years() {
		ResultSet rs = null;
		try {
			rs = ConnectionFactory
					.getConnection()
					.createStatement()
					.executeQuery(
							"select  count(*),MONTH(datedebut),YEAR(datedebut) from reservation    group by MONTH(datedebut)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}

}
