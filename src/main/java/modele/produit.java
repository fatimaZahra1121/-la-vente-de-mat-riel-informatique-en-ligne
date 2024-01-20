package modele;



public class produit {
	private int id;
private String nom;
private String url;
private long price;
private String description;
private int idc;
private int qte;
private int stock;

public produit(String nom, String url, long price, String description) {
	super();
	this.nom = nom;
	this.url = url;
	this.price = price;
	this.description = description;
	
	
}




public int getStock() {
	return stock;
}


public void setStock(int stock) {
	this.stock = stock;
}


public produit(int id, String nom, String url, long price, String description, int idc, int qte) {
	super();
	this.id = id;
	this.nom = nom;
	this.url = url;
	this.price = price;
	this.description = description;
	this.idc = idc;
	this.qte = qte;
}


public produit(String nom, String url, long price, String description, int idc,int qte) {
	super();
	
	this.nom = nom;
	this.url = url;
	this.price = price;
	this.description = description;
	this.idc = idc;
	this.qte=qte;
}


public produit() {
	super();
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getNom() {
	return nom;
}
public void setNom(String nom) {
	this.nom = nom;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}
public long getPrice() {
	return price;
}
public void setPrice(long price) {
	this.price = price;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}


public int getIdc() {
	return idc;
}


public void setIdc(int idc) {
	this.idc = idc;
}


public int getQte() {
	return qte;
}


public void setQte(int qte) {
	this.qte = qte;
}


}
