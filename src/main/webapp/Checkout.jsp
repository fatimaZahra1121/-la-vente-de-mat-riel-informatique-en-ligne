<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="modele.user" %>
    <%@ page import="modele.produit" %>
     <%@ page import="modele.categorie" %>
       <%@ page import="Datalayer.gestionUser" %>
      <%@ page import="Datalayer.gestionProduit" %>
      <%@ page import="Datalayer.gestionCategories" %>
      <%@ page import="controlleur.inscription" %>
        <%@ page import="controlleur.Panier" %>
        <%@ page import="java.sql.SQLException" %>
      <%@ page import="controlleur.Panier" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
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
 #red{
 color:red;}
 
    .container{
    font-family: 'Poppins', sans-serif;
    background-color:white;
    padding-bottom:20px;
    margin-top:50px;
    font-size:20px;


  overflow: hidden;

  
  border-radius: 0.6em;

  box-shadow: 0 0.5em 0 rgba(138, 148, 152, 0.2);
    margin-bottom:20px}
    #a{
    font-size:25px;
    color:var(--orange)
    }
    #m1{
    background-color:var(--orange)}
 
      
    </style>
<title>commander</title>
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
<br><br><br><br><br>
<div class="container" >

  <div class="py-5 text-center">
    
   <h1 class="heading"> Commander<span>Maintenant</span></h1>
     </div>

  <div class="row">
    <div class="col-md-4 order-md-2 mb-4">
      <h4 class="d-flex justify-content-between align-items-center mb-3">
        <span class="mb-3" id="a">Votre Panier</span>
        <span class="badge badge-secondary badge-pill" id="m1"><%=l.size() %></span>
      </h4>
      <ul class="list-group mb-3"><%   
      
         int k=0;
      
   int  totale=0;
    
      for(produit p1:l)
    	  {
    	  float prix=p1.getQte()*p1.getPrice();
    	  totale+=p1.getPrice()*p1.getQte();
    	  k++;
    	  %>
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div>
            <h6 class="my-0" style="font-size:20px;"><% out.println(p1.getNom()); %></h6>
            <small class="text-muted"></small>
          </div>
          <span class="text-muted"><% out.println(p1.getPrice()); %> DH</span>
        </li>
       
         <%} %>
      <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div>
            <h6 class="my-0" style="font-size:20px;">Totale:</h6>
            <small class="text-muted"></small>
          </div>
          <span class="text-muted"><%out.println(totale); %> DH</span>
        
        </li>
         
    </div>

    <div class="col-md-8 order-md-1">
      <h4 class="mb-3" id="a">Information personnel</h4>
      <form action="Panier" method="post" class="needs-validation"  novalidate>
        <div class="row">
          <div class="col-md-6 mb-3">
         
            <label for="firstName">Nom</label>
            <input type="text"  name="nom" class="form-control" id="firstName" placeholder="Nom" value="" required>
            <br>
            <label for="firstName">Prenom</label>
            <input type="text"  name="prenom" class="form-control" id="firstName" placeholder="Prenom" value="" required>
            <div class="invalid-feedback">
              Valid first name is required.
            </div>
          </div>
          
        </div>


        <div class="mb-3">
          <label for="email">Email <span class="text-muted"></span></label>
          <input type="email" name="email" class="form-control" id="email" placeholder="you@gmail.com">
         
        </div>

        <div class="mb-3">
          <label for="address">Adresse de livraison</label>
          <input type="text" class="form-control" name="adress" id="address" placeholder="1234 Main St" required>
          <div class="invalid-feedback">
            Please enter your shipping address.
          </div>
        </div>

        


      
        <hr class="mb-4">
        
        <div class="custom-control custom-checkbox">
         <%-- <input type="checkbox" class="custom-control-input" id="save-info">
           <label class="custom-control-label" for="save-info" name="sauv">Enregistrer ces informations pour la prochaine fois</label>--%>
        </div>
        <hr class="mb-4">

        <h4 class="mb-3" id="a">Payment</h4>

       
        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="cc-name">Name on card</label>
            <input type="text" class="form-control"  name="card" id="cc-name" placeholder="" required>
            <small class="text-muted"></small>
            <div class="invalid-feedback">
              Name on card is required
            </div>
          </div>
          <div class="col-md-6 mb-3">
            <label for="cc-number">Credit card number</label>
            <input type="text" class="form-control" id="cc-number" name="number" placeholder="" required>
            <div class="invalid-feedback">
              Credit card number is required
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-3 mb-3">
            <label for="cc-expiration">Expiration</label>
            <input type="text" class="form-control"  name="exp" id="cc-expiration" placeholder="annee-mois-jour" required>
            <div class="invalid-feedback">
              Expiration date required
            </div>
          </div>
          <div class="col-md-3 mb-3">
            <label for="cc-cvv">CVV</label>
            <input type="text" class="form-control" name="ccv" id="cc-cvv" placeholder="" required>
            <div class="invalid-feedback">
              Security code required
            </div>
          </div>
        </div>
        <hr class="mb-4">
        <% session = request.getSession(true);
      //Récupérer l’ID de l'utilisateur 
       session.getAttribute("id");
            		if(session.getAttribute("id")!=null){%>
        <button class="btn btn-primary btn-lg btn-block" type="submit">Commander</button><%}else{ %>
        <label for="cc-cvv" id="red">Vous devez conectez pour effectuer la commande.</label><%} %>
      </form>
    </div>
  </div>

  
</div>
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
</html>