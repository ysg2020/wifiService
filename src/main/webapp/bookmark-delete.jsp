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
<h2>북마크 삭제</h2>
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
        Bmk bmk = wifiService.getBmk(id);
%>
<p>북마크를 삭제하시겠습니까?</p>
<form action="bookmark-delete-submit.jsp" method="POST">
    <input type="hidden" name = "id"  value="<%=id%>">
    <table>
        <tr>
            <td>북마크 이름</td>
            <td><%=bmk.getBMK_NM()%></td>
        </tr>
        <tr>
            <td>와이파이명</td>
            <td><%=bmk.getMAIN_NM()%></td>
        </tr>
        <tr>
            <td>등록일자</td>
            <td><%=bmk.getADD_DTTM()%></td>
        </tr>
        <tr>
            <td colspan="2" align = "center"><a href="bookmark-list.jsp">돌아가기</a><input type="submit" value="삭제"></td>
        </tr>
    </table>
</form>
</body>
</html>