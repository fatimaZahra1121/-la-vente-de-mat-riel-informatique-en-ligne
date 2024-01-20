<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="modele.produit" %>
       <%@ page import="modele.user" %>
     <%@ page import="modele.produit" %>
      <%@ page import="modele.categorie" %>
 <%@ page import="Datalayer.gestionUser" %>
       <%@ page import="Datalayer.gestionProduit" %>
       <%@ page import="Datalayer.gestionCategories" %>
       <%@ page import="controlleur.inscription" %>
         <%@ page import="controlleur.Panier" %>
      <%@ page import="modele.categorie" %>
        <%@ page import="Datalayer.gestionUser" %>
       <%@ page import="Datalayer.gestionProduit" %>
       <%@ page import="Datalayer.gestionCategories" %>
    <%@ page import="java.util.*" %>
    
                   <%@ page import="java.sql.SQLException" %>
   
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

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">
        
    <script src="https://kit.fontawesome.com/8511bf9f19.js" crossorigin="anonymous"></script>
  
    <style>

@import url(https://fonts.googleapis.com/css?family=Raleway:400,300,500,700);
* {
  box-sizing: border-box;
}


body .card {
  width: 650px;
  position: absolute;
  background: white;
  margin: 0 auto;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
  transition: all 0.3s;

  padding-right:50px;
  margin-top:100px;
  margin-bottum:30px;
}
body .card:hover {
  box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
body .card nav {
  width: 100%;
  color: #727272;
  text-transform: uppercase;
  padding: 20px;
  border-bottom: 2px solid #efefef;
  font-size: 12px;
}
body .card nav svg.heart {
  height: 24px;
  width: 24px;
  float: right;
  margin-top: -3px;
  transition: all 0.3s ease;
  cursor: pointer;
}
body .card nav svg.heart:hover {
  fill: red;
}
body .card nav svg.arrow {
  float: left;
  height: 15px;
  width: 15px;
  margin-right: 10px;
}

body .card .photo {
  padding: 30px;
  width: 45%;
  text-align: center;
  float: left;
}
body .card .photo img {
  max-height: 240px;
}
body .card .description {
  padding: 30px;
  float: left;
  width: 55%;
  border-left: 2px solid #efefef;
}
body .card .description .p {
  color: #515151;
  font-weight: 300;
  padding-top: 15px;
  margin: 0;
  font-size: 30px;
  font-weight: 300;
}
body .card .description .a {
  
color:var(--orange);
  margin: 0;
  text-transform: uppercase;
  font-weight: 500;
}
body .card .description .b {
  margin: 0;
  color: #727272;
  text-transform: uppercase;
  font-weight: 500;
  font-size: 12px;
}
body .card .description p {
  font-size: 20px;
  line-height: 20px;
  color: #727272;
  padding: 20px 0;
  margin: 0;
}
body .card .description .btn {
  outline: 0;
  border: 0;
  

  margin-bottom: 30px;

  text-transform: uppercase;
  width: 125px;
  font-family: inherit;
  margin-right: 5px;

  padding:.8rem 3rem;
    font-size: 1.7rem;
    border-radius: .5rem;
    border:.2rem solid var(--black);
    color:var(--black);
    cursor: pointer;
    background: none;
  
}

body .card .description .btn:hover {

  cursor: pointer;
    background: var(--orange);
    color:#fff;
}   .text_specification {
  padding: 0;

color:var(--orange);
  font-size: 20px;
}

.block_quantity {
  position: relative;
  height: 46px;
  margin-top: 45px;
}
.block_quantity span {
  display: inline-block;
  float: left;
  margin-top: 15px;
  margin-right: 10px;
}
.block_quantity__chooseBlock {
  vertical-align: top;
  height: 100%;
  margin: 0;
  padding: 0;
}
.block_quantity__number {
  display: inline-block;
  float: left;
  width: 52px;
  height: 46px;
  border: 1px solid #ddd;
  font-size: 18px;
  padding-left:2px;
}
.block_quantity__number::-moz-placeholder {
  color: #403f40;
  font-size: 18px;
  line-height: 35px;
}
.block_quantity__number:-ms-input-placeholder {
  color: #403f40;
  font-size: 18px;
  line-height: 35px;
  
}
.block_quantity__number::placeholder {
  color: #403f40;
  font-size: 18px;
  line-height: 35px;
  padding-left:2px;
}
.block_quantity__button {
  display: inline-block;
  position: relative;
  float: left;
  width: 20px;
  height: 50%;
  margin: 0;
  padding: 0;
  margin-left: 11px;
  font-size: 0;
  cursor: pointer;
}

#section{
margin-top:80px;}

.a{
font-size:55px;
text-align:center}

#qt{
  margin-top:-80px;
  margin-left:-5px;
}
#ct{
width:220px;
 margin-right:-20px;
}
#sm{
margin-top:560px;}


#ad{
margin-top:-10px;
margin-bottom:-30px;}

</style>

</script>

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






<br><br><br><br>
<section id="section">
 <div class="card">
      
      <div class="photo">
       <% 
       gestionProduit pro=new gestionProduit();
      produit p=new produit();
      p=(produit)request.getAttribute("produit"); 
      
    
      out.print(" <img src='"+p.getUrl()+"'>");
      %>
      </div>
      <div class="description">
        <span class="a"><%out.print(p.getNom()); %></span>
<br><br>
        <span class="p"><%out.print(p.getPrice()); %>DH</span>
        <br>
        <p><%out.print(p.getDescription()); %></p>
        <br> <br> 
        <a href="Panier?prod=<%=p.getId() %>" class="btn" id="ct" >Ajouter aux Panier</a>
    
      </div>
      </div>
    </div>
   
    <div id="sm">
    <br> <br> <br> <br> <br> <br>
     <% gestionProduit produit=new gestionProduit();
int k=0; 
System.out.println("size est:"+produit.simalire(p.getId()).size());
if(produit.simalire(p.getId()).size()>0){%>
 <h1 class="heading" > Produit <span>Smilaire</span> </h1>
 
<section class="products" id="products">
<br>
	<div class="row">
		<div class="col-md-12">
			
			<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="0">
			<!-- Carousel indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>   
			<!-- Wrapper for carousel items -->
			<div class="carousel-inner">
			<div class="item active">
					<div class="row">
<%

        	
        		System.out.println("size de pr:"+produit.simalire(p.getId()).size());
        		for(produit p1:produit.simalire(p.getId()))
        		{
        			
        			k++;
        			if(k==9)
        				break;
        		
        			
        		
        		if(k==5)
        		{
        			
        		
    %>
    	</div>
				</div>
				<div class="item">
					<div class="row"><%} %>
    
    
    
                           <div class="col-sm-3">
							<div class="thumb-wrapper">
								<span class="wish-icon"><i class="fa fa-heart-o"></i></span>
								<div class="img-box">
								  <%out.println("<a href='Panier?idp="+p1.getId()+"'><img src='"+p1.getUrl()+"' alt=''></a>"); %>
																		
								</div>
								<div class="thumb-content">
							
									<h4><%out.println("<a href='Panier?idp="+p1.getId()+"'>"+p1.getNom()+"</a>"); %>								
									</h4> 
									<%
									int g=0;
									for(produit pr:l)
										{
										if(pr.getId()==p1.getId())
										{
											g=1;
											break;
										}
										}
									if(g==0)
									{
										%>
										
									 <a href="Panier?prod=<%=p1.getId() %>" class="btn">Ajouter aux Panier</a>
									<%}else{ %>
									 <a href="panier.jsp %>" class="btn">Voir Le Panier</a><%} %>
								</div>						
							</div>
						</div>
						<%} %>

               


</div>
				</div>
			</div>
			<!-- Carousel controls -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">
				<i class="fa fa-angle-left"></i>
			</a>
			<a class="carousel-control right" href="#myCarousel" data-slide="next">
				<i class="fa fa-angle-right"></i>
				<%} %>
			</a>
		</div>
		</div>
	</div>
 
 </div>
</section>



<br><br><br><br>

<section class="footer">

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