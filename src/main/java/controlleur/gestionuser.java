package controlleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Datalayer.gestionUser;
import modele.user;

/**
 * Servlet implementation class gestionuser
 */
@WebServlet("/gestionuser")
public class gestionuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String idm;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gestionuser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String mail=request.getParameter("user");
		String pass=request.getParameter("pass");
		if(pass!=null && mail!=null)
		{
			ajouter(request,response);
		}
		else
		{
		if(request.getParameter("ids")!=null)
			suprimmer(request,response);
		
		else
		   {
			   idm=request.getParameter("id");
			   
			  this.getServletContext().getRequestDispatcher("/modifierUser.jsp").forward(request, response);
		   }	
		}
		
		   
					
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String mail=request.getParameter("user");
		String pass=request.getParameter("pass");
		String Mc=request.getParameter("mc");
		if(Mc!=null)
		{

			this.getServletContext().getRequestDispatcher("/gestionUser.jsp").forward(request, response);	
		}
		
		else
		{
			
			modifier(request,response);
		}
	}
	protected void modifier(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom=request.getParameter("user");
		String pass=request.getParameter("pass");
		String op=request.getParameter("option");
		int i=0;
		System.out.println(op);
		
		
		
		

		try {
			if(idm!=null)
				i=Integer.parseInt(idm);
					user u=new user(nom,pass,i,op);
						
						gestionUser m=new gestionUser();

						m.modifierUser(u);
			this.getServletContext().getRequestDispatcher("/gestionUser.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void suprimmer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("ids");
		int i=Integer.parseInt(id);
		gestionUser m=new gestionUser();
		m.suprimeruser(i);
		try {
			this.getServletContext().getRequestDispatcher("/gestionUser.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void ajouter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mail=request.getParameter("user");
		String pass=request.getParameter("pass");		
		String role=request.getParameter("rol");
		gestionUser m=new gestionUser();
	
		

		try {
			user c=new user(mail,pass);
			  c.setOption(role);
			  System.out.println(role);
					m.adduser(c);
			this.getServletContext().getRequestDispatcher("/gestionUser.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
