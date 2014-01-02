package classes;

public class Chambre {

	private String idChambre;
	private String codeHotel;
	private String idCategorie;
	private String numero;
	private String tel;
	private String etage;
	private String image;
	
	

	public Chambre(String idChambre, String codeHotel, String idCategorie,
			String numero, String tel, String etage, String image) {
		super();
		this.idChambre = idChambre;
		this.codeHotel = codeHotel;
		this.idCategorie = idCategorie;
		this.numero = numero;
		this.tel = tel;
		this.etage = etage;
		this.image = image;
	}

	public String getIdChambre() {
		return idChambre;
	}

	public void setIdChambre(String idChambre) {
		this.idChambre = idChambre;
	}

	public String getCodeHotel() {
		return codeHotel;
	}

	public void setCodeHotel(String codeHotel) {
		this.codeHotel = codeHotel;
	}

	public String getIdCategorie() {
		return idCategorie;
	}

	public void setIdCategorie(String idCategorie) {
		this.idCategorie = idCategorie;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEtage() {
		return etage;
	}

	public void setEtage(String etage) {
		this.etage = etage;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Chambre() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "chambre [idChambre=" + idChambre + ", codeHotel=" + codeHotel
				+ ", idCategorie=" + idCategorie + ", numero=" + numero + ", tel="
				+ tel + ", image=" + image + "]";
	}

}
