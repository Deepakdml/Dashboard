<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
</head>
<style>

.form-container {
    width: 50%;
    margin: 0 auto;
    padding: 20px;
    background-color: #a010e8;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}


input[type=text], input[type=password] {
    width: 100%;
    padding: 10px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    font-size: 16px;
}


input[type=submit] {
    width: 100%;
    background-color: #a010e8;
    color: white;
    padding: 12px 20px;
    margin: 10px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}


input[type=submit]:hover {
    background-color: #0056b3;
}


label {
    font-weight: bold;
    display: block;
    margin-bottom: 6px;
}


.form-title {
    text-align: center;
    margin-bottom: 20px;
    font-size: 24px;
    color: #333;
}

</style>
<body>
    <h1>Edit Student</h1>
    <%
        
        int studentId = Integer.parseInt(request.getParameter("id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
            String sql = "SELECT * FROM log WHERE id=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, studentId);
            ResultSet rs = pst.executeQuery();

            
            if (rs.next()) {
               
                String name = rs.getString("name");
                String course = rs.getString("course");
                String email = rs.getString("email");
                String mobile = rs.getString("mobile");
                String password = rs.getString("password");
    %>
    <form action="update.jsp" method="post">
        
        <input type="hidden" name="id" value="<%=studentId%>">
        
        Name: <input type="text" name="name" value="<%=name%>"><br>
        Course: <input type="text" name="course" value="<%=course%>"><br>
        Email: <input type="text" name="email" value="<%=email%>"><br>
        Mobile: <input type="text" name="mobile" value="<%=mobile%>"><br>
        Password: <input type="text" name="password" value="<%=password%>"><br>
        <input type="submit" value="Update">
    </form>
    <% } else { %>
    <p>Student not found.</p>
    <% }
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>

</body>
</html>