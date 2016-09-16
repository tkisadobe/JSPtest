<%--
  Created by IntelliJ IDEA.
  User: lihaiyan
  Date: 16/9/15
  Time: 下午4:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*, java.sql.*, com.mysql.jdbc.Driver" %>
<% String driverName="com.mysql.jdbc.Driver";
//    String userName="root";
//    String userPwd="student";
    String dbName="sample";
    String url="jdbc:mysql://localhost:3306/"+dbName;
            //+"? user" +userName+ "$password="+userPwd;
    try {
        Class.forName(driverName).newInstance();
    } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
        e.printStackTrace();
    }

   Class.forName(driverName).newInstance();
    Connection con=DriverManager.getConnection(url);
    Statement statement=con.createStatement();
    String sql="select * from customer";
    ResultSet rs= null;
    try {
        rs = statement.executeQuery(sql);
    } catch (SQLException e) {
        e.printStackTrace();
    }

%>
<!DOCTYPE HTML PUBLIC"-//W3C//DTD HTML 4.0.1 Transitional//EN">
<html>
  <head>
    <title>JSP连接数据库实例</title>
  </head>
  <body>
  <center>顾客信息如下<br><br>
      <table>
      <tr>
          <th>顾客ID</th>
          <th>联系地址</th>
          <th>联系方式</th>
      </tr>
      <% while(rs.next()){ %>
      <tr>
          <td><%=rs.getString("id") %></td>
          <td><%=rs.getString("address") %></td>
          <td><%=rs.getString("phone") %></td>
      </tr>
      <%}
          try {
          } catch (Exception e) {
          }
      %>
      </table>
  </center>
  </body>
</html>
<%
    con.close();
    statement.close();
    rs.close();
%>