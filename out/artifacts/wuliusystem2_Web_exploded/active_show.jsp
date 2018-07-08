<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connection" scope="page" class="util.JDBConnection"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link rel="stylesheet" href="CSS/style.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title></title>
</head>
<%!
    String sql;
    ResultSet rs=null;
    int code;
%>
<body>
<table class="table table-hover"  style="width: 300px; margin: 0 auto; font-size: 10px" >
    <tr>
        <td width="100%" height="39" align="center">动态信息</td>
    </tr>
    <%
        sql="select * from tb_logistics where ID="+request.getParameter("id");
        try
        {
            rs=connection.executeQuery(sql);
            if(rs.next())
            {
                code=rs.getInt("ID");
    %>
    <tr>
        <td width="100%" height="37">标题：
            <%=rs.getString("Title")%></td>
    </tr>
    <tr>
        <td width="100%" height="36">
   <textarea rows="20" name="content" cols="100">
   <%=rs.getString("Content")%></textarea></td>
    </tr>
    <tr>
        <td width="100%" height="27">发布人:
            <%=rs.getString("Author")%></td>
    </tr>
    <tr>
        <td width="100%" height="27">发布时间:
            <%=rs.getDate("IssueDate")%></td>
    </tr>
    <tr>
        <td width="100%" height="27">文章号:
            <%=code%></td>
    </tr>
    <%
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    %>
    <tr><td width="100%" height="20" align="center">
        <input type="button"onClick="window.close()" value="关闭窗口">
    </td>
    </tr>
</table>
</body>
</html>
