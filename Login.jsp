<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Lib MANAGER</title>
<style> 
body{
margin:0;
padding:0;
background:url(http://www.screadiness.org/wp-content/uploads/2020/06/free-book-library.jpg);
background-size:cover;
font-family:sans-serify;

}
input[type=text],input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 2px solid blue;
  border-radius: 4px;
}
 input[type=submit], input[type=reset] {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
</head>
<body>
<% 
if ("POST".equalsIgnoreCase(request.getMethod())) {
    // Form was submitted and write code for evaluation of form.
    String uname=request.getParameter("username");
    String pwd=request.getParameter("password");
    		
    		try{
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ e_lib","root","root");
    			PreparedStatement stmt=con.prepareStatement("select * from user where user_name =? and password=?" );
    			stmt.setString(1,uname);
    			stmt.setString(2,pwd);
    			
    			ResultSet rs=stmt.executeQuery();
    			if(rs.next()){
    				//out.println("<h1><center>Valid User, logged in successfully!!</center><h1>");
    			//	out.println("<h3><center>Username is "+rs.getString("user_name"));
    				//out.println("UserType is "+rs.getInt("user_type")+"</center></h3>");
    				session.setAttribute("um", uname);
    				session.setAttribute("ut", rs.getInt("user_type"));
    				
    				response.sendRedirect("userHome.jsp");
    				
    			}else{
    				out.println("<center><b>Invalid Credentials!! Try Again..</b></center>");
    			}
    		}catch(Exception e){
    			out.println(e.toString());
    		}
    		
} else {
	%>
	
	
	<div align ="center">

 
<form action="Login.jsp" onsubmit="return validateForm()" method="post">

<table>
<h1>E-Library</h1>
<tr>
<td>
<font>USERID:</font>
<input type="text" name ="username" placeholder="username" required >

</tr>
<tr>
<td>
<font>PASSWORD:</font>
<input type="password" name ="password" placeholder="**********"required>
<br>
</tr>


 
<tr></tr><tr><td>
<input type="submit" value ="Login  ">
<input type="reset" value ="Cancel">
</tr>



</table>

</form>

</div>


<% } %>


</body>
</html>