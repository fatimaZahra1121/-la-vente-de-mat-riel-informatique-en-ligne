package controlleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Datalayer.gestionCategories;
import modele.categorie;

/**
 * Servlet implementation class gestionC1
 */
@WebServlet("/gestionC1")
public class gestionC1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String idc;
    /**
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gestionC1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		if(request.getParameter("id")!=null)
		{
			this.getServletContext().getRequestDispatcher("/modifierCat.jsp").forward(request, response);
		idc=request.getParameter("id");
		}
		if(request.getParameter("ids")!=null)
		{
			suprimmer(request,response);
			
		}
		
		String nom=request.getParameter("cat");
		String url=request.getParameter("url");
		if(nom!=null && url!=null)
		{
			if(nom!="" && url!="") {
				
				ajouter(request,response);
			}
				
			else
					this.getServletContext().getRequestDispatcher("/AjouterCat.jsp").forward(request, response);
				
				
			
			
		}
		
		

	}

	/**
	 * @throws IOException 
	 * @throws ServletException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		// TODO Auto-generated method stub
		String Mc=request.getParameter("mc");
		//pour chercher
		if(Mc!=null)
		{

			try {
				this.getServletContext().getRequestDispatcher("/gestionCatD.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		String nom=request.getParameter("cat");
		String url=request.getParameter("url");
		if(nom!=null && url!=null)
		{
			if(nom!="" && url!="") {
				
				modifier(request,response);
			}
				
			else
					this.getServletContext().getRequestDispatcher("/modifierCat.jsp").forward(request, response);
				
				
			
			
		}
	
		
		
		

		
			}
	
	protected void suprimmer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("ids");
		int i=Integer.parseInt(id);
		gestionCategories m=new gestionCategories();
		m.suprimerCat(i);
		this.getServletContext().getRequestDispatcher("/gestionCatD.jsp").forward(request, response);
	}
	protected void ajouter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom=request.getParameter("cat");
		String url=request.getParameter("url");
		gestionCategories m=new gestionCategories();
	
		categorie c=new categorie(url,nom);
		m.ajoutercat(c);
		this.getServletContext().getRequestDispatcher("/gestionCatD.jsp").forward(request, response);
	}
	protected void modifier(HttpServletRequest request, HttpServletResponse response) {
		
		String nom=request.getParameter("cat");
		String url=request.getParameter("url");
		
	int i=Integer.parseInt(idc);

		categorie p=new categorie(url,nom,i);

		gestionCategories m=new gestionCategories();
	m.modifierCat(p);
		
		
		

		try {
			this.getServletContext().getRequestDispatcher("/gestionCatD.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	}
