package Datalayer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import modele.produit;




public class gestionProduit {

	public List<produit> getListproduit() throws SQLException{
		List<produit> list=new ArrayList<produit>();
	Connection con=connection.getConnection();
	java.sql.Statement st;
	st=con.createStatement();
	String query = "select * from produit  ";
	ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
	
	while(rs.next()) {
		produit p=new produit();
  p.setUrl(rs.getString(1));
  p.setNom(rs.getString(2));
  p.setPrice(rs.getLong(3));
  p.setDescription(rs.getString(4));
  p.setId(rs.getInt(5));
  p.setStock(rs.getInt(7));

 
  list.add(p);
  list.add(p);

	} 

	return list;
	}
	public produit getproduit(int id) throws SQLException
	{
		Connection con=connection.getConnection();
		java.sql.Statement st;
		produit p=new produit();
		st=con.createStatement();
		String query = "select * from produit where id="+id;
		ResultSet rs;
		try {
			rs = ((java.sql.Statement) st).executeQuery(query);
			
			
				while(rs.next()) {
					
			  p.setUrl(rs.getString(1));
			  p.setNom(rs.getString(2));
			  p.setPrice(rs.getLong(3));
			  p.setDescription(rs.getString(4));
			  p.setId(rs.getInt(5));
			  p.setIdc(rs.getInt(6));
			  p.setStock(rs.getInt(7));

			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return p;
		
	}
	public List<produit> simalire(int id) throws SQLException{
		List<produit> list=new ArrayList<produit>();
		Connection con=connection.getConnection();
		java.sql.Statement st;
		st=con.createStatement();
		String query = "select * from produit p where p.idc=(select idc from produit where id="+id+") and id!="+id+"";
		System.out.println(query);
		ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
		
		while(rs.next()) {
			produit p=new produit();
	  p.setUrl(rs.getString(1));
	  p.setNom(rs.getString(2));
	  p.setPrice(rs.getLong(3));
	  p.setDescription(rs.getString(4));
	  p.setId(rs.getInt(5));
	  p.setStock(rs.getInt(7));

	 
	  list.add(p);
	  list.add(p);

		} 

		return list;
	}
	public List<produit> getListproduitCat(int id) throws SQLException{
		List<produit> list=new ArrayList<produit>();
	Connection con=connection.getConnection();
	java.sql.Statement st;
	st=con.createStatement();
	String query = "select * from produit where idc="+id;
	ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
	
	while(rs.next()) {
		produit p=new produit();
  p.setUrl(rs.getString(1));
  p.setNom(rs.getString(2));
  p.setPrice(rs.getLong(3));
  p.setDescription(rs.getString(4));
  p.setId(rs.getInt(5));
  p.setIdc(rs.getInt(6));
  p.setStock(rs.getInt(7));
 
  list.add(p);

	} 
	return list;
	}
	public List<Double> getprice() {
		List<Double> list=new ArrayList<Double>();
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			String query = "select max(price),min(price) from produit ";
			ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
			
			while(rs.next()) {
			
		 list.add(rs.getDouble(1));
		 list.add(rs.getDouble(2));
		 
		
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		return list;
		}
	
		
	public List<produit> getListproduitPrice(double price) throws SQLException{
		List<produit> list=new ArrayList<produit>();
	Connection con=connection.getConnection();
	java.sql.Statement st;
	st=con.createStatement();
	String query = "select * from produit where price<="+price;
	System.out.println(query);
	ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
	
	while(rs.next()) {
		produit p=new produit();
  p.setUrl(rs.getString(1));
  p.setNom(rs.getString(2));
  p.setPrice(rs.getLong(3));
  p.setDescription(rs.getString(4));
  p.setId(rs.getInt(5));
 
  list.add(p);

	} 
	return list;
	}
	public List<produit> chercher(String motcle) throws SQLException{
		List<produit> list=new ArrayList<produit>();
	Connection con=connection.getConnection();
	java.sql.Statement st;
	st=con.createStatement();
	String query = "select * from produit p where   p.nom like '%"+motcle+"%' ";
	
	System.out.println(query);
	ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
	
	while(rs.next()) {
		produit p=new produit();
  p.setUrl(rs.getString(1));
  p.setNom(rs.getString(2));
  p.setPrice(rs.getLong(3));
  p.setDescription(rs.getString(4));
  p.setId(rs.getInt(5));
 
  list.add(p);

	} 
	return list;
	}
	public void ajouterprod(produit d) {
		Connection con=connection.getConnection();
		java.sql.Statement st;
		//System.out.println("insert into produit (url,nom,price,description,id,idc,stock) Values('"+d.getUrl()+"','"+d.getNom()+"',"+d.getPrice()+",'"+d.getDescription()+"',NULL,"+d.getIdc()+","+d.getQte()+")");
		
		try {
			st=con.createStatement();
			
			st.executeUpdate("insert into produit (url,nom,price,description,id,idc,stock) Values('"+d.getUrl()+"','"+d.getNom()+"',"+d.getPrice()+",'"+d.getDescription()+"',NULL,"+d.getIdc()+","+d.getQte()+")");
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void suprimerProd(int id) {
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			
			st.executeUpdate("delete from produit where id="+id);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void modifierProd(produit p) {
		Connection con=connection.getConnection();
		java.sql.Statement st;
		System.out.println("from mdel:"+p.getIdc());
		try {
			st=con.createStatement();
			System.out.println("UPDATE produit"
						+ " set url='"+p.getUrl()+"',nom='"+p.getNom()+"',price="+p.getPrice()+",stock="+p.getStock()+ "  "
						+ ""+ "where id="+p.getId()+"");
			if(p.getIdc()==0)
				st.executeUpdate("UPDATE produit"
						+ " set url='"+p.getUrl()+"',nom='"+p.getNom()+"',price="+p.getPrice()+",stock="+p.getStock()+ "  "
						+ ""+ "where id="+p.getId()+"");
			//System.out.println("UPDATE produit set url='"+p.getUrl()+"',nom='"+p.getNom()+"',price="+p.getPrice()+",idc="+p.getIdc()+",stock="+p.getStock()+"  where id="+p.getId()+"");
			
			else
			st.executeUpdate("UPDATE produit"
					+ " set url='"+p.getUrl()+"',nom='"+p.getNom()+"',price="+p.getPrice()+",idc=  "+p.getIdc()+",stock="+p.getStock()+ "  "
					+ ""+ "where id="+p.getId()+"");
			//System.out.println("UPDATE produit set url='"+p.getUrl()+"',nom='"+p.getNom()+"',price="+p.getPrice()+"idc="+p.getIdc()+"stock="+p.getQte()+"where id="+p.getId()+"");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public List<produit> getProduitParMc(String Mc) {

		List<produit> list=new ArrayList<produit>();
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			String query = "select p.* from produit p,categories c where p.idc=c.id and p.nom like '%"+Mc+"%' or c.nom like '%"+Mc+"%'";
			ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
			
			while(rs.next()) {
				produit p=new produit();
		  p.setUrl(rs.getString(1));
		  p.setNom(rs.getString(2));
		  p.setPrice(rs.getLong(3));
		  p.setDescription(rs.getString(4));
		  p.setId(rs.getInt(5));
		 
		  list.add(p);

			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;

		
	}
	public int sales(int id)
	{
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			String query = "select sum(qte) from produit p,commande c where p.id=c.idP and p.id="+id;
			System.out.println(query);
			ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
			
			while(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	public int countproduct(int id) {
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			String query = "select count(p.id) from produit p,categories c where p.idc=c.id and c.id="+id;
			ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
			
			while(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	public String prodCta(int id)
	{
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			String query = "select  c.nom from produit p,categories c where p.idC=c.id and p.id="+id;
			ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
			
			while(rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public List<produit> getProduit(String Mc) {

		List<produit> list=new ArrayList<produit>();
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			String query = "select p.* from produit p,categories c where p.idc=c.id and c.nom="+Mc;
			ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
			
			while(rs.next()) {
				produit p=new produit();
		  p.setUrl(rs.getString(1));
		  p.setNom(rs.getString(2));
		  p.setPrice(rs.getLong(3));
		  p.setDescription(rs.getString(4));
		  p.setId(rs.getInt(5));
		 
		  list.add(p);

			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;

		
	}
	public List<produit> getProduitStock() {

		List<produit> list=new ArrayList<produit>();
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			String query = "select * from produit p where stock>0";
			ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
			
			while(rs.next()) {
				produit p=new produit();
		  p.setUrl(rs.getString(1));
		  p.setNom(rs.getString(2));
		  p.setPrice(rs.getLong(3));
		  p.setDescription(rs.getString(4));
		  p.setId(rs.getInt(5));
		  p.setStock(rs.getInt(7));
		 
		  list.add(p);

			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;

		
	}
	public List<produit> getProduitIStock() {

		List<produit> list=new ArrayList<produit>();
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			String query = "select * from produit p where stock=0 or stock is null";
			ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
			
			while(rs.next()) {
				produit p=new produit();
		  p.setUrl(rs.getString(1));
		  p.setNom(rs.getString(2));
		  p.setPrice(rs.getLong(3));
		  p.setDescription(rs.getString(4));
		  p.setId(rs.getInt(5));
		 
		  list.add(p);

			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;

		
	}
}
