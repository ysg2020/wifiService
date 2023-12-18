<%@ page import = "src.main.wifi.*" %>
<%@ page import = "src.main.wifi.vo.*" %>
<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head>
    <style>
        table {
            width: 100%;
        }
        th, td {
            border:solid 1px #000;
        }
    </style>
</head>
<body>
<h2>북마크 그룹 삭제</h2>
<a href = "http://localhost:8080/">홈</a>
<a href = "http://localhost:8080/history.jsp">위치 히스토리 목록</a>
<a href = "http://localhost:8080/load-wifi.jsp">Open API 와이파이 정보 가져오기</a>
<a href = "http://localhost:8080/bookmark-list.jsp">북마크 보기</a>
<a href = "http://localhost:8080/bookmark-group.jsp">북마크 그룹 관리</a>

<%
        int id = 0;
        if(request.getParameter("id") != null){
            id = Integer.parseInt(request.getParameter("id"));
        }
        WifiService wifiService = new WifiService();
        BmkGrp bmkGrp = wifiService.getBmkGrp(id);
%>
<form action="bookmark-group-delete-submit.jsp" method="POST">
    <table>
        <tr>
            <td>북마크 이름</td>
            <td><input type="text" name="bmk_nm" value="<%=bmkGrp.getBMK_NM()%>"></td>
        </tr>
        <tr>
            <td>순서</td>
            <td><input type="text" name="soon" value="<%=bmkGrp.getSOON()%>"></td>
        </tr>
    </table>
    <input type="hidden" name = "id"  value="<%=id%>">
    <input type="submit" value="삭제">
</form>



</body>
</html>