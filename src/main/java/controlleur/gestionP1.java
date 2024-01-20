package controlleur;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Datalayer.gestionCategories;
import Datalayer.gestionProduit;
import modele.produit;

/**
 * Servlet implementation class gestionP1
 */
@WebServlet("/gestionP1")
public class gestionP1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String idm;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gestionP1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ids=request.getParameter("ids");
		if(ids!=null)
			suprimmerer(request,response);
		String idmp=request.getParameter("idm");
		
	    		if(idmp!=null)
		{
	    			 idm=request.getParameter("idm");

			this.getServletContext().getRequestDispatcher("/ModifierProdDash.jsp").forward(request, response);	
		}
		System.out.println("idm from gestion"+idm);
		
		 
		String nom=request.getParameter("prod");
		String url=request.getParameter("url");
		String price=request.getParameter("price");
		String Qte=request.getParameter("stock");
		if(nom!=null && url!=null && price!=null && Qte!=null)
		{
		if(nom!="" && url!="" && price!="" && Qte!="")
		{
			modifier(request,response);	
		}	
		else
		{
		this.getServletContext().getRequestDispatcher("/ModifierProdDash.jsp").forward(request, response);	
		}
			
		}
		  String name=request.getParameter("nom1");
		  if(name!=null)
			  this.getServletContext().getRequestDispatcher("/dashbordP.jsp").forward(request, response);	
	
		  String cher=request.getParameter("mc");
	    
	      String stock=request.getParameter("etat");

	      String rep=request.getParameter("etat1");
	      
	      if(cher!=null)
	      {
	    	  this.getServletContext().getRequestDispatcher("/dashbordP.jsp").forward(request, response);	
	    		 
	      	
	      }
	     
	      if(stock!=null)
	      {
	    	  this.getServletContext().getRequestDispatcher("/dashbordP.jsp").forward(request, response);	
	    		
	      }
	      if(rep!=null){
	    	  this.getServletContext().getRequestDispatcher("/dashbordP.jsp").forward(request, response);	
	    		
	      }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
String nom=request.getParameter("prod");
String url=request.getParameter("url");
String price=request.getParameter("price");
String Qte=request.getParameter("qte");
if(nom!=null && url!=null && price!=null && Qte!=null)
{
if(nom!="" && url!="" && price!="" && Qte!="")
{
	ajouter(request,response);	
}	
else
{
	String vide="vide";
	request.setAttribute("vide", vide);
this.getServletContext().getRequestDispatcher("/AjouterProdDash.jsp").forward(request, response);	
}
	
}




	}
	private void modifier(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String nom=request.getParameter("prod");
		String url=request.getParameter("url");
		String price=request.getParameter("price");
		String Qte=request.getParameter("stock");
		String des=request.getParameter("descrip");
		String cat=request.getParameter("list");


		double prix=Double.parseDouble(price);
		int qt=Integer.parseInt(Qte);
		System.out.println("c'est categorie"+cat);
		gestionProduit m=new gestionProduit();
		int idc = 0;
		gestionCategories c=new gestionCategories();
			
		
		if(cat.equals("Choisir une categorie"))
			idc=0;
		else {
			try {
				idc = c.getIdcat(cat);
				
		
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		System.out.print(cat);
		System.out.print("c'est id cat"+idc);
		int i=Integer.parseInt(idm);
		produit p=new produit(nom,url,(long) prix,des,idc,qt);
	p.setStock(qt);
		p.setId(i);
		m.modifierProd(p);
			
		

		try {
			this.getServletContext().getRequestDispatcher("/dashbordP.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void suprimmerer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String id=request.getParameter("ids");
		int i=Integer.parseInt(id);
		gestionProduit m=new gestionProduit();
		m.suprimerProd(i);
		this.getServletContext().getRequestDispatcher("/dashbordP.jsp").forward(request, response);
	}
	private void ajouter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String nom=request.getParameter("prod");
		String url=request.getParameter("url");
		String price=request.getParameter("price");
		String Qte=request.getParameter("qte");
		String des=request.getParameter("descrip");
		String cat=request.getParameter("list");


		double prix=Double.parseDouble(price);
		int qt=Integer.parseInt(Qte);

		System.out.println(cat);
		gestionProduit m=new gestionProduit();
		gestionCategories c=new gestionCategories();

		int idc;
		try {
			idc = c.getIdcat(cat);
			System.out.print(idc);
		produit p=new produit(nom,url,(long) prix,des,idc,qt);

		m.ajouterprod(p);

		this.getServletContext().getRequestDispatcher("/dashbordP.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
