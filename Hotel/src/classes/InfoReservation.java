package classes;

public class InfoReservation {

	private String hotel;
	private String chambre;
	private int etage;
	private double prixbase;
	private double prixtotal;
	private String image;
	private String db;
	private String df;
	private int nbch,nben,nbad;
	private int nblit ;
	public int getNblit() {
		return nblit;
	}
	public void setNblit(int nblit) {
		this.nblit = nblit;
	}
	public String getHotel() {
		return hotel;
	}
	public void setHotel(String hotel) {
		this.hotel = hotel;
	}
	public String getChambre() {
		return chambre;
	}
	public void setChambre(String chambre) {
		this.chambre = chambre;
	}
	public int getEtage() {
		return etage;
	}
	public void setEtage(int etage) {
		this.etage = etage;
	}
	public double getPrixbase() {
		return prixbase;
	}
	public void setPrixbase(double prixbase) {
		this.prixbase = prixbase;
	}
	public double getPrixtotal() {
		return prixtotal;
	}
	public void setPrixtotal(double prixtotal) {
		this.prixtotal = prixtotal;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDb() {
		return db;
	}
	public void setDb(String db) {
		this.db = db;
	}
	public String getDf() {
		return df;
	}
	public void setDf(String df) {
		this.df = df;
	}
	public int getNbch() {
		return nbch;
	}
	public void setNbch(int nbch) {
		this.nbch = nbch;
	}
	public int getNben() {
		return nben;
	}
	public void setNben(int nben) {
		this.nben = nben;
	}
	public int getNbad() {
		return nbad;
	}
	public void setNbad(int nbad) {
		this.nbad = nbad;
	}
	public InfoReservation(String hotel, String chambre, int etage,
			double prixbase, double prixtotal, String image, String db,
			String df, int nbch, int nben, int nbad,int nblit) {
		super();
		this.hotel = hotel;
		this.chambre = chambre;
		this.etage = etage;
		this.prixbase = prixbase;
		this.prixtotal = prixtotal;
		this.image = image;
		this.db = db;
		this.df = df;
		this.nbch = nbch;
		this.nben = nben;
		this.nbad = nbad;
		this.nblit=nblit;
	}
	public InfoReservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "InfoReservation [hotel=" + hotel + ", chambre=" + chambre
				+ ", etage=" + etage + ", prixbase=" + prixbase
				+ ", prixtotal=" + prixtotal + ", image=" + image + ", db="
				+ db + ", df=" + df + ", nbch=" + nbch + ", nben=" + nben
				+ ", nbad=" + nbad + "]";
	}
	
	
}
