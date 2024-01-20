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
 * Servlet implementation class ModifierInfoClient
 */
@WebServlet("/ModifierInfoClient")
public class ModifierInfoClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String id;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierInfoClient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 id=request.getParameter("id");
		 System.out.println("errrreeeuurr");
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 this.getServletContext().getRequestDispatcher("/ModifierInfoClient.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String nom=request.getParameter("email");
		String pass=request.getParameter("pass");
		//String op=request.getParameter("option");
		
		//System.out.println("id est;"+id);
		int i=Integer.parseInt(id);
	System.out.println("id est;"+i);
	user u=new user(nom,pass,i,"Client");
		
		gestionUser m=new gestionUser();

		m.modifierUser(u);
		//user u1=m.getuser(i);
		
		
		

		try {
			this.getServletContext().getRequestDispatcher("/ModifierInfoClient.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
