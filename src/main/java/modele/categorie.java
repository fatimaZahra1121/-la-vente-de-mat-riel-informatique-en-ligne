package modele;



public class categorie {
private String url;
private String nom;
private int id;
public categorie(String url, String nom,int id) {
	super();
	this.url = url;
	this.nom = nom;
	this.id=id;
}
public categorie(String url, String nom) {
	super();
	this.url = url;
	this.nom = nom;
}

public categorie() {
	super();
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}
public String getNom() {
	return nom;
}
public  void setNom(String nom) {
	this.nom = nom;
}

}

