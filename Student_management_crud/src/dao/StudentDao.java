package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Student;

public class StudentDao {
	Connection conn;
	public StudentDao() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/mydb";
		conn=DriverManager.getConnection(url, "root","root");
	}
	
	public boolean addStudent(Student student) throws SQLException {
		String sql="INSERT INTO student_crud(name, email, gender, contact, state, city, college, dob) VALUES(?,?,?,?,?,?,?,?)";
		PreparedStatement pst=this.conn.prepareStatement(sql);
		pst.setString(1, student.getName());
		pst.setString(2, student.getEmail());
		pst.setString(3, student.getGender());
		pst.setString(4, student.getContact());
		pst.setString(5, student.getState());
		pst.setString(6, student.getCity());
		pst.setString(7, student.getCollege());
		pst.setString(8, student.getDob());
		
		int result=pst.executeUpdate();
		if (result > 0){
			return true;	
		}else {
			return false;
		}
	}
	
	public Student getStudentById(int id) throws SQLException {
		String sql="SELECT * FROM student_crud WHERE id=?";
		PreparedStatement pst=this.conn.prepareStatement(sql);
		pst.setInt(1, id);
		ResultSet rs=pst.executeQuery();
		
		Student student=new Student();
		while(rs.next()) {
			student.setId(rs.getInt("id"));
			student.setName(rs.getString("name"));
			student.setEmail(rs.getString("email"));
			student.setGender(rs.getString("gender"));
			student.setContact(rs.getString("contact"));	
			student.setState(rs.getString("state"));
			student.setCity(rs.getString("city"));
			student.setCollege(rs.getString("college"));
			student.setDob(rs.getString("dob"));
		}
		return student;
	}
	
	public List<Student> getAllStudents() throws SQLException{
		List<Student> list=new ArrayList<Student>();
		String sql="SELECT * FROM student_crud";
		PreparedStatement pst=this.conn.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			Student student=new Student();
			student.setId(rs.getInt("id"));
			student.setName(rs.getString("name"));
			student.setEmail(rs.getString("email"));
			student.setGender(rs.getString("gender"));
			student.setContact(rs.getString("contact"));	
			student.setState(rs.getString("state"));
			student.setCity(rs.getString("city"));
			student.setCollege(rs.getString("college"));
			student.setDob(rs.getString("dob"));
			
			list.add(student);
			
		}
		return list;
	}
	
	public boolean removeStudent(int id) throws SQLException {
		String sql="DELETE FROM student_crud WHERE id=?";
		PreparedStatement pst=this.conn.prepareStatement(sql);
		pst.setInt(1, id);
		int result=pst.executeUpdate();
		if (result > 0) {
			return true;	
		}else {
			return false;
		}
	}
	
	public boolean updateStudent(Student student) throws SQLException {
		String sql="UPDATE student_crud SET name=?, email=?, gender=?, contact=?, state=?, city=?, college=?, dob=? WHERE id=?";
		PreparedStatement pst=this.conn.prepareStatement(sql);
		pst.setString(1, student.getName());
		pst.setString(2, student.getEmail());
		pst.setString(3, student.getGender());
		pst.setString(4, student.getContact());
		pst.setString(5, student.getState());
		pst.setString(6, student.getCity());
		pst.setString(7, student.getCollege());
		pst.setString(8, student.getDob());
		pst.setInt(9, student.getId());	
		
		int result=pst.executeUpdate();
		if (result > 0) {
			return true;	
		}else {
			return false;	
		}
	}

}
