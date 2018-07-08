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
<jsp:include page="mtop.jsp"/>

<body bgcolor="#ffffff">
<table class="table table-hover"  style="width: 300px; margin: 0 auto; font-size: 10px">
    <tr>
        <td height="38" align="center" colspan="5">������̬��Ϣ</td>
    </tr>
    <tr align="right">
        <td height="29" colspan="5"><a href="active_add.jsp">������̬��Ϣ</a></td>
    </tr>
    <tr>
        <td width="114" height="29" align="center">ID</td>
        <td width="277" height="29" align="center">����</td>
        <td width="108" height="29" align="center">����</td>
        <td width="186" height="29" align="center">��������</td>
        <td width="92" height="29" align="center">����</td>
    </tr>
    <%

        sql="select * from tb_logistics order by IssueDate desc ";
        try
        {
            rs=connection.executeQuery(sql);
            if(!rs.next())
            {
    %>
    <script language="javascript">
        alert("û�ж�̬��Ϣ");
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
        <td width="114" height="32" align="center"><%=code%></td>
        <td width="277" height="32" align="center"><%=rs.getString("Title")%></td>
        <td width="108" height="32" align="center"><%=rs.getString("Author")%></td>
        <td width="186" height="32" align="center"><%=rs.getDate("IssueDate")%></td>
        <td height="32" align="center">
            <a href="active_show.jsp?id=<%=code%>">�޸�</a>
            <a href="active_delete.jsp?id=<%=code%>">&nbsp;ɾ��</a></td>
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
                        ��<%=pagecount%>ҳ&nbsp;&nbsp;
                        <button type="button" class="btn btn-default">  <a href="active_select.jsp?topage=<%=1%>">��һҳ</a></button>&nbsp;&nbsp;
                        <a href="active_select.jsp?topage=<%=showpage-1%>">��һҳ</a>&nbsp;&nbsp;
                        <a href="active_select.jsp?topage=<%=showpage+1%>">��һҳ</a>&nbsp;&nbsp;
                        <button type="button" class="btn btn-default">  <a href="active_select.jsp?topage=<%=pagecount%>">���һҳ</a></button>&nbsp;&nbsp;

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
</table><jsp:include page="down.jsp"/>
</body>
</html>
