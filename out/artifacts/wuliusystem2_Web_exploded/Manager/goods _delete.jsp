<%@ page contentType="text/html; charset=GBK"%>
<jsp:useBean id="connection" scope="page" class="util.JDBConnection"/>
<html>
<head>
    <title>
        Goods_delete page
    </title>
</head>
<body bgcolor="#ffffff">
<%
    String sql="delete tb_GoodsMeg where ID="+request.getParameter("id");
    boolean dele=connection.executeUpdata(sql);
    if(dele)
    {
%>
<script language="javascript">
    alert("ɾ���ɹ�������");
</script>
<%
    response.sendRedirect("goods_select.jsp");
}else{%>
<script language="javascript">
    alert("ɾ��ʧ�ܣ�����");
    history.back();
</script>
<%
    }
%>
</body>
</html>
