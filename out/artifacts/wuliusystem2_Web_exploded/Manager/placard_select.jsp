<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connection" scope="page" class="util.JDBConnection"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>
        placard page
    </title>
</head>
<%!
    ResultSet rs=null;
    String sql;
    int code;
    int pagesize=10;
    int rowcount=0;
    int pagecount=1;
%>

<body bgcolor="#ffffff"><jsp:include page="mtop.jsp"/>
<table class="table table-hover"  style="width: 300px; margin: 0 auto; font-size: 10px">
    <tr>
        <td height="38" align="center" colspan="5">网站公告信息</td>
    </tr>
    <tr>
        <td height="29" align="right" colspan="5">
            <a href="placard_add.jsp">发布公告信息</a></td>
    </tr>
    <tr>
        <td width="95" height="29" align="center">ID</td>
        <td width="186" height="29" align="center">标题</td>
        <td width="204" height="29" align="center">作者</td>
        <td width="158" height="29" align="center">发布日期</td>
        <td width="134" height="29" align="center">修改操作</td>
    </tr>
    <%

        sql="select ID,Title,Author,IssueDate from tb_Placard ";
        try
        {
            rs=connection.executeQuery(sql);
            if(!rs.next())
            {
    %>
    <script language="javascript">
        alert("没有公共信息");
        history.back();
    </script>
    <%
    }else
    {
        rs.last();
        rowcount=rs.getRow();
        int showpage=1;
        pagecount=((rowcount%pagesize)==0?(rowcount/pagesize):(rowcount/pagesize)+1);
        String topage=request.getParameter("topage");
        if(topage!=null)
        {
            showpage=Integer.parseInt(topage);
            if(showpage>pagecount){
                showpage=pagecount;
            }else if(showpage<=0){
                showpage=1;
            }
        }
        rs.absolute((showpage-1)*pagesize+1);
        for(int i=1;i<=pagesize;i++)
        {
            code=rs.getInt("ID");
    %>
    <tr>
        <td width="95" height="32" align="center"><%=code%></td>
        <td width="186" height="32" align="center"><%=rs.getString("Title")%></td>
        <td width="204" height="32" align="center"><%=rs.getString("Author")%></td>
        <td width="158" height="32" align="center"><%=rs.getDate("IssueDate")%></td>
        <td height="32" align="center">
            <a href="placard_change.jsp?id=<%=code%>">修改</a>&nbsp;
            <a href="placard_delete.jsp?id=<%=code%>">删除</a></td>
    </tr>
    <%
            if(!rs.next())
                break;
        }
    %>
    <tr>
        <td height="30" colspan="8" align="right">

            <table width="786" align="center">
                <tr>
                    <td width="786" height="30" colspan="9" align="right">
                        共<%=pagecount%>页&nbsp;&nbsp;
                        <a href="placard_select.jsp?topage=<%=1%>">第一页</a>&nbsp;&nbsp;
                        <a href="placard_select.jsp?topage=<%=showpage-1%>">上一页</a>&nbsp;&nbsp;
                        <a href="placard_select.jsp?topage=<%=showpage+1%>">下一页</a>&nbsp;&nbsp;
                        <a href="placard_select.jsp?topage=<%=pagecount%>">最后一页</a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <%
            }
        }catch(Exception e)
        {e.printStackTrace();}
    %>
</table>
<jsp:include page="down.jsp"/>
</body>
</html>
