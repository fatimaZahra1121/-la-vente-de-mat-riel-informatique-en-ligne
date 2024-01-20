package Datalayer;

import java.sql.SQLException;

import modele.categorie;

public interface cate {
	public int getIdcat(String nom) throws SQLException;
	public void ajoutercat(categorie d);
	public categorie getCat(int id);
	void modifierCat(categorie p);
	public void suprimerCat(int id);
}
