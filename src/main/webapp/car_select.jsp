<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<jsp:useBean id="connection" scope="page" class="util.JDBConnection"/>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="CSS/style.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>
        Goods_show page
    </title>
</head>
<%!
    ResultSet rs=null;
        String sql,sqlshow;
        String username,login;
    int pagesize=10;
    int rowcount=0;
        int pagecount=1,n;
%>
<body bgcolor="#ffffff">
<%
    login=(String)session.getAttribute("login");
    username=(String)session.getAttribute("name");
    if(login==null)
    {
%>
<script language="javascript">
    alert("����δ��¼�����������ϸ��Ϣ������");
</script>
<%
        response.sendRedirect("login.jsp");
    }
%>   <jsp:include page="top.jsp"/>
<table class="table table-hover"  style="width: 300px; margin: 0 auto; font-size: 10px">
    <tr>
        <td width="786" colspan="9">

            <p align="center">������Ϣ
        </td>
    </tr>
    <tr>
        <td width="786" height="30" colspan="9" align="right"><a href="car_add.jsp">������Ϣ...</a></td>
    </tr>
    <tr align="center">
        <td align="center">���ƺ���</td>
        <td align="center">����Ʒ��</td>
        <td align="center">����</td>
        <td align="center">��������</td>
        <td align="center">��ʹ��</td>
        <td align="center">��ʻԱ����</td>
        <td align="center">��������</td>
        <td width="786" height="29">����</td>
    </tr>
    <%
        sql="select * from tb_CarMessage order by IssueDate desc";
        try
        {
            rs=connection.executeQuery(sql);
            if(!rs.next())
            {
    %>
    <script language="javascript">
        alert("û�л�����Ϣ");
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
            n=rs.getInt("Code");
    %>
    <tr>
        <td width="786" height="29" align="center"><%=rs.getString("Code")%></td>
        <td width="786" height="29" align="center"><%=rs.getString("TradeMark")%></td>
        <td width="786" height="29" align="center"><%=rs.getString("Brand")%></td>
        <td width="786" height="29" align="center"><%=rs.getString("CarLoad")%></td>
        <td width="786" height="29" align="center"><%=rs.getString("UsedTime")%></td>
        <td width="786" height="29" align="center"><%=rs.getString("TranspotStyle")%></td>
        <td width="786" height="29" align="center"><%=rs.getString("Brand")%></td>
        <td width="786" height="29"> <p align="center">
            <a href="car_xiangxi.jsp?Code=<%=n%>">��ϸ</a></td>
    </tr>
    <%
            if(!rs.next())
                break;
        }
    %>
    <tr>
        <td width="786" height="30" colspan="9" align="right">

            <table width="786" align="center">
                <tr>
                    <td width="786" height="30" colspan="9" align="right">
                        ��<%=pagecount%>ҳ&nbsp;&nbsp;
                        <button type="button" class="btn btn-default"><a href="car_select.jsp?topage=<%=1%>">��һҳ</a></button>  &nbsp;&nbsp;
                        <a href="car_select.jsp?topage=<%=showpage-1%>">��һҳ</a>&nbsp;&nbsp;
                        <a href="car_select.jsp?topage=<%=showpage+1%>">��һҳ</a>&nbsp;&nbsp;
                        <button type="button" class="btn btn-default"><a href="car_select.jsp?topage=<%=pagecount%>">���һҳ</a></button>
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
</body>
</html>
