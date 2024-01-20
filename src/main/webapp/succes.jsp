<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="modele.user" %>
     <%@ page import="modele.produit" %>
      <%@ page import="modele.categorie" %>
        <%@ page import="Datalayer.gestionUser" %>
       <%@ page import="Datalayer.gestionProduit" %>
       <%@ page import="Datalayer.gestionCategories" %>
       <%@ page import="controlleur.inscription" %>
         <%@ page import="controlleur.Panier" %>
        
                   <%@ page import="java.sql.SQLException" %>

    <%@ page import="java.util.*" %>
    
   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notre Projet</title>

    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />

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
#test{
margin-top:225px;
margin-bottom:0px;}
#mee{
    
    margin-right:30px;
    padding-right:60px;
     border-radius: .5rem;
    background: #eee;
 
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

.bloc {
	box-shadow: 0px 22px 40px -8px #d6d6d6;
	border-radius: 8px;
	max-width: 750px;
	margin: 100px auto 0 auto;
	padding: 20px;
	box-sizing: border-box;

}

.bloc .success-logo {
	text-align: center;
}

.bloc .success-logo img {
	max-width: 50px;
}

.bloc h1 {
	text-align: center;
	margin-top: 10px;
	margin-bottom: 20px;
	color: rgb(47, 47, 47);
}

.bloc p {
	color: rgb(87, 87, 87);
	text-align: justify;
	text-align:center;
	font-size:18px;
}

.bloc .center {
	display: flex;
	justify-content: center;
	align-items: center;
}

.bloc .return {
	text-align: center;
	background: #0070ba;
	text-transform: uppercase;
	color: white;
	padding: 10px 20px;
	border-radius: 5px;
	font-weight: 600;
	display: inline-block;
	margin-top: 30px;
}


#cm{
background-color:white}

</style>
</head>
<body>
    
<!-- header section starts  -->

<header class="header">

    <a href="#" class="logo"> Material.Net </a>
    <br><br><br><br>

    <nav class="navbar" id="ad">
        <a href="Home.jsp">Home</a>
     
        <a href="Store.jsp">Produits</a>
           <a href="#">  </a>
              <a href="#">  </a>
       
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

    <form action="Panier" method="post" class="search-form">
        <input type="search" name="chercher" id="search-box" placeholder="search here...">
        <label for="search-box" class="fas fa-search"></label>
    </form>

   <div class="shopping-cart">
   <% 
   List<produit> l=new ArrayList<produit>();
        		 System.out.println("panier home:");
	 Cookie[] cookies = request.getCookies();
   
      for(int i=0;i<cookies.length;i++) {
      if(cookies[i].getName().equals("panier")) {
      	String[] listp=cookies[i].getValue().split("_");
      	 System.out.println("\ncontenu list panier:"+cookies[i].getValue());
      	 if(!cookies[i].getValue().equals("")){
      		 
      	 if(Panier.list!=null)
      		Panier.list.clear();
      	for(String idp:listp)
      	{
      		String[] pr=idp.split(":");
				String idpr = pr[0];
				String qtpr = pr[1];
				int i1=	Integer.parseInt(idpr);
				gestionProduit p=new gestionProduit();
				
					produit prod;
					try {
						prod = p.getproduit(i1);
						int q=Integer.parseInt(qtpr);
						prod.setQte(q);
						l.add(prod);
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				
      	}
      	 }
  
     break;
      }
      }
      System.out.println("\from panier h size"+l.size());
  
        		float s=0;
        		if(l==null ||(l!=null && l.size()==0))
        		{
            		
        		
        		%>
        		<p>Votre panier est vide</p>
        		<p>Voullez vous ajouter des produits</p>
        		<%}else{
        			int i=0;
        			for(produit p:l){
        				i++;
        				if(i==3)
        					break;
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
        <a href="panier.jsp" class="btn">checkout</a>
         <%} %>
    </div>

    <form action="inscription" method="post" class="login-form" name="form" onsubmit="return W3docs()">
      
       <%  	   
       if(user!=null && user.getMail()!=null && user.getPass()!=null && m.ConxUser(user)!=null){
  		 user ut=m.ConxUser(user);
           
        	   
           if(ut.getOption().equals("admin")){
           %>
             <a href="dashbordP.jsp" id="ana">Dashbord</a><br><br><%}else{ %>
           <a href="EspaceClient.jsp" id="ana">Dashbord</a><br><br><%} %>
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
<br><br><br><br><br><br><br><br><br>
<div class="bloc" id="cm">
    <div class="success-logo">
        <img src="checked.png">
    </div>
    <h1 class="font-title">Merci pour votre achat !</h1>
    <p >Nous vous avertirons lorsque votre commande sera envoyée. <div class="center">
        <a class="btn" href="Store.jsp">Retour à la boutique</a>
    </div>
</div>
<br><br>
<section class="footer" id="test">

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
            <a href="Home.jsp" class="links"> <i class="fas fa-arrow-right"></i>Home </a>
          
            <a href="Store.jsp" class="links"> <i class="fas fa-arrow-right"></i> Produits </a>
          
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i> A propos </a>
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i> Contactez-nous </a>
        </div>

        <div class="box">
            <h3>Newsletter</h3>
            <p>Abonnez-vous pour recevoir les dernières mises à jour</p>
            <input type="email" placeholder="your email" class="email">
            <input type="submit" value="subscribe" class="btn">
            
        </div>

    </div>

    <div class="credit"> created by <span> </span>  </div>

</section>

 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

<!-- custom js file link  -->
<script src="js/script.js"></script>
<script type="text/javascript">

function W3docs()                                    
{ 
    var email= document.forms["form"]["username"];               
    var password = document.forms["form"]["pass"];    
    
    if (email.value == "" && password.value == "")                                   
    { 
      
        email.focus();
        password.focus(); 
        document.getElementById ("ver").innerHTML="Remplire tous les champs!!";
        document.getElementById ("ver").style.display = 'block';
        return false; 
    } 
    else{
    	 if (email.value == "")                                   
    	    { 
    		    document.getElementById ("ver").innerHTML="Mettez une adresse email valide."; 
    	        email.focus(); 
    	        document.getElementById ("ver").style.display = 'block';
    	        return false; 
    	    }    
    	    else
    	    if (email.value.indexOf("@", 0) < 0)                 
    	    { 
    	    	  document.getElementById ("ver").innerHTML="Mettez une adresse email valide."; 
    	        document.getElementById ("ver").style.display = 'block';
    	        email.focus(); 
    	        return false; 
    	    }    
    	    else
    	    	if (email.value.indexOf(".", 0) < 0)                 
    	    { 
    	    		  document.getElementById ("ver").innerHTML="Mettez une adresse email valide."; 
    	    	        document.getElementById ("ver").style.display = 'block';
    	    		
    	        email.focus(); 
    	        return false; 
    	    }    
    	    	
    	    if (password.value == "")                        
    	    { 
    	       
    	        document.getElementById ("ver").innerHTML="Saisissez votre mot de passe."; 
    	        document.getElementById ("ver").style.display = 'block';
    	        password.focus(); 
    	        return false; 
    	    }
    	    if (email.value != "" && password.value != "")                                   
    	    { 
    	    	<%
    	    	user u=new user();
    	    	u.setMail(request.getParameter("username"));
    	    	u.setPass(request.getParameter("pass"));
    	    if(m.ConxUser(u)==null);
    	    {
    	    	
    	    	%>
    	    	 document.getElementById ("ver").innerHTML="information erronne!!"; 
     	        document.getElementById ("ver").style.display = 'block';
     	        <%}
     	      
     	        %>
    	    }
    	    
    }
   
    }</script>



