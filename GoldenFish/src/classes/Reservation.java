package classes;

public class Reservation {

	private int id;
	private String lib;
	private int code;
	private String idch;
	private String db;
	private String df;
	private int nbjour;
	private double avance;
	public int getId() {
		return id;
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getLib() {
		return lib;
	}
	public void setLib(String lib) {
		this.lib = lib;
	}
	public String getIdch() {
		return idch;
	}
	public void setIdch(String idch) {
		this.idch = idch;
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
	public int getNbjour() {
		return nbjour;
	}
	public void setNbjour(int nbjour) {
		this.nbjour = nbjour;
	}
	public double getAvance() {
		return avance;
	}
	public void setAvance(double avance) {
		this.avance = avance;
	}
	public Reservation(int id, String lib, String idch, String db, String df,
			int nbjour, double avance,int code) {
		super();
		this.id = id;
		this.lib = lib;
		this.idch = idch;
		this.db = db;
		this.df = df;
		this.nbjour = nbjour;
		this.avance = avance;
		this.code=code;
	}
	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Reservation [id=" + id + ", lib=" + lib + ", idch=" + idch
				+ ", db=" + db + ", df=" + df + ", nbjour=" + nbjour
				+ ", avance=" + avance + "]";
	}
	
	
}
