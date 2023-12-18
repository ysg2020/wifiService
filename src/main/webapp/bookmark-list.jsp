<%@ page import = "src.main.wifi.*" %>
<%@ page import = "src.main.wifi.vo.*" %>
<%@ page import = "java.util.List" %>
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
<h2>북마크 목록</h2>
    <a href = "http://localhost:8080/">홈</a>
    <a href = "http://localhost:8080/history.jsp">위치 히스토리 목록</a>
    <a href = "http://localhost:8080/load-wifi.jsp">Open API 와이파이 정보 가져오기</a>
    <a href = "http://localhost:8080/bookmark-list.jsp">북마크 보기</a>
    <a href = "http://localhost:8080/bookmark-group.jsp">북마크 그룹 관리</a>
    <br>
<%
        WifiService wifiService = new WifiService();
        List<Bmk> bmks = wifiService.getBmks();

%>

<table>
        <tr>
            <td>ID</td>
            <td>북마크 이름</td>
            <td>와이파이명</td>
            <td>등록일자</td>
            <td>비고</td>
        </tr>
        <%
            if(!bmks.isEmpty()){
                for(Bmk bmk : bmks){
        %>
            <tr>
                    <td><%=bmk.getID()%></td>
                    <td><%=bmk.getBMK_NM()%></td>
                    <td><%=bmk.getMAIN_NM()%></td>
                    <td><%=bmk.getADD_DTTM()%></td>
                    <td><a href="/bookmark-delete.jsp?id=<%=bmk.getID()%>">삭제</a></td>

            </tr>

        <%
                }
            }else{
        %>
            <tr>
                <td colspan='17' align = 'center'> 북마크가 없습니다.</td>
            </tr>
        <%
            }
        %>
    </table>
<a href="http://localhost:8080/"/>홈 으로 가기</a>

</body>
</html>