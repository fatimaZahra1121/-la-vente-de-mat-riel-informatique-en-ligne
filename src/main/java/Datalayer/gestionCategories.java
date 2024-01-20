package Datalayer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modele.categorie;



public class gestionCategories {
	public List<categorie> getListcategorie() throws SQLException{
		List<categorie> list=new ArrayList<categorie>();
	Connection con=connection.getConnection();
	java.sql.Statement st;
	st=con.createStatement();
	String query = "select * from categories";
	ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
	
	while(rs.next()) {
		categorie p=new categorie();
  p.setUrl(rs.getString(1));
  p.setNom(rs.getString(2));
  p.setId(rs.getInt(3));
 
 
  list.add(p);

	} 
	return list;
	}
	public int getIdcat(String nom) throws SQLException
	{
		Connection con=connection.getConnection();
		java.sql.Statement st;
		st=con.createStatement();
		String query = "select id from categories where nom='"+nom+"'";
		System.out.println(query);
		ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
		
		while(rs.next()) {
			
		
			return rs.getInt(1);
						
	}
		return 0;
	}
	
	
	
	public void ajoutercat(categorie d) {
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			
			st.executeUpdate("insert into categories (url,nom,id) Values('"+d.getUrl()+"','"+d.getNom()+"',NULL)");
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		public categorie getCat(int id) throws SQLException
		{
			Connection con=connection.getConnection();
			java.sql.Statement st;
			categorie p=new categorie();
			st=con.createStatement();
			String query = "select * from categories where id="+id;
			ResultSet rs;
			try {
				rs = ((java.sql.Statement) st).executeQuery(query);
				
				
					while(rs.next()) {
						
				  p.setUrl(rs.getString(1));
				  p.setNom(rs.getString(2));
				 
			 

				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return p;
			
		}	
		
		
		public void modifierCat(categorie p) {
			Connection con=connection.getConnection();
			java.sql.Statement st;
			try {
				st=con.createStatement();
				//System.out.println("UPDATE categories set url='"+p.getUrl()+"',nom='"+p.getNom()+"'");
				st.executeUpdate("UPDATE categories"
						+ " set url='"+p.getUrl()+"',nom='"+p.getNom()+"'  "
						+ ""+ "where id="+p.getId()+"");
				System.out.println("UPDATE produit"
						+ " set url='"+p.getUrl()+"',nom='"+p.getNom()+"'  "
						+ ""+ "where id="+p.getId()+"");
				//System.out.println("UPDATE produit set url='"+p.getUrl()+"',nom='"+p.getNom()+"',price="+p.getPrice()+"idc="+p.getIdc()+"qte="+p.getQte()+"where id="+p.getId()+"");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		public void suprimerCat(int id)
		{
			Connection con=connection.getConnection();
			java.sql.Statement st;
			try {
				st=con.createStatement();
				
				st.executeUpdate("delete from categories where id="+id);
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}


		public List<categorie> getCategorieParMc(String Mc) {

			List<categorie> list=new ArrayList<categorie>();
			Connection con=connection.getConnection();
			java.sql.Statement st;
			try {
				st=con.createStatement();
				String query = "select * from categories  where nom like '%"+Mc+"%' ";
				ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
				
				while(rs.next()) {
					categorie p=new categorie();
			  p.setUrl(rs.getString(1));
			  p.setNom(rs.getString(2));
			  p.setId(rs.getInt(3));
			 	 
			  list.add(p);

				} 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return list;

			
		}

}
