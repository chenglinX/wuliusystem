<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<jsp:useBean id="connection" scope="page" class="util.JDBConnection"/>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>
        Goods_xiangxi page

    </title>
</head>
<%!
    ResultSet rs=null;
    String sql;
        String code,userName;
        String username,login;
    int num;
%>

<body bgcolor="#ffffff">
<%
    code=request.getParameter("id");
    sql="select * from tb_Enterprise where ID="+code;

    login=(String)session.getAttribute("login");
    username=(String)session.getAttribute("name");
    if(login==null)
    {
%>
<script language="javascript">
    alert("您还未登录，不能浏览详细信息！！！");
    <%
    response.sendRedirect("login.jsp");
    %>
</script>
<%}
%>
<jsp:include page="mtop.jsp"/>
<table class="table table-hover"  style="width: 800px; margin: 0 auto; font-size: 10px" >
    <tr>
        <td width="100%" height="52" colspan="4" align="center">
            企业详细信息</td>
    </tr>
    <%try
    {
        rs=connection.executeQuery(sql);
        if(rs.next())
        {
    %>
    <tr>
        <td width="17%" height="29" align="center">企业类别：</td>
        <td width="36%" height="29" align="center"><%=rs.getString("EnterpriseSort")%></td>
        <td width="17%" height="29" align="center" valign="middle">企业名称：</td>
        <td width="30%" height="29" align="center"><%=rs.getString("EnterpriseName")%></td>
    </tr>
    <tr>
        <td width="17%" height="29" align="center">经营范围：</td>
        <td width="36%" height="29" align="center"><%=rs.getString("Operation")%> </td>
        <td width="17%" height="29" align="center" valign="middle">所属区域：</td>
        <td width="30%" height="29" align="center">  <%=rs.getString("WorkArea")%></td>
    </tr>
    <tr>
        <td width="17%" height="29" align="center">地址：</td>
        <td width="36%" height="29" align="center"><%=rs.getString("Address")%></td>
        <td width="17%" height="29" align="center" valign="middle">公司电话：</td>
        <td width="30%" height="29" align="center"><%=rs.getString("Phone")%></td>
    </tr>
    <tr>
        <td width="17%" height="29" align="center">公司联系人：</td>
        <td width="36%" height="29" align="center"><%=rs.getString("LinkMan")%></td>
        <td width="17%" height="29" align="center" valign="middle">公司邮箱：</td>
        <td width="30%" height="29" align="center"><%=rs.getString("Email")%></td>
    </tr>
    <tr>
        <td width="17%" height="30" align="center">发布时间：</td>
        <td width="36%" height="30" align="center"> <%=rs.getString("IssueDate")%></td>
        <td width="17%" height="30" align="center" valign="middle">发布人：</td>
        <td width="30%" height="30" align="center"> <%=rs.getString("UserName")%></td>
    </tr>
    <tr>
        <%
            userName=rs.getString("UserName");
        %>
        <td width="17%" height="31" align="center">发布人：</td>
        <td width="36%" height="31" align="left" colspan="3"><%=userName%></td>

    </tr>
    <%
        if(userName.equals(username))
        {
    %>
    <tr>
        <td width="100%" height="45" colspan="4" align="center">
            <button type="button" class="btn btn-default"> <a href="goods_change.jsp?id=<%=code%>">修改</a> </button>&nbsp;&nbsp;
            <button type="button" class="btn btn-default"> <a href="goods_delete.jsp?id=<%=code%>">删除</a></button></td>
    </tr>

    <%
                }

            }

        }catch(SQLException e)
        {
            System.out.print("查询异常！！");
        }

    %>
</table>
</body>
</html>
