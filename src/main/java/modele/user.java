package modele;


public class user {
	private String mail;
	private String pass;
	private int id;
	private String option;
	private String adresse;
	private String nom;
	private String prenom;
	
	
	public user() {
		super();
	}
	public user(int id, String adresse) {
		super();
		this.id = id;
		this.adresse = adresse;
	}
	public user(String mail, String pass) {
		super();
		this.mail = mail;
		this.pass = pass;
	}
	
	
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public user(String mail, String pass,int id, String option) {
		super();
		this.mail = mail;
		this.pass = pass;
		this.id=id;
		this.option = option;
	}
	public user(String mail, String pass, int id) {
		super();
		this.mail = mail;
		this.pass = pass;
		this.id = id;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	

}
