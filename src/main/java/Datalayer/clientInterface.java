package Datalayer;

import java.sql.SQLException;
import java.util.List;

import modele.user;

public interface clientInterface {
public void addclient(user u);
public user getuser(int i);
public List<user> getListuser() throws SQLException;
public void suprimeruser(int i);

}
