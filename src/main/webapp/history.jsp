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
<h2>위치 히스토리 목록</h2>

<%
        WifiService wifiService = new WifiService();
        List<History> histories = wifiService.getHistory();

%>

<table>
        <tr>
            <td>ID</td>
            <td>X좌표</td>
            <td>Y좌표</td>
            <td>조회일자</td>
            <td>비고</td>
        </tr>
        <%
            if(!histories.isEmpty()){
                for(History history : histories){
        %>
            <tr>
                    <td><%=history.getID()%></td>
                    <td><%=history.getLNT()%></td>
                    <td><%=history.getLAT()%></td>
                    <td><%=history.getWORK_DTTM()%></td>
                    <td><input type="button" value="삭제" onclick="removeHistory(<%=history.getID()%>)"></td>
            </tr>

        <%
                }
            }else{
        %>
            <tr>
                <td colspan='17' align = 'center'> 위치 히스토리가 없습니다.</td>
            </tr>
        <%
            }
        %>
    </table>
<a href="http://localhost:8080/"/>홈 으로 가기</a>

</body>
</html>
<script>
function removeHistory(id){
    location.href = "/history-delete.jsp?id="+id;
}
</script>