package controlleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modele.commande;

/**
 * Servlet implementation class gestionCom
 */
@WebServlet("/gestionCom")
public class gestionCom extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String idm;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gestionCom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	if(request.getParameter("ids")!=null)
	{
		suprimer(request,response)	;
	}
	else {
	if(request.getParameter("idm")!=null)
	{
		idm=request.getParameter("idm");
		this.getServletContext().getRequestDispatcher("/Modifieretat.jsp").forward(request, response);
	}
	else
		this.getServletContext().getRequestDispatcher("/detailcom.jsp").forward(request, response);
	}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("list")!=null)
			modifier(request,response);
		else
	
			this.getServletContext().getRequestDispatcher("/gestionCom.jsp").forward(request, response);	
	}
	protected void modifier(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		commande u=new commande();
		int id=Integer.parseInt(idm); 
		u.setId(id);
		String list=request.getParameter("list");
		System.out.println("etat:"+list);
		Datalayer.gestionCommande m=new Datalayer.gestionCommande();
		u.setEtat(list);
		m.updateCommane(u);
		this.getServletContext().getRequestDispatcher("/gestionCom.jsp").forward(request, response);
		
	}
	protected void suprimer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("ids");
		int i=Integer.parseInt(id);
		Datalayer.gestionCommande m=new Datalayer.gestionCommande();
		
		m.suprimmerCommande(i);
		
		this.getServletContext().getRequestDispatcher("/gestionCom.jsp").forward(request, response);
	}
	

}
