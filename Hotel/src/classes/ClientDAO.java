package classes;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ClientDAO {

	private static ClientDAO instance = null;

	private ClientDAO() {

	}

	public static ClientDAO getInstance() {
		if (instance == null) {
			instance = new ClientDAO();
		}
		return instance;
	}

	public void ajouter(Client cl) {
		try {

			PreparedStatement prs = ConnectionFactory
					.getConnection()
					.prepareCall(
							"insert into client(nom,prenom,adresse,tel,mail,pass) values(?,?,?,?,?,?)");

			prs.setString(1, cl.getNom());
			prs.setString(2, cl.getPrenom());
			prs.setString(3, cl.getAdresse());
			prs.setString(4, cl.getTel());
			prs.setString(5, cl.getMail());
			prs.setString(6, cl.getPass());

			prs.execute();
		} catch (SQLException ex) {
			Logger.getLogger(ClientDAO.class.getName()).log(Level.SEVERE, null,
					ex);
		}
	}

	


}
