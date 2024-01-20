package Datalayer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import modele.user;

public class gestionUser implements clientInterface{
	public void adduser(user u)
	{
		Connection con=connection.getConnection();
		java.sql.Statement st;
		System.out.println("INSERT INTO `user` (`mail`, `pass`, `option`, `id`) VALUES ('"+u.getMail()+"','"+u.getPass()+"', '"+u.getOption()+"', NULL)");
		try {
			st=con.createStatement();
		
				st.executeUpdate("INSERT INTO `user` (`mail`, `pass`, `option`, `id`) VALUES ('"+u.getMail()+"','"+u.getPass()+"', '"+u.getOption()+"', NULL)");	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void addclient1(user u)
	{
		Connection con=connection.getConnection();
		java.sql.Statement st;
		System.out.println("UPDATE `user` SET `adresse` = 'fes1', `nom` = '"+u.getNom()+"', `prenom` = '"+u.getPrenom()+"' WHERE `user`.`id` = "+u.getId()+"");
		try {
			st=con.createStatement();
		
			st.executeUpdate("UPDATE `user` SET `adresse` = 'fes1', `nom` = '"+u.getNom()+"', `prenom` = '"+u.getPrenom()+"' WHERE `user`.`id` = "+u.getId()+"");

			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void suprimeruser(int id)
	{
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			
			st.executeUpdate("delete from user where id="+id);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	public void modifierUser(user u)
	{
		Connection con=connection.getConnection();
		java.sql.Statement st;
		System.out.println("UPDATE `user` SET `mail` = '"+u.getMail()+"', `pass` = '"+u.getPass()+"', `option` = 'User' WHERE `user`.`id`="+u.getId()+"");
		try {
			st=con.createStatement();
		
			st.executeUpdate("UPDATE `user` SET `mail` = '"+u.getMail()+"', `pass` = '"+u.getPass()+"', `option` = '"+u.getOption()+"' WHERE `user`.`id`="+u.getId()+"");

			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public user getuser(int id)
	{
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			String query = "select * from user where user.id="+id;
			System.out.println("select * from user where user.id="+id);
		ResultSet rs = ((java.sql.Statement) st).executeQuery(query);

		while(rs.next()) {
			user p=new user();
		p.setMail(rs.getString(1));
		p.setPass(rs.getString(2));
		p.setId(rs.getInt(3));
		p.setOption(rs.getString(4));
	return p;
		}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}public int getiduser(user u)
	{int id1=0;
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			String query = "select id from user  where mail='"+u.getMail()+"' and pass='"+u.getPass()+"'";
			System.out.println("select id from user where user.pass="+u.getPass());
		ResultSet rs = ((java.sql.Statement) st).executeQuery(query);

		while(rs.next()) {
		
		id1=rs.getInt(1);
		System.out.println("ID EST"+id1);
		break;
	
		}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id1;
		
	}

	public List<user> getListuser() throws SQLException{
		List<user> list=new ArrayList<user>();
	Connection con=connection.getConnection();
	java.sql.Statement st;
	st=con.createStatement();
	String query = "select * from user";
	ResultSet rs = ((java.sql.Statement) st).executeQuery(query);

	while(rs.next()) {
		user p=new user();
	p.setMail(rs.getString(1));
	p.setPass(rs.getString(2));

	p.setOption(rs.getString(4));
	p.setId(rs.getInt(3));


	list.add(p);

	} 
	return list;
	}

	public List<user> chercheruser(String Mc)
	{
		List<user> list=new ArrayList<user>();
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			String query = "select * from user  where mail like '%"+Mc+"%' ";
			ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
			
			while(rs.next()) {
				user p=new user();
		  p.setMail(rs.getString(1));
		  p.setPass(rs.getString(2));
		  p.setId(rs.getInt(3));
		 	 
		  list.add(p);

			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;

	}
	public user ConxUser(user u)
	{
		
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			String query = "select * from user  where mail='"+u.getMail()+"' and pass='"+u.getPass()+"'";
			System.out.println("select * from user  where mail='"+u.getMail()+"' and pass='"+u.getPass()+"'");
			ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
			
			while(rs.next()) {
				user u1=new user();
				u1.setMail(rs.getString(1));
				u1.setPass(rs.getString(2));
				u1.setId(rs.getInt(3));
				u1.setOption(rs.getString(4));
				
			  return u1;
			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;

		
	}
	
	public int idUser(user u)
	{
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			String query = "select * from user  where user.mail="+u.getMail()+",user.pass="+u.getPass();
			
			ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
			
			while(rs.next()) {
				user p=new user();

		  p.setId(rs.getInt(3));

			  return p.getId();
		 	 


			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;

	}
	public int verfication(String mail)
	{
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			String query = "select * from user  where user.mail='"+mail+"'";
			System.out.println(query);
			ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
			
			while(rs.next()) {
		
			  return rs.getInt(3);
		 	 


			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;	
	}
	public void card(List<String> u)
	{
		
		Connection con=connection.getConnection();
		java.sql.Statement st;
		//System.out.println("INSERT INTO `card` (`nom`, `number`, `expiration`, `cvv`,`iduser`) VALUES ('"+u.getMail()+"','"+u.getPass()+"', '"+u.getOption()+"', NULL)");
		try {
			st=con.createStatement();
		
				//System.out.println("INSERT INTO `card` (`nom`, `number`, `expriation`, `ccv`, `iduser`) VALUES ('"+u.get(0)+"','+u.get(1)+', '"+u.get(2)+"', '+u.get(3)+',+u.get(4)+)");	
			System.out.println("INSERT INTO `card` (`nom`, `number`, `expriation`, `ccv`, `iduser`) VALUES ('"+u.get(0)+"',"+u.get(1)+", '"+u.get(2)+"', "+u.get(3)+","+u.get(4)+")");
			st.executeUpdate("INSERT INTO `card` (`nom`, `number`, `expriation`, `ccv`, `iduser`) VALUES ('"+u.get(0)+"',"+u.get(1)+", '"+u.get(2)+"', "+u.get(3)+","+u.get(4)+")");	
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public int getIDadmin(int id)
	{
		Connection con=connection.getConnection();
		java.sql.Statement st;
		try {
			st=con.createStatement();
			String query = "select id from user  where   user.option='admin' and user.id="+id;
			ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
			
			while(rs.next()) {
		
			  return 1;
		 	 


			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;	
	}

	@Override
	public void addclient(user u) {
		// TODO Auto-generated method stub
		
	}

}
