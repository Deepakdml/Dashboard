<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.sql.*,jakarta.servlet.http.HttpServlet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RK Dashboard</title>
<style>
h2{
	color: #fff;
}
.bar{
	color : #fff;
}

.eu {
    display: inline-block;
    padding: 8px 16px;
    margin: 4px;
    border: 1px solid #333;
    border-radius: 4px;
    background-color: #ba2cf2;
    color: #fff;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
}

.eu:hover {
    background-color: #555;
}
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}


header {
    background-color: #ba2cf2;
    color: #fff;
    padding: 10px 20px;
    text-align: center;
}

nav {
    background-color: #333;
    color: #fff;
    padding: 10px;
}

.sidebar {
    background-color: #ba2cf2;
    color: #fff;
    width: 200px;
    padding: 20px;
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    overflow-y: auto;
}

.main-content {
    margin-left: 250px;
    padding: 20px;
}

.widget {
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    padding: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #ba2cf2;
    color : #fff;
}

a {
    color: #fff;
    text-decoration: none;
}

a:hover {
    color: #000;
    text-decoration: underline;
}
</style>
<script>

function showPopup(email) {
    alert("Registered successfully! Welcome, " + email + "!");
}
</script>
</head>
<body>
    <header>
        <h1>Admin Dashboard</h1>
        <h1>
            Welcome <%=request.getParameter("email")%>!
        </h1>
    </header>
    <!-- <nav>
        <ul>
            <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="#"><i class="fas fa-chart-bar"></i> Analytics</a></li>
            <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
            Add more navigation links as needed
        </ul>
    </nav> -->
    <div class="sidebar">
        <h2>Nav Bar</h2>
        <ul class="bar">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Register</a></li>
            <li><a href="#">Show All</a></li>
            <li><a href="#">Admin</a></li>
            
        </ul>
    </div>
    <div class="main-content">
        <div class="widget">
            <h2>Student Details</h2>
            <table>
                <thead>
                    <tr>
                        <th>StdId</th>
                        <th>Name</th>
                        <th>Course</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Password</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
                            String sql = "select * from log";
                            PreparedStatement pst = con.prepareStatement(sql);
                            ResultSet rs = pst.executeQuery();
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%=rs.getInt("id")%></td>
                            <td><%=rs.getString("name")%></td>
                             <td><%=rs.getString("course")%></td>
                            <td><%=rs.getString("email")%></td>
                            <td><%=rs.getString("mobile")%></td>
                            <td><%=rs.getString("password")%></td>
                            <td><a class="eu" href="edit.jsp?id=<%=rs.getInt("id")%>">Edit</a></td>
                            <td><a class="eu" href="delete.jsp?id=<%=rs.getInt("id")%>">Delete</a></td>
                        </tr>
                        <% } } catch (Exception e) { e.printStackTrace(); }  %>
                </tbody>
            </table>
        </div>
        
    </div>
    
    <script>
        showPopup("<%=request.getParameter("email")%>");
    </script>
</body>
</html>