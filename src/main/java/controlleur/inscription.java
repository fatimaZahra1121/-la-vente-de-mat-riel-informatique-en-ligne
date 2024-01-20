package controlleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Datalayer.gestionUser;
import modele.user;

/**
 * Servlet implementation class inscription
 */
@WebServlet("/inscription")
public class inscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  public static user user;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inscription() {
    	
        super();
        user=new user();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
	
					if(request.getParameter("username")!=null && request.getParameter("pass")!=null)
					{
						
						inscription(request,response);
					}
	}
		    	
		    	
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		if(request.getParameter("username")!=null && request.getParameter("pass")!=null)
		{
			
			authentification(request,response);

	
		}
				
	String d=request.getParameter("dec");
	
			if(d!=null)
			{
				deconection(request,response);
			}		
			
	}
	
	protected void inscription(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		user u=new user();
		System.out.println("add");
	u.setMail(request.getParameter("username"));
	u.setPass(request.getParameter("pass"));
	u.setOption("client");
	gestionUser m=new gestionUser();
	System.out.println(m.verfication(u.getMail())+"  ver");
	if(m.verfication(u.getMail())==0)
	{
	m.adduser(u);
	this.getServletContext().getRequestDispatcher("/Home.jsp").forward(request, response);
	
	}
	else
		this.getServletContext().getRequestDispatcher("/Inscription.jsp").forward(request, response);
	
		
	}
	protected void authentification(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user.setMail(request.getParameter("username"));
    	user.setPass(request.getParameter("pass"));
			
    	System.out.println(user.getMail()+"from servlet");
    	gestionUser m=new gestionUser();
    if(m.ConxUser(user)!=null);
    {
    	System.out.println("exsist id");
    	HttpSession session = request.getSession(true);
    	user.setId(m.getiduser(user));
    	session.setAttribute("id",user.getId());
 
    	this.getServletContext().getRequestDispatcher("/Home.jsp").forward(request, response);
	
    }
		
	}
	protected void deconection(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		session.invalidate();
		user.setMail(null);
		user.setPass(null);
		this.getServletContext().getRequestDispatcher("/Home.jsp").forward(request, response);
	}	
	
	}
		
	

