package register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/save")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegistrationServlet() {
		super();

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// System.out.println("Do get");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String course = request.getParameter("course");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		RequestDispatcher dispatcher = null;
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
			System.out.println("DB connected");
			PreparedStatement pst = con.prepareStatement("insert into log(name,course,email,mobile,password) values(?,?,?,?,?)");
			pst.setString(1, name);
			pst.setString(2, course);
			pst.setString(3, email);
			pst.setString(4, mobile);
			pst.setString(5, password);
			
			int row = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("registration.jsp");
			if(row>0) {
				RequestDispatcher dispatche = request.getRequestDispatcher("index.jsp");
				dispatche.include(request, response);
			}
			else {
				RequestDispatcher dispatche = request.getRequestDispatcher("registration.jsp");
				dispatche.include(request, response);
			}
	        con.close();
	            
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Something went wrong");
		}
	}
}

