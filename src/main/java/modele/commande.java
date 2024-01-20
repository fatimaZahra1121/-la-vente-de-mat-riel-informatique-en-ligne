package modele;



import java.sql.Date;
import java.time.LocalDate;

public class commande {
private String username;
private int nombre;
private float prixT;
private Date date;
private LocalDate todaysDate;
private String etat;
private int id;
private int qte;
private String adresseLivraison;
private int idC;
private int iduser;

public int getIdC() {
	return idC;
}
public void setIdC(int idC) {
	this.idC = idC;
}

public LocalDate getTodaysDate() {
	return todaysDate;
}
public void setTodaysDate(LocalDate todaysDate) {
	this.todaysDate = todaysDate;
}


public commande(float prixT, LocalDate todaysDate, String etat, int id, int qte, int idC, int iduser) {
	super();
	this.prixT = prixT;
	this.todaysDate = todaysDate;
	this.etat = etat;
	this.id = id;
	this.qte = qte;
	this.idC = idC;
	this.iduser = iduser;
}
public commande(float prixT, LocalDate todaysDate, String etat, int id, int qte, int idC) {
	super();
	this.prixT = prixT;
	this.todaysDate = todaysDate;
	this.etat = etat;
	this.id = id;
	this.qte = qte;
	this.idC = idC;
}
public int getIduser() {
	return iduser;
}
public void setIduser(int iduser) {
	this.iduser = iduser;
}
public commande(int nombre, float prixT, LocalDate todaysDate, String etat, String adresseLivraison, int idC) {
	super();
	this.nombre = nombre;
	this.prixT = prixT;
	this.todaysDate = todaysDate;
	this.etat = etat;
	this.adresseLivraison = adresseLivraison;
	this.idC = idC;
}
public commande(String username, int nombre, float prixT, Date date, String etat, int id, int qte,
		String adresseLivraison, int idC) {
	super();
	this.username = username;
	this.nombre = nombre;
	this.prixT = prixT;
	this.date = date;
	this.etat = etat;
	this.id = id;
	this.qte = qte;
	this.adresseLivraison = adresseLivraison;
	this.idC = idC;
}
public commande(String username, int nombre, float prixT, Date date, String etat, int id, int qte) {
	super();
	this.username = username;
	this.nombre = nombre;
	this.prixT = prixT;
	this.date = date;
	this.etat = etat;
	this.id = id;
	this.qte = qte;
}
public commande() {
	super();
}
public String getAdresseLivraison() {
	return adresseLivraison;
}
public void setAdresseLivraison(String adresseLivraison) {
	this.adresseLivraison = adresseLivraison;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public int getNombre() {
	return nombre;
}
public void setNombre(int nombre) {
	this.nombre = nombre;
}
public float getPrixT() {
	return prixT;
}
public void setPrixT(float prixT) {
	this.prixT = prixT;
}
public int getQte() {
	return qte;
}
public void setQte(int qte) {
	this.qte = qte;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}
public String getEtat() {
	return etat;
}
public void setEtat(String etat) {
	this.etat = etat;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}

}

