<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@ page import="modele.user" %> 
    <%@ page import="modele.*" %>
    <%@ page import="Datalayer.*" %>
     <%@ page import="modele.produit" %>
      <%@ page import="modele.categorie" %>
        <%@ page import="Datalayer.gestionUser" %>
       <%@ page import="Datalayer.gestionProduit" %>
       <%@ page import="Datalayer.gestionCategories" %>
       <%@ page import="controlleur.inscription" %>
         <%@ page import="controlleur.Panier" %>
         
    <%@ page import="java.util.*" %>
    
   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complete Responsive Grocery Website Design Tutorial</title>

    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">
<style>
:root{
    --orange:#ff7800;}
    
#products{
margin-left:30px;
margin-right:50px}
  
.wish-icon{
color:red;
font-size:25px}
#ad{
margin-top:-10px;
margin-bottom:-30px;}
#me1{
font-size:12px;
}
a{
text-decoration:none;
}
#mee{
    
    margin-right:30px;
    padding-right:60px;
     border-radius: .5rem;
    background: #eee;
 
    }

#customers td {
  background-color:white ;
}

#ana{
font-size:20px;
 cursor: pointer;
background: none;
 color: var(--orange);}
 #ver{
 color:red;
 font-size:18px;
 display:none}
#ico{
margin-right:80px;} 
.fas{
backgroud-color:white}


ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 25%;
  background-color: white;
  
  height: 100%;
  overflow: auto;
}

li a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
}

li a.active {
  background-color: #ff7800;
  color: white;
}

li a:hover:not(.active) {
  background-color: #ff7800;
  color: white;
}#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 74%;
  
  
  
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}
table.mytable-marg{
	border-collapse: collapse;
}
table.mytable-marg td, table.mytable-marg th{
  border: 1px solid #ccc;
}
.mytable-marg{
	margin:0 auto;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #ff7800;
  color: white;
}

</style>
</head>

    
<!-- header section starts  -->

<header class="header">

    <a href="#" class="logo"> Material.Net </a>
    <br><br><br><br>

    <nav class="navbar" id="ad">
        <a href="home.jsp">Home</a>
     
        <a href="Voittout.jsp">Produits</a>
           <a href="#">  </a>
              <a href="#">  </a>
        <a href="categorie.jsp">Categories</a>
        <a href="#">A propos</a>
        <a href="#">Contacter</a>
    </nav>

    <div class="icons" id="ico">
        <div class="fas fa-bars" id="menu-btn"></div>
        <div class="fas fa-search" id="search-btn"></div>
        <div class="fas fa-shopping-cart" id="cart-btn"></div>
                <% 
            user user=inscription.user;
          gestionUser m=new gestionUser();
               
             
                	if(user!=null && user.getMail()!=null && user.getPass()!=null && m.ConxUser(user)!=null){
                		 user ut=m.ConxUser(user);
                    String nom="";
                	  for (int i=0; i<=user.getMail().length()-1; i++) {
                		  if(user.getMail().charAt(i)=='@')
                			  break;
                		  nom+=user.getMail().charAt(i);
                			  
                	  }
                	
                	  System.out.println(nom+"c'est le nom");
    	 
   
   
    	  out.println("<div class='fas ' id='login-btn' style='  height: 4.5rem;width: 16.5rem;'><p  >"+nom+" </p></div>");
      	
                	}
      
      else{
     
 %> 

        <div class="fas fa-user" id="login-btn"></div><%} %>
    </div>

    <form action="categories" method="post" class="search-form">
        <input type="search" name="chercher" id="search-box" placeholder="search here...">
        <label for="search-box" class="fas fa-search"></label>
    </form>

   <div class="shopping-cart">
   <% List<produit> l=new ArrayList<produit>();
        		l=Panier.list;
        		float s=0;
        		if(l==null ||(l!=null && l.size()==0))
        		{
            		
        		
        		%>
        		<p>Votre panier est vide</p>
        		<p>Voullez vous ajouter des produits</p>
        		<%}else{
        			for(produit p:l){
        			s+=p.getPrice();
        			%>
        		
        <div class="box">
            
            <img src="<%=p.getUrl() %>" alt="">
            <div class="content">
                <h3><%=p.getNom() %></h3>
                <span class="price"><%=p.getPrice() %> DH</span>
                <span class="quantity">Quantite: 1</span>
            </div>
        </div>
       
        <%} %>
        
       
        <div class="total">Totale:<%=s %> DH</div>
        <a href="#" class="btn">checkout</a>
         <%} %>
    </div>

    <form action="inscription" method="post" class="login-form" name="form" onsubmit="return W3docs()">
      
       <%  	   
       if(user!=null && user.getMail()!=null && user.getPass()!=null && m.ConxUser(user)!=null){
  		 user ut=m.ConxUser(user);
           
        	   
           if(ut.getOption().equals("admin")){
           %>
             <a href="dashbordP.jsp" id="ana">Dashbord</a><br><br><%}else{ %>
           <a href="frontoffice.jsp" id="ana">Dashbord</a><br><br><%} %>
         <input type="submit" value="logout" name="dec" id="ana"><%}else{ %>
        	
 
    <div id="info">
        <h3>login now</h3>
        <input type="email"  id="username" name="username" placeholder="your email" class="box">
        <input type="password" id="pass" name="pass" placeholder="your password" class="box">
        <p>forget your password <a href="#">click here</a></p>
        <p>don't have an account <a href="Inscription.jsp">create now</a></p>
        <p id="ver"></p>
        <input type="submit" value="login now" class="btn">
       </div>
       <%} %>
    </form>

</header>
<%
  if(session.getAttribute("id")!=null)
  {
	int idUser= (int)session.getAttribute("id"); 
	gestionUser m1=new gestionUser();
	if(m1.getIDadmin(idUser)==0)
	{
	%>
<br><br><br><br><br><br><br>
<body>
<ul>
  <li><a  href="EspaceClient.jsp">Profil</a></li>
  <li><a class="active" href="mescommandes.jsp"> Mes Commandes</a> </li>
  <li><a href="information.jsp"> Informations Personnelles</a> </li>
  <li><a href="adresse.jsp">Adresses</a></li>
  <li><a href="favoris.jsp">Favoris</a></li>
   <li><a href="deconnexion.jsp">Déconnexion </a></li>
</ul><h1 style="text-align:center;"> Mes Commandes</h1>

<table class="mytable-marg" id="customers"><th>Id</th>
    <th>Date Commande</th>
    <th>Etat</th>
    <th>Total</th>
  <tr> <%int i=0;
    //  commande p=new commande();
   // int id1=user.getId();
    int id;
    id=m.getiduser(user);
		gestionCommande m21=new gestionCommande();
		ArrayList<commande> c=new ArrayList<commande>();
		c=(ArrayList<commande>) m21.getListcommandes(id);
		
    
     // ArrayList<commande> c=new ArrayList<commande>();
     // c=(ArrayList<commande>)request.getAttribute("commande"); 
		
		for(commande p:c)
		{
			i++;
			
			
		
%>
      
      
    
  </tr>
  <tr>
    <td><%out.print(p.getId()); %></td>
    <td><%out.print(p.getDate()); %></td>
    <td><%out.print(p.getEtat()); %></td>
    <td><%out.print(p.getPrixT()); %></td>
  </tr> <%} %>
  
</table>
<br><br><br><br><br><br>
</body><section class="footer">

    <div class="box-container">

        <div class="box">
            <h3>Matreial.Net </h3>
            <p>Site de vente de matriale d'informatique en ligne</p>
            <div class="share">
                <a href="#" class="fab fa-facebook-f"></a>
                <a href="#" class="fab fa-twitter"></a>
                <a href="#" class="fab fa-instagram"></a>
                <a href="#" class="fab fa-linkedin"></a>
            </div>
        </div>

        <div class="box">
            <h3>contact info</h3>
            <a href="#" class="links"> <i class="fas fa-phone"></i> +212 654378</a>
            <a href="#" class="links"> <i class="fas fa-phone"></i> +212 6789054 </a>
            <a href="#" class="links"> <i class="fas fa-envelope"></i> metrialnet@gamil.com </a>
      
        </div>

        <div class="box">
            <h3>quick links</h3>
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i>Home </a>
          
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i> products </a>
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i> categories </a>
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i> A propos </a>
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i> Contactez-nous </a>
        </div>

        <div class="box">
            <h3>Newsletter</h3>
            <p>subscribe for latest updates</p>
            <input type="email" placeholder="your email" class="email">
            <input type="submit" value="subscribe" class="btn">
            <img src="image/payment.png" class="payment-img" alt="">
        </div>

    </div>

    <div class="credit"> created by <span> </span>  </div>

</section>
<%}} %>
 </html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

<!-- custom js file link  -->
<script src="js/script.js"></script>
<script type="text/javascript">

