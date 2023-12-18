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
<h2>북마크 그룹</h2>
    <a href = "http://localhost:8080/">홈</a>
    <a href = "http://localhost:8080/history.jsp">위치 히스토리 목록</a>
    <a href = "http://localhost:8080/load-wifi.jsp">Open API 와이파이 정보 가져오기</a>
    <a href = "http://localhost:8080/bookmark-list.jsp">북마크 보기</a>
    <a href = "http://localhost:8080/bookmark-group.jsp">북마크 그룹 관리</a>
    <br>
    <input type="button" value="북마크 그룹 이름 추가" onclick="addBookmark()">
<%
        WifiService wifiService = new WifiService();
        List<BmkGrp> bmkGrps = wifiService.getBmkGrps();

%>

<table>
        <tr>
            <td>ID</td>
            <td>북마크 이름</td>
            <td>순서</td>
            <td>등록일자</td>
            <td>수정일자</td>
            <td>비고</td>
        </tr>
        <%
            if(!bmkGrps.isEmpty()){
                for(BmkGrp bmkGrp : bmkGrps){
        %>
            <tr>
                    <td><%=bmkGrp.getID()%></td>
                    <td><%=bmkGrp.getBMK_NM()%></td>
                    <td><%=bmkGrp.getSOON()%></td>
                    <td><%=bmkGrp.getADD_DTTM()%></td>
                    <td><%=bmkGrp.getEDIT_DTTM()%></td>
                    <td><a href="/bookmark-group-edit.jsp?id=<%=bmkGrp.getID()%>">수정</a> <a href="/bookmark-group-delete.jsp?id=<%=bmkGrp.getID()%>">삭제</a></td>

            </tr>

        <%
                }
            }else{
        %>
            <tr>
                <td colspan='17' align = 'center'> 북마크 그룹이 없습니다.</td>
            </tr>
        <%
            }
        %>
    </table>
<a href="http://localhost:8080/"/>홈 으로 가기</a>

</body>
</html>
<script>
function addBookmark() {
    location.href = "http://localhost:8080/bookmark-group-add.jsp";
}

</script>