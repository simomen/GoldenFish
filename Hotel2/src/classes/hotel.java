package classes;

public class hotel {

	
	private String codehotel;
	private String adresse;
	private String codepostal;
	private String ville;
	private String tel;
	private String image;
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
	public hotel(String codehotel, String adresse, String codepostal,
			String ville, String tel, String image) {
		super();
		this.codehotel = codehotel;
		this.adresse = adresse;
		this.codepostal = codepostal;
		this.ville = ville;
		this.tel = tel;
		this.image = image;
	}
	public hotel() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "hotel [codehotel=" + codehotel + ", adresse=" + adresse
				+ ", codepostal=" + codepostal + ", ville=" + ville + ", tel="
				+ tel + ", image=" + image + "]";
	}
	
	
}
