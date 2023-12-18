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
<h2>와이파이 정보 구하기</h2>

<%
        String mgrNo = "";
        String distance = "";
        WifiService wifiService = new WifiService();

        if(request.getParameter("mgrNo") != null){
            mgrNo = request.getParameter("mgrNo");
            distance = request.getParameter("distance");

        }

        Row row = wifiService.getWifiInfoDtl(mgrNo);
        List<BmkGrp> bmkGrps = wifiService.getBmkGrps();

%>
    <a href = "http://localhost:8080/">홈</a>
    <a href = "http://localhost:8080/history.jsp">위치 히스토리 목록</a>
    <a href = "http://localhost:8080/load-wifi.jsp">Open API 와이파이 정보 가져오기</a>
    <a href = "http://localhost:8080/bookmark-list.jsp">북마크 보기</a>
    <a href = "http://localhost:8080/bookmark-group.jsp">북마크 그룹 관리</a>
    <br>
    <form action="/bookmark-add-submit.jsp" method="POST">
      <select name="bmk_nm">
        <option value="none" selected>북마크 그룹 이름 선택</option>
        <% for(BmkGrp bmkGrp : bmkGrps){ %>
            <option value="<%=bmkGrp.getBMK_NM()%>"><%=bmkGrp.getBMK_NM()%></option>
        <% } %>
      </select>
      <input type="hidden" name = "main_nm" value="<%=row.getX_SWIFI_MAIN_NM()%>">
      <input type="submit" value="북마크 추가하기">
    </form>

    <table>
        <tr>
            <td>거리</td>
            <td><%=distance%></td>
        </tr>
        <tr>
            <td>관리번호</td>
            <td><%=row.getX_SWIFI_MGR_NO()%></td>
        </tr>
        <tr>
            <td>자치구</td>
            <td><%=row.getX_SWIFI_WRDOFC()%></td>
        </tr>
        <tr>
            <td>와이파이명</td>
            <td><a href="detail.jsp?mgrNo=<%=row.getX_SWIFI_MGR_NO()%>"><%=row.getX_SWIFI_MAIN_NM()%></a></td>
        </tr>
        <tr>
            <td>도로명주소</td>
            <td><%=row.getX_SWIFI_ADRES1()%></td>
        </tr>
        <tr>
            <td>상세주소</td>
            <td><%=row.getX_SWIFI_ADRES2()%></td>
        </tr>
        <tr>
            <td>설치위치(층)</td>
            <td><%=row.getX_SWIFI_INSTL_FLOOR()%></td>
        </tr>
        <tr>
            <td>설치유형</td>
            <td><%=row.getX_SWIFI_INSTL_TY()%></td>
        </tr>
        <tr>
            <td>설치기관</td>
            <td><%=row.getX_SWIFI_INSTL_MBY()%></td>
        </tr>
        <tr>
            <td>서비스구분</td>
            <td><%=row.getX_SWIFI_SVC_SE()%></td>
        </tr>
        <tr>
            <td>망종류</td>
            <td><%=row.getX_SWIFI_CMCWR()%></td>
        </tr>
        <tr>
            <td>설치년도</td>
            <td><%=row.getX_SWIFI_CNSTC_YEAR()%></td>
        </tr>
        <tr>
            <td>실내외구분</td>
            <td><%=row.getX_SWIFI_INOUT_DOOR()%></td>
        </tr>
        <tr>
            <td>WIFI접속환경</td>
            <td><%=row.getX_SWIFI_REMARS3()%></td>
        </tr>
        <tr>
            <td>X좌표</td>
            <td><%=row.getLNT()%></td>
        </tr>
        <tr>
            <td>Y좌표</td>
            <td><%=row.getLAT()%></td>
        </tr>
        <tr>
            <td>작업일자</td>
            <td><%=row.getWORK_DTTM()%></td>
        </tr>
    </table>
</body>
</html>