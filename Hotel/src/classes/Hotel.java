package classes;

public class Hotel {

	private String codehotel;
	private String adresse;
	private String codepostal;
	private String ville;
	private String tel;
	private String image;
	private String description_hote;

	public String getCodehotel() {
		return codehotel;
	}

	public void setCodehotel(String codehotel) {
		this.codehotel = codehotel;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getCodepostal() {
		return codepostal;
	}

	public void setCodepostal(String codepostal) {
		this.codepostal = codepostal;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription_hote() {
		return description_hote;
	}

	public void setDescription_hote(String description_hote) {
		this.description_hote = description_hote;
	}

	public Hotel(String codehotel, String adresse, String codepostal,
			String ville, String tel, String image, String description) {
		super();
		this.codehotel = codehotel;
		this.adresse = adresse;
		this.codepostal = codepostal;
		this.ville = ville;
		this.tel = tel;
		this.image = image;
	}

	public Hotel() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "hotel [codehotel=" + codehotel + ", adresse=" + adresse
				+ ", codepostal=" + codepostal + ", ville=" + ville + ", tel="
				+ tel + ", image=" + image + ", description= "
				+ description_hote + "]";
	}

}
