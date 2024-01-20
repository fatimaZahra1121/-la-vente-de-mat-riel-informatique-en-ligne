package Datalayer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modele.commande;
import modele.produit;



public class gestionCommande {
	public void suprimmerCommande(int id)
	{
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			
			st.executeUpdate("delete from commande where idCom="+id);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	public ArrayList<commande> getListcommandes(int id) throws SQLException{
		ArrayList<commande> list=new ArrayList<commande>();
	Connection con=connection.getConnection();
	java.sql.Statement st;
	st=con.createStatement();
	String query = "select * from commande where iduser="+id;
	ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
	
	while(rs.next()) {
		commande p=new commande();
  p.setId(rs.getInt(1));
  //p.setIdCl(rs.getInt(2));
  p.setDate(rs.getDate(4));
  p.setEtat(rs.getString(5));
  p.setPrixT(rs.getFloat(7));
 
  list.add(p);

	} 
	return list;
	}
	public List<commande> getCommandes()
	{
		List<commande> list=new ArrayList<commande>();
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			
			String query = "select c.idCom,u.mail,c.etat,count(c.idP),sum(c.qte),c.dateCom ,sum(c.Totale)  from commande c,user u where c.iduser=u.id group by c.idCom";
			ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
			//System.out.println(query);
			while(rs.next()) {
				commande p=new commande();
		  p.setId(rs.getInt(1));
		  p.setUsername(rs.getString(2));
		  p.setEtat(rs.getString(3));
		  p.setNombre(rs.getInt(4));
		  p.setPrixT(rs.getFloat(7));
		  p.setDate(rs.getDate(6));
		 p.setQte(rs.getInt(5));
		  list.add(p);

			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;

		
	}
	public List<produit> getCommandeProd(int id)
	{
		List<produit> list=new ArrayList<produit>();
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			
			String query = "select DISTINCT(p.id),p.url,p.nom,p.stock,c.qte,c.qte*p.price from commande c,produit p,categories ct where c.idP=p.id  and c.idCom="+id;
			System.out.println(query);
			ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
			System.out.println(query);
			while(rs.next()) {
				produit p=new produit();
				p.setId(rs.getInt(1));
		       p.setUrl(rs.getString(2));
		       p.setNom(rs.getString(3));
		       p.setStock(rs.getInt(4));
		       p.setPrice(rs.getLong(6));
		       p.setQte(rs.getInt(5));
		       
		      list.add(p);

			} 
		} catch (SQLException e) {
			// TODO uto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	public int Id()
	{
		List<commande> list=new ArrayList<commande>();
		Connection con=connection.getConnection();
		java.sql.Statement st ;

		String query;
	
			
		 query = "select max(idCom) from commande";
			//System.out.println( "select c.idCom,u.mail,c.etat,count(c.idP),sum(c.qte),c.dateCom ,c.Totale  from commande c,user u where c.iduser=u.id  and c.idCom="+m+"  group by c.idCom");
	
		
		
		try {
			st=con.createStatement();
			ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
			
			while(rs.next()) {
				
		return rs.getInt(1);
		

			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		return  0;		
	}
	public List<commande> chercherCom(String m1) 
	{
		List<commande> list=new ArrayList<commande>();
		Connection con=connection.getConnection();
		java.sql.Statement st ;

		String query;
		try {
		int m=Integer.parseInt(m1);
			
		 query = "select c.idCom,u.mail,c.etat,count(c.idP),sum(c.qte),c.dateCom ,sum(c.Totale)  from commande c,user u where c.iduser=u.id  and c.idCom="+m+"  group by c.idCom";
			System.out.println( "select c.idCom,u.mail,c.etat,count(c.idP),sum(c.qte),c.dateCom ,c.Totale  from commande c,user u where c.iduser=u.id  and c.idCom="+m+"  group by c.idCom");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
	 query = "select c.idCom,u.mail,c.etat,count(c.idP),sum(c.qte),c.dateCom ,c.Totale  from commande c,user u where c.iduser=u.id  and u.mail='"+m1+"'  group by c.idCom";
			System.out.println( "select c.idCom,u.mail,c.etat,count(c.idP),sum(c.qte),c.dateCom ,c.Totale  from commande c,user u where c.iduser=u.id  and   u.mail='"+m1+"' group by c.idCom");
			
		}
		
		
		try {
			st=con.createStatement();
			ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
			
			while(rs.next()) {
				commande p=new commande();
		  p.setId(rs.getInt(1));
		  p.setUsername(rs.getString(2));
		  p.setEtat(rs.getString(3));
		  p.setNombre(rs.getInt(4));
		  p.setPrixT(rs.getFloat(7));
		  p.setDate(rs.getDate(6));
		 p.setQte(rs.getInt(5));
		  list.add(p);

			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		return  list;	
	}
	public void updateCommane(commande u)
	{
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			
			st.executeUpdate("UPDATE commande set etat='"+u.getEtat()+"'  where idCom="+u.getId()+"");
	      System.out.println("UPDATE commande set etat='"+u.getEtat()+"'  where idCom="+u.getId()+"");
			//System.out.println("UPDATE produit set url='"+p.getUrl()+"',nom='"+p.getNom()+"',price="+p.getPrice()+"idc="+p.getIdc()+"qte="+p.getQte()+"where id="+p.getId()+"");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void ajouterCommande(commande d) {
		Connection con=connection.getConnection();
		java.sql.Statement st;
	System.out.println("INSERT INTO `commande` (`idCom`, `iduser`, `idP`, `dateCom`, `etat`, `qte`, `Totale`) Values("+d.getId()+","+d.getIduser()+","+d.getIdC()+",'"+d.getTodaysDate()+"','"+d.getEtat()+"',"+d.getQte()+","+d.getPrixT()+")");
		
		
		try {
			st=con.createStatement();
			
			st.executeUpdate("INSERT INTO `commande` (`idCom`, `iduser`, `idP`, `dateCom`, `etat`, `qte`, `Totale`) Values("+d.getId()+","+d.getIduser()+","+d.getIdC()+",'"+d.getTodaysDate()+"','"+d.getEtat()+"',"+d.getQte()+","+d.getPrixT()+")");
			
			//INSERT INTO `commande` (`idCom`, `iduser`, `idP`, `dateCom`, `etat`, `qte`, `Totale`) VALUES ('1', '8', '8', '2022-12-14', 'termine', '12', '12345');
			
			//System.out.println("insert into commande INSERT INTO `commande` (`idCom`, `iduser`, `idP`, `dateCom`, `etat`, `qte`, `Totale`) Values("+d.getId()+","+d.getIduser()+","+d.getIdC()+",'"+d.getTodaysDate()+"','"+d.getEtat()+"',"+d.getPrixT()+")");
			//INSERT INTO `
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

}
