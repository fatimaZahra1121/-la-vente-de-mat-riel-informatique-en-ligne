package controlleur;
import java.time.LocalDate;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Datalayer.gestionCommande;
import Datalayer.gestionProduit;
import Datalayer.gestionUser;
import modele.commande;
import modele.produit;
import modele.user;

/**
 * Servlet implementation class Panier
 */
@WebServlet("/Panier")
public class Panier extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static List<produit> list=new ArrayList<produit>();
	public static int prid;
	int id;
	String adresse;
	public static Cookie cokie=new Cookie("panier","");
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Panier() {
        super();
       

        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		 Cookie[] cookies = request.getCookies();
	     int b=0;
	        for(int i=0;i<cookies.length;i++) {
	        if(cookies[i].getName().equals("panier")) {
	        	if(!cookies[i].getValue().equals(""))
	        	{
	        	String[] listp=cookies[i].getValue().split("_");
	        	 System.out.println("\ncontenu list:"+cookies[i].getValue());
	        	 
	        	 if(list!=null)
	        		 list.clear();
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
							list.add(prod);
							
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					
	        	}
	        	System.out.print("from panier size"+list.size());
	    cokie.setValue(cookies[i].getValue());
	    response.addCookie(cokie);
	       break;
	        	}
	        
	        }
	        }
	     
	        String idpr=request.getParameter("prod");
		String id=request.getParameter("id");
		if(id!=null)
		{
			AddToCart(request,response,id);
			
				this.getServletContext().getRequestDispatcher("/Home.jsp").forward(request, response);
				
			
			
		}
		if(idpr!=null)
		{
			AddToCart(request,response,idpr);
			gestionProduit m=new gestionProduit();
			produit p=new produit();
			try {
				
				p=m.getproduit(prid);
				request.setAttribute("produit", p);
				
			} catch (SQLException e) {
				
			}
			
				this.getServletContext().getRequestDispatcher("/produit.jsp").forward(request, response);
				
			
			
		}
		String idst=request.getParameter("store");
		if(idst!=null)
		{
			AddToCart(request,response,idst);
			
				this.getServletContext().getRequestDispatcher("/Store.jsp").forward(request, response);
				
			
			
		}
		String plus=request.getParameter("plus");
		String sup=request.getParameter("sup");
		String moins=request.getParameter("moin");
		if(plus!=null || moins!=null)
		{
	
			modifier(request,response);
			this.getServletContext().getRequestDispatcher("/panier.jsp").forward(request, response); 
		}
		if(sup!=null)
		{
	
			suprimer(request,response);
			this.getServletContext().getRequestDispatcher("/panier.jsp").forward(request, response); 
		}
		
			
		String idp=request.getParameter("idp");
		if(idp!=null)
		{
			 Voir(request,response);	
		}
		String idcat=request.getParameter("idcat");
		if(idcat!=null)
		{
			this.getServletContext().getRequestDispatcher("/Store.jsp").forward(request, response); 	
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String price=request.getParameter("range");
		if(price!=null)
			filtrer(request,response);
		String cher=request.getParameter("chercher");
		if(cher!=null)
			
		this.getServletContext().getRequestDispatcher("/Store.jsp").forward(request, response);
		String adresse=request.getParameter("adress");
		
		if(adresse!=null)
		{
			System.out.println("chekout size"+Panier.list.size());
			   cokie.setValue("");
			    response.addCookie(cokie);
		//user user=inscription.user;
    	
    		//System.out.println("chekout size"+Panier.list.size());
    		//id=user.getId();
    		
		ajouterCom(request,response);
    	
		try {
			this.getServletContext().getRequestDispatcher("/succes.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
		
		
		}
	@SuppressWarnings("null")
	private void AddToCart(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException{
	
		
		
		System.out.println(id+"id");
	
		int flags=0;
		String t = cokie.getValue();
		if(!t.equals("")) {
		String[] prods=t.split("_");
		for(String s:prods)
		{
			String[] pr=s.split(":");
			String idp = pr[0];
				if(id.equals(idp))
				{
					flags=1;
					break;
				}
			
			
		}	
		}
		
		if(flags==0)
		{
			 t+=id+":1"+"_";
			 cokie.setValue(t);
			 System.out.println("\ncontenu:"+t);
			 response.addCookie(cokie);
		}
		 else {
			 System.out.println("\ncontenu:"+t);
			 cokie.setValue(t);
		     response.addCookie(cokie);
		 }
		

		}
	protected void Voir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id=request.getParameter("idp");
		int i=Integer.parseInt(id);
		prid=i;
		gestionProduit m=new gestionProduit();
		produit p=new produit();
		try {
			
			p=m.getproduit(i);
			request.setAttribute("produit", p);
			this.getServletContext().getRequestDispatcher("/produit.jsp").forward(request, response);
		} catch (SQLException e) {
			
		}
	}
	protected void suprimer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("sup");
				String t = cokie.getValue();
				System.out.println("avant:"+t);
				if(!t.equals(""))
				{
					String test = new String();
					String[] prods=t.split("_");
					
					for(String s:prods)
					{
						
						String[] pr=s.split(":");
						String idp = pr[0];
						String qt=pr[1];
						int q=Integer.parseInt(qt);
						
						
							if(id.equals(idp))
							{
								System.out.println("idp a suprimmer:"+idp);
							
								
							}
							else {
								test+=pr[0]+":"+pr[1]+"_";
								
							}
						
						
					}
					cokie.setValue(test);
				     response.addCookie(cokie);
					System.out.println("apres:"+test);	
				}
				
				
	}
	protected void filtrer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String price=request.getParameter("range");
		
		System.out.print(price);
		this.getServletContext().getRequestDispatcher("/Store.jsp").forward(request, response);
	}
protected void ajouterCom(HttpServletRequest request, HttpServletResponse response){
	
String nom=request.getParameter("nom");
String prenom=request.getParameter("prenom");
String email=request.getParameter("email");
String adres=request.getParameter("adress");
String card=request.getParameter("card");
String number =request.getParameter("number");
String exp=request.getParameter("exp");
String cvv=request.getParameter("ccv");
List<String> list1=new ArrayList<String>();
list1.add(nom);list1.add(number);list1.add(exp);list1.add(cvv);list1.add("12");
gestionUser u=new gestionUser();
HttpSession session = request.getSession(true);
//Récupérer l’ID de l'utilisateur 
int idUser= (int)session.getAttribute("id");
user u1=new user();
u1.setId(idUser);
u1.setNom(nom);
u1.setPrenom(prenom);
u1.setAdresse(adres);
u.addclient1(u1);


u.card(list1);

gestionCommande c=new gestionCommande();
Cookie[] cookies = request.getCookies();
for(int i=0;i<cookies.length;i++) {
    if(cookies[i].getName().equals("panier")) {
    	if(!cookies[i].getValue().equals(""))
    	{
    	String[] listp=cookies[i].getValue().split("_");
    	 System.out.println("\ncontenu list:"+cookies[i].getValue());
    	 
    	 if(list!=null)
    		 list.clear();
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
					list.add(prod);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			
    	}
    	

   break;
    	}
    
    }
    }
int b=c.Id()+1;
System.out.println(list.size());
for(produit p:list)
{
	//commande(float prixT, LocalDate todaysDate, String etat, int id, int qte, int idC)
	float prix=p.getQte()*p.getPrice();
	// LocalDate today=new LocalDate.now();
	 //comma//nde(float prixT, LocalDate todaysDate, String etat, int id, int qte, int idC, int iduser) {
			//super();
	LocalDate myObj = LocalDate.now(); // Create a date object
    System.out.println(myObj); 
	commande cm=new commande(prix,myObj,"en cours",b,p.getQte(),p.getId(),idUser);
	cm.setQte(p.getQte());
	c.ajouterCommande(cm);
	
	
}


	
	
	
	
	}
	protected void modifier(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String plus=request.getParameter("plus");
		String moins=request.getParameter("moin");
		String sup=request.getParameter("sup");
		
		String id;
		
		int i;
		if(plus!=null)
		{
			id=plus;
			i=1;	
		}
		
		
		else 
		{
			id=moins;
			 i=-1;
		}
		System.out.println("id"+id);
	String t = cokie.getValue();
	System.out.println("avant:"+t);
	
	String test = new String();
		String[] prods=t.split("_");
		
		for(String s:prods)
		{
			
			String[] pr=s.split(":");
			String idp = pr[0];
			String qt=pr[1];
			int q=Integer.parseInt(qt);
			
			
				if(id.equals(idp))
				{
					System.out.println("idp:"+idp);
				
			
					if(q==1)
					{
						if(i==-1)
						{
							 test+=pr[0]+":"+pr[1]+"_";
						}
					
						else {
							q=q+i;
						pr[1]=Integer.toString(q);
						System.out.println("Bonjour:pr[1]="+pr[1]);
					   test+=pr[0]+":"+pr[1]+"_";
						}
								
					}
					else {
						q=q+i;
						pr[1]=Integer.toString(q);
						System.out.println("Bonjour:pr[1]="+pr[1]);
					   test+=pr[0]+":"+pr[1]+"_";		
					}
				
						
				
					
				}
				else {
					test+=pr[0]+":"+pr[1]+"_";
					
				}
			
			
		}
		cokie.setValue(test);
	     response.addCookie(cokie);
		System.out.println("apres:"+test);
	}
	
}
