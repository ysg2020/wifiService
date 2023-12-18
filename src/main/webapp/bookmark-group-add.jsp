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
<h2>북마크 그룹 추가</h2>
<a href = "http://localhost:8080/">홈</a>
<a href = "http://localhost:8080/history.jsp">위치 히스토리 목록</a>
<a href = "http://localhost:8080/load-wifi.jsp">Open API 와이파이 정보 가져오기</a>
<a href = "http://localhost:8080/bookmark-list.jsp">북마크 보기</a>
<a href = "http://localhost:8080/bookmark-group.jsp">북마크 그룹 관리</a>
<form action="bookmark-group-add-submit.jsp" method="POST">
    <table>
        <tr>
            <td>북마크 이름</td>
            <td><input type="text" name="bmk_nm"></td>
        </tr>
        <tr>
            <td>순서</td>
            <td><input type="text" name="soon"></td>
        </tr>
    </table>
    <input type="submit" value="추가">
</form>



</body>
</html>