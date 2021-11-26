package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import dao.StudentDao;
import model.Student;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String choice=request.getServletPath();
		
		try {
			switch(choice) {
			case "/new":
				showForm(request,response);
				break;
			case "/add":
				addStudent(request,response);
				break;
			case "/remove":
				removeStudent(request,response);
				break;
			case "/edit":
				editStudent(request,response);
				break;
			case "/update":
				updateStudent(request,response);
				break;			
			case "/list":
				listStudents(request,response);
				break;
			case "/login":
				loginAdmin(request,response);
				break;
			case "/logout":
				logoutAdmin(request,response);
				break;
			default:
				indexPage(request,response);
				break;
			}
		}catch (SQLException | ClassNotFoundException ex) {
			throw new ServletException(ex);
		}
	}
		
	private void listStudents(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		StudentDao dao=new StudentDao();
		List<Student> students=dao.getAllStudents();
		request.setAttribute("students", students);
		request.getRequestDispatcher("studentlist.jsp").forward(request, response);

	}
			
	private void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("studentaddform.jsp").forward(request, response);
	}
	
	private void editStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		int id=Integer.parseInt(request.getParameter("id"));
		StudentDao dao=new StudentDao();
		Student student=dao.getStudentById(id);
		request.setAttribute("student", student);
		request.getRequestDispatcher("studentaddform.jsp").forward(request, response);
	}
	
	private void addStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		Student student=new Student();
		
		student.setName(request.getParameter("name"));
		student.setEmail(request.getParameter("email"));
		student.setGender(request.getParameter("gender"));
		student.setContact(request.getParameter("contact"));
		student.setState(request.getParameter("state"));
		student.setCity(request.getParameter("city"));
		student.setCollege(request.getParameter("college"));
		student.setDob(request.getParameter("dob"));
		
		StudentDao dao=new StudentDao();
		boolean res=dao.addStudent(student);
		if (res == true) {
			request.getSession().setAttribute("status", "Student added successfully");			
		}else {
			request.getSession().setAttribute("status", "Failed to add student");						
		}
		response.sendRedirect("list");
	}
	private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		Student student=new Student();
		
		student.setId(Integer.parseInt(request.getParameter("id")));
		student.setName(request.getParameter("name"));
		student.setEmail(request.getParameter("email"));
		student.setGender(request.getParameter("gender"));
		student.setContact(request.getParameter("contact"));
		student.setState(request.getParameter("state"));
		student.setCity(request.getParameter("city"));
		student.setCollege(request.getParameter("college"));
		student.setDob(request.getParameter("dob"));
		
		
		StudentDao dao=new StudentDao();
		dao.updateStudent(student);
		response.sendRedirect("list");
	}
	
	private void removeStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		int id=Integer.parseInt(request.getParameter("id"));
		StudentDao dao=new StudentDao();
		dao.removeStudent(id);
		response.sendRedirect("list");
	}
	private void indexPage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//		request.getRequestDispatcher("index.jsp").include(request, response);
		response.sendRedirect("index.jsp");
	}
	private void loginAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name=request.getParameter("adminname");
		String password=request.getParameter("password");
		if (name.equals("admin") && password.equals("admin123")){
			request.getSession().setAttribute("admin", "Admin");
			response.sendRedirect("list");
		}else{
			request.getSession().setAttribute("status", "Sorry, you have entered wrong credentials");
			response.sendRedirect("index.jsp");
		}
	}
	private void logoutAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().invalidate();
		response.sendRedirect("index.jsp");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

}
