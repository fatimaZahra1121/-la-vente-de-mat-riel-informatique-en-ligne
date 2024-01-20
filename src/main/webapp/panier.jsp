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
<html>
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
@font-face {
    font-family: 'Shopper';
    src: url('http://www.shopperfont.com/font/Shopper-Std.ttf');
}

 .shopper {
  text-transform: lowercase;
  font: 2em 'Shopper', sans-serif;
  line-height: 0.5em;
  display: inline-block;
}



#na {
  text-transform: uppercase;
  font-weight: bold;
  font-size: 2.5em;
}

p {
  font-size: 1.5em;
  color: #8a8a8a;
}

#ana {
  border: 0.3em solid #bbc3c6;
  padding: 0.5em 0.3em; 
  font-size: 1.4em;
  color: #8a8a8a;
  text-align: center;
}

img {
width:50px;
height:20px

  overflow: hidden; 
  margin-right: 1em;
}

a {
  text-decoration: none;
}

.container {

margin-top:160px;

 margin-left:100px;
 padding-left:-30px;
  overflow: hidden;

  
  border-radius: 0.6em;
  background: #F4F4F4;
  box-shadow: 0 0.5em 0 rgba(138, 148, 152, 0.2);
  width:1500px;
}

.heading1 {
margin-left:-15px;
margin-right:-15px;
  padding: 1em;
  position: relative;
  z-index: 1;
  color: #f7f7f7;
  background: var(--orange);
}

.cart {
  margin: 2.5em;
  overflow: hidden;
}

.cart.is-closed {
  height: 0;
  margin-top: -2.5em;
}

.table {
  background: #ffffff;
  border-radius: 0.6em;
  overflow: hidden;
  clear: both;
  margin-bottom: 1.8em;
padding-left:5px;
padding-right:-30px
}


.layout-inline > * {
  display: inline-block;
}

.align-center {
  text-align: center;
}

.th {
  background: var(--orange);
  color: #fff;
  text-transform: uppercase;
  font-weight: bold;
  font-size: 1.5em;
}

.tf {
  background: #f34d35;
  text-transform: uppercase;
  text-align: right;
  font-size: 1.2em;  
}

.tf p {
  color: #fff;
  font-weight: bold;
}

.col {
  padding: 1em;
  width: 12%;
}

.col-pro {
  width: 44%;
}

.col-pro > * {
  vertical-align: middle;
}

.col-qty {
  text-align: center;
  width: 17%;
}

.col-numeric p {
  font: bold 1.8em helvetica;
}

.col-total p {
  color: #12c8b1;
}

.tf .col {
  width: 20%;
}

.row > div {
  vertical-align: middle;
}

.row-bg2 {
  background: #f7f7f7;
}

.visibility-cart {
  position: absolute;
  color: #fff;
  top: 0.5em;
  right: 0.5em;
  font:  bold 2em arial;
  border: 0.16em solid #fff;
  border-radius: 2.5em;
  padding: 0 0.22em 0 0.25em ;
}

.col-qty > * {
  vertical-align: middle; 
}

.col-qty > input {
  max-width: 2.6em;
}


a.qty {
  width: 1em;
  line-height: 1em;
  border-radius: 2em;
  font-size: 2.5em;
  font-weight: bold;
  text-align: center;
  background: #43ace3;  
  color: #fff;
}

a.qty:hover {
  background: #3b9ac6;
}


.transition {
  transition: all 0.3s ease-in-out;
}

@media screen {

  
  .col-pro {
    width: 35%;
  }
  
  .col-qty {
    width: 22%;
  }
  
  img {
 
    margin-bottom: 1em;
  }
}


.chek{
 background: #ffff;
  display: inline-block;
  margin-left:1080px;
    border-radius: 0.6em;
  overflow: hidden;
  clear: both;
  padding:20px;

  
}

#me{
margin:-20px;
margin-bottom:5px;
padding-top:10px;
padding-top:-5px;
text-align:center}


@media screen  {
  
}
#tot{
margin-top:-40px;
margin-left:80px}
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
    	 
   
   
    	  out.println("<div class='fas ' id='login-btn' style='  height: 4.5rem;width: 16.5rem;font-size:12px;'><p  >"+nom+" </p></div>");
      	
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



 <div class="container" >
  <div class="heading1">
    <h4 id="na"><span class="shopper">s</span> Shopping Cart</h4>
    
    <a href="#" class="visibility-cart transition is-open" >X</a>    
  </div>
  <%if(l==null || (l!=null && l.size()==0))
	{
      out.println("<h3>Votre Panier actulle est vide </h3>") ;
      out.println("<h3> Voullez-vous,<a href='Store.jsp'>Commander des produit</a></h3>") ;
	}
  else{%>
  <div class="cart transition is-open">
    
   
    
    
    <div class="table">
      
      <div class="layout-inline row th">
        <div class="col col-pro">Produit</div>
        <div class="col col-price align-center "> 
          Prix
        </div>
        <div class="col col-qty align-center">Quantite</div>
        
        <div class="col">Totale</div>
        <div class="col">Suprimmer</div>
      </div>
   
      <%   
      
         int k=0;
      
   int  totale=0;
    
      for(produit p1:l)
    	  {
    	  float prix=p1.getQte()*p1.getPrice();
    	  totale+=p1.getPrice()*p1.getQte();
    	  k++;
    	  %>
      <div class="layout-inline row">
        
        <div class="col col-pro layout-inline">
          <img src="<% out.println(p1.getUrl()); %>" width="28px" height="48px" alt="kitten" />
          <p><% out.println(p1.getNom()); %></p>
        </div>
        
        <div class="col col-price col-numeric align-center ">
          <p id="source"><% out.println(p1.getPrice()); %></p>
        </div>

        <div class="col col-qty layout-inline">

          <a href="Panier?moin=<%=p1.getId()%>" class="qty qty-minus">-</a>
       
            <input type="numeric"  id="ana" value="<%=p1.getQte() %>"  name="qt" />
          <a href="Panier?plus=<%=p1.getId()%>" class="qty qty-plus">+</a>
        
    
        </div>
        
        <div class="col col-vat col-numeric">
           <p id="prix"><% out.println(prix); %></p>

        </div>
        <div class="col col-total col-numeric">               <div class="col col-total col-numeric">
        <a href="Panier?sup=<%=p1.getId()%>">
<svg role="img" xmlns="http://www.w3.org/2000/svg" width="48px" height="48px" viewBox="0 0 24 24" aria-labelledby="cancelIconTitle cancelIconDesc" stroke="#ff0000" stroke-width="1" stroke-linecap="square" stroke-linejoin="miter" fill="none" color="#2329D6"> <title id="cancelIconTitle">Cancel</title> <desc id="cancelIconDesc">Icon of a cross (x) closed in a circle</desc> <path d="M15.5355339 15.5355339L8.46446609 8.46446609M15.5355339 8.46446609L8.46446609 15.5355339"/> <path d="M4.92893219,19.0710678 C1.02368927,15.1658249 1.02368927,8.83417511 4.92893219,4.92893219 C8.83417511,1.02368927 15.1658249,1.02368927 19.0710678,4.92893219 C22.9763107,8.83417511 22.9763107,15.1658249 19.0710678,19.0710678 C15.1658249,22.9763107 8.83417511,22.9763107 4.92893219,19.0710678 Z"/> </svg>
      </a>  </div>  
        </div>
      </div>
      <%} %>
      
     </div>
      <div class="chek">
      
      <p class="th" id="me">Resume<br></p>
      
      <br>
      <p>Nombre des produits :<%=l.size() %>
      <br><br>
      Totale:</p>  <p id="tot"><%out.println(totale); %></p>
      <br>
      <p>Lavraison Gratuit.</p>
 
      
         <a href="Checkout.jsp"><input type="submit" value="Proceder aux commande" class="btn" ></a>  
    </form>
    <%} %>
      
      
  </div>
    
 </div></div></div>
  
<!-- header section ends -->

<!-- home section starts  -->
<br><br><br><br>
  
<br><br>
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



  <script>
$('.visibility-cart').on('click',function(){
    
	  var $btn =  $(this);
	  var $cart = $('.cart');
	  console.log($btn);
	  
	  if ($btn.hasClass('is-open')) {
	     $btn.removeClass('is-open');
	     $btn.text('O')
	     $cart.removeClass('is-open');     
	     $cart.addClass('is-closed');
	     $btn.addClass('is-closed');
	  } else {
	     $btn.addClass('is-open');
	     $btn.text('X')
	     $cart.addClass('is-open');     
	     $cart.removeClass('is-closed');
	     $btn.removeClass('is-closed');
	  }

	                  
	});


</script>

  </body>

</html>