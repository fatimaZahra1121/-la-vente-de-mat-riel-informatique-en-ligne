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
    <meta charset="utf-8">
    <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
    <!--  All snippets are MIT license http://bootdey.com/license -->

    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	<style>
	#v{
	margin-left:-10px;
	margin-top:10px;
	}
	#N{
		margin-top:150px;
	}
	#N1{
			margin-top:150px;
			position:absolute;
			top:100px;
			left:700px;
		color:red;
		
	}
	


        @import url("https://fonts.googleapis.com/css?family=Poppins");
* {
  margin: 0;
  padding: 0;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {

  font-family: "Poppins", sans-serif;
}

.big-heading {
  color: #fff;
  text-align: center;
  font-size: 26pt;
  padding: 20px;
  text-transform: capitalize;
}

.table {
  background: #fff;
  width: 27%;
  height: auto;
  display: block;
  float: left;
  position: relative;
  left: 6%;
  margin: 20px;
  border-radius: 8px;
  overflow: hidden;
  -moz-box-shadow: 0px 0px 0px rgba(0, 0, 0, 0);
  -webkit-box-shadow: 0px 0px 0px rgba(0, 0, 0, 0);
  box-shadow: 0px 0px 0px rgba(0, 0, 0, 0);
  -webkit-transform: translateY(0%);
  transform: translateY(0%);
  -webkit-transition: 0.3s;
  transition: 0.3s;
}
.table:hover {
  -webkit-transform: translateY(-2%);
  transform: translateY(-2%);
  -moz-box-shadow: 1px 8px 5px rgba(0, 0, 0, 0.2);
  -webkit-box-shadow: 1px 8px 5px rgba(0, 0, 0, 0.2);
  box-shadow: 1px 8px 5px rgba(0, 0, 0, 0.2);
}
.table .heading {
  background: #f0f4f2;
  width: 100%;
  padding: 20px;
  text-align: left;
  font-size: 15pt;
  color: #272625;
  margin-bottom: 40px;
  text-transform: capitalize;
}
.table .block {
  display: block;
  width: 78%;
  margin: 40px 50%;
 
  transform: translate(-50%);
  border-bottom: 1px dashed rgba(0, 0, 0, 0.2);
}
.table .block .price {
  float: right;
  position: relative;
  right: 30px;
}
.table .block .price sub {
  position: absolute;
  right: -30px;
  top: 5px;
  font-weight: lighter;
  font-size: 9pt;
}
.table .block .options {
  display: block;
  list-style: none;
  margin: 10px auto;
}
.table .block .options li {
  font-size: 13px;
  color: #676462;
  text-transform: capitalize;
}
.table .btn {
  display: block;
  margin: 20px auto 30px;
  width: 60%;
  height: 50px;
  background: #fb6a30;
  border: none;
  -webkit-border-radius: 50px;
  border-radius: 50px;
  -webkit-transition: 0.3s;
  transition: 0.3s;
  overflow: hidden;
}
.table .btn p {
  font-weight: bolder;
  color: #fff;
  font-size: 10pt;
  text-align: center;
  line-height: 50px;
  font-family: "Poppins", sans-serif;
  text-transform: uppercase;
  -webkit-transform: translateX(0);
  transform: translateX(0);
  -webkit-transition: all 600ms cubic-bezier(1, 0, 0, 1);
  transition: all 600ms cubic-bezier(1, 0, 0, 1);
}
.table .btn span {
  font-size: 20px;
  -webkit-transform: translate(-50%);
  transform: translate(-50%);
  position: relative;
  top: -35px;
  left: -100%;
  color: #fff;
  -webkit-transform: scale(1);
  transform: scale(1);
  -webkit-transition: all 600ms cubic-bezier(0.68, -0.55, 0.265, 1.55);
  transition: all 600ms cubic-bezier(0.68, -0.55, 0.265, 1.55);
}
.table .btn:hover {
  cursor: pointer;
}
.table .btn:hover span {
  left: 0%;
  -webkit-transform: scale(1.5);
  transform: scale(1.5);
}
.table .btn:hover p {
  -webkit-transform: translateX(100%);
  transform: translateX(100%);
}

p {
  text-align: left;
  color: #272625;
  font-weight: 600;
  font-size: 15px;
  text-transform: capitalize;
}

h4 {
  position: absolute;
  top: 0;
  left: 20px;
  color: #fff;
  font-size: 1.6em;
}
h4 a {
  text-decoration: none;
  color: #fff;
  -webkit-transition: 0.5s;
  transition: 0.5s;
}
h4 a:hover {
  font-size: 1.8em;
  text-decoration: underline;
}
.table{
margin-bottom:20px;
}

.tab{
margin-top:-980px;
margin-left:280px;
 margin-bottom: 800px;
}
.footer{
margin-top:900px;}
.wish-icon{
color:red;
font-size:20px;

}#pd {
  position: absolute;

margin-top:8px}
#rangeValue {
  position: relative;
  display: block;
  text-align: center;
  font-size: 20px;
   color: #999;
  font-weight: 400;
}
.range {
  width: 400px;
  height: 15px;
  -webkit-appearance: none;
  background: #111;
  outline: none;
  border-radius: 15px;
  overflow: hidden;
  box-shadow: inset 0 0 5px var(--orange);
}
.range::-webkit-slider-thumb {
  -webkit-appearance: none;
  width: 15px;
  height: 15px;
  border-radius: 50%;
  background: var(--orange);
  cursor: pointer;
  border: 4px solid #333;
  box-shadow: -407px 0 0 400px var(--orange);
}
#p{
margin-left:12px}
#ad{
margin-top:-10px;
margin-bottom:-30px;}
#test{
margin-top:525px;
margin-bottom:0px;}
</style>

</head>
<body>

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


<%
String cher=request.getParameter("chercher");
gestionProduit pg=new gestionProduit();
if(cher!=null && pg.chercher(cher).size()==0)
{

	
 %>
 <h1 class="heading" id="N1" > Aucun Resultat trouve !!</h1>
 <section id="test" class="footer">

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
 
 <%}else{ %>
 <h1 class="heading" id="N"> Notre <span>Produits</span> </h1>

       
    

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
<div class="container bootdey" id="v">
    <div class="col-md-3">
        <section class="panel">
            <div class="panel-body">
           <form action="Panier" method="post">
                <input type="text" name="chercher" placeholder="Search here ..." class="form-control" /></form>
            </div>
        </section>
        <section class="panel">
            <header class="panel-heading">
                Category
            </header>
            <div class="panel-body">
                <ul class="nav prod-cat">
                    
                  <%int k=0; 
                  gestionCategories Cat=new gestionCategories();
                   List<categorie> list1=new ArrayList<categorie>();
            		list1=Cat.getListcategorie();
            		
            		for(categorie p1:list1)
            		{ 
            			k++;
            		if(k==8)
            		break;
            		%>
                    
                    <li>  
                       <a href="Panier?idcat=<%=p1.getId()%>"><i class="fa fa-angle-right"></i><%=p1.getNom() %></a>
                    </li>
                   <%} %>
                   
                </ul>
            </div>
        </section>
                <section class="panel">
            <header class="panel-heading">
                Price
                <hr>
                <div id="pd">

       
  <form action="Panier" method="post">
        
   <%List<Double> list=new ArrayList<Double>();
   gestionProduit p=new gestionProduit();
   list=p.getprice();
   out.println("<span id='rangeValue'>"+list.get(1)+"</span>");
   out.println("<Input class='range' type='range' name='range' value='"+list.get(1)+"' min='"+list.get(1)+"' max='"+list.get(0)+"' onChange='rangeSlide(this.value)' onmousemove='rangeSlide(this.value)''></Input>"); 
  
   %>

    </div>
  <br><br><br>
 
            </header>
                <button class="btn btn-primary" type="submit" id="p">Filter</button>
                   </form>
            <div class="panel-body sliders">
                <div id="slider-range" class="slider"></div>
                <div class="slider-info">
                    <span id="slider-range-amount"></span>
                </div>
            </div>
        </section>
       
       
    </div>
    
        </section>

       
            </div>
        </div>
    </div>
</div>
<div class="tab">
<% int i=0; %>

<%
int kp=0;


                 String val=request.getParameter("range");
                 String idcat=request.getParameter("idcat");
        		List<produit> listp=new ArrayList<produit>();
        		if(val!=null)
        		{
        		float v=Float.parseFloat(val);
        	  listp=p.getListproduitPrice(v);	
        	  kp=1;
        	  System.out.println("price range:"+listp.size());
        		}

        	  if(cher!=null)
        	   {
        		listp=p.chercher(cher);
        		System.out.println("size cher:"+listp.size());
        		kp=1;
        	   }
        	  if(idcat!=null)
       	   {
        		  int v=Integer.parseInt(idcat);
       		listp=p.getListproduitCat(v);
       		
       		kp=1;
       	   }
        	if(kp==0)
        		listp=p.getListproduit();
        		for(produit p1:listp)
        		{
        			i++;
        			if(i==10)
        			break;
        			
        	
%>
 <div class="table">
        <div class="block">
        	<span class="wish-icon"><i class="fa fa-heart-o"></i></span>
      <%out.println("<a href='Panier?idp="+p1.getId()+"'><img src='"+p1.getUrl()+"' alt='' width=260px height=280px></a>"); %>
           
            <br>  <br> 
            <p> <%=p1.getNom() %></p>
            <span class="price"><%=p1.getPrice() %> DH
            
            </span> 
            
         </p>
        </div>
         <% int flags=0;
                for(produit pr:l){
                	if(pr.getId()==p1.getId())
                	{
                		flags=1;
                		break;
                	}
                		
                }
                if(flags==0){
                	%>
   <a href='Panier?store=<%=p1.getId() %>'>     <button class="btn">
          <p>Acheter</p>
          <span class="fa fa-cart-plus" aria-hidden="true"></span>
        </button></a> 
        
        <%}else{ %>
        <a href='panier.jsp'>     <button class="btn">
          <p>Voir le Panier</p>
          <span class="fa fa-cart-plus" aria-hidden="true"></span>
        </button></a><%} %>
        </div>
    <%} %>
        



 

                
                </div>

</div>

   <br>  
  <br>  <br>  
  <br>      
  <br>  
  <br>      <br>  
  <br>  <br>  
  <br>      
  <br>  <br>  <br>  
  <br>      
  <br> <br>  <br>  <br>  
  <br>      
  <br> 
  <br> <br>  <br>  <br>  
  <br>      
  <br> 
  <br> 
  <br>         

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

<%} %>
<style type="text/css">
body{margin-top:20px;
background:#f1f2f7;
}
#test1{
margin-top:390px;}
/*panel*/
.panel {
    border: none;
    box-shadow: none;
}

.panel-heading {
    border-color:#eff2f7 ;
    font-size: 16px;
    font-weight: 300;
}

.panel-title {
    color: #2A3542;
    font-size: 14px;
    font-weight: 400;
    margin-bottom: 0;
    margin-top: 0;
    font-family: 'Open Sans', sans-serif;
}


/*product list*/

.prod-cat li a{
    border-bottom: 1px dashed #d9d9d9;
}

.prod-cat li a {
    color: #3b3b3b;
}

.prod-cat li ul {
    margin-left: 30px;
}

.prod-cat li ul li a{
    border-bottom:none;
}
.prod-cat li ul li a:hover,.prod-cat li ul li a:focus, .prod-cat li ul li.active a , .prod-cat li a:hover,.prod-cat li a:focus, .prod-cat li a.active{
    background: none;
    color: #ff7261;
}

.pro-lab{
    margin-right: 20px;
    font-weight: normal;
}

.pro-sort {
    padding-right: 20px;
    float: left;
}

.pro-page-list {
    margin: 5px 0 0 0;
}

.product-list img{
    width: 100%;
    border-radius: 4px 4px 0 0;
    -webkit-border-radius: 4px 4px 0 0;
}

.product-list .pro-img-box {
    position: relative;
}
.adtocart {
    background: #fc5959;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    -webkit-border-radius: 50%;
    color: #fff;
    display: inline-block;
    text-align: center;
    border: 3px solid #fff;
    left: 45%;
    bottom: -25px;
    position: absolute;
}
#ad{
margin-top:-10px;
margin-bottom:-30px;}
.adtocart i{
    color: #fff;
    font-size: 25px;
    line-height: 42px;
}

.pro-title {
    color: #5A5A5A;
    display: inline-block;
    margin-top: 20px;
    font-size: 16px;
}

.product-list .price {
    color:#fc5959 ;
    font-size: 15px;
}

.pro-img-details {
    margin-left: -15px;
}

.pro-img-details img {
    width: 100%;
}

.pro-d-title {
    font-size: 16px;
    margin-top: 0;
}

.product_meta {
    border-top: 1px solid #eee;
    border-bottom: 1px solid #eee;
    padding: 10px 0;
    margin: 15px 0;
}

.product_meta span {
    display: block;
    margin-bottom: 10px;
}
.product_meta a, .pro-price{
    color:#fc5959 ;
}

.pro-price, .amount-old {
    font-size: 18px;
    padding: 0 10px;
}

.amount-old {
    text-decoration: line-through;
}

.quantity {
    width: 120px;
}

.pro-img-list {
    margin: 10px 0 0 -15px;
    width: 100%;
    display: inline-block;
}

.pro-img-list a {
    float: left;
    margin-right: 10px;
    margin-bottom: 10px;
}

.pro-d-head {
    font-size: 18px;
    font-weight: 300;
}
</style>
 
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




</body>
</html>