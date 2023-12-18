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
        double lat = 0;
        double lng = 0;

        WifiService wifiService = new WifiService();

        if(request.getParameter("lat") != null && request.getParameter("lng") != null){
            lat = Double.parseDouble(request.getParameter("lat"));
            lng = Double.parseDouble(request.getParameter("lng"));
            wifiService.saveHistory(lat,lng);

        }

        List<Row> nearWifi = wifiService.getNearWifi(lat,lng);

%>
    <a href = "http://localhost:8080/">홈</a>
    <a href = "http://localhost:8080/history.jsp">위치 히스토리 목록</a>
    <a href = "http://localhost:8080/load-wifi.jsp">Open API 와이파이 정보 가져오기</a>
    <a href = "http://localhost:8080/bookmark-list.jsp">북마크 보기</a>
    <a href = "http://localhost:8080/bookmark-group.jsp">북마크 그룹 관리</a>
    <br>
    <label>LAT: </label>
    <input type="text"  id="my_lat">
    <label>LNT: </label>
    <input type="text"  id="my_lng">
    <input type="button" value="내 위치 가져오기" onclick="myPosition()">
    <input type="button" value="근처 WIFI 정보 보기" onclick="getNearWIFI()">

    <table>
        <tr>
            <td>거리(Km)</td>
            <td>관리번호</td>
            <td>자치구</td>
            <td>와이파이명</td>
            <td>도로명주소</td>
            <td>상세주소</td>
            <td>설치위치(층)</td>
            <td>설치유형</td>
            <td>설치기관</td>
            <td>서비스구분</td>
            <td>망종류</td>
            <td>설치년도</td>
            <td>실내외구분</td>
            <td>WIFI접속환경</td>
            <td>X좌표</td>
            <td>Y좌표</td>
            <td>작업일자</td>
        </tr>
        <%
            if(lat != 0 && lng != 0){
                for(Row row : nearWifi){
        %>
            <tr>
                <td><%=row.getDISTANCE()%></td>
                <td><%=row.getX_SWIFI_MGR_NO()%></td>
                <td><%=row.getX_SWIFI_WRDOFC()%></td>
                <td><a href="detail.jsp?mgrNo=<%=row.getX_SWIFI_MGR_NO()%>&distance=<%=row.getDISTANCE()%>"><%=row.getX_SWIFI_MAIN_NM()%></a></td>
                <td><%=row.getX_SWIFI_ADRES1()%></td>
                <td><%=row.getX_SWIFI_ADRES2()%></td>
                <td><%=row.getX_SWIFI_INSTL_FLOOR()%></td>
                <td><%=row.getX_SWIFI_INSTL_TY()%></td>
                <td><%=row.getX_SWIFI_INSTL_MBY()%></td>
                <td><%=row.getX_SWIFI_SVC_SE()%></td>
                <td><%=row.getX_SWIFI_CMCWR()%></td>
                <td><%=row.getX_SWIFI_CNSTC_YEAR()%></td>
                <td><%=row.getX_SWIFI_INOUT_DOOR()%></td>
                <td><%=row.getX_SWIFI_REMARS3()%></td>
                <td><%=row.getLNT()%></td>
                <td><%=row.getLAT()%></td>
                <td><%=row.getWORK_DTTM()%></td>
            </tr>
        <%
                }
            }else{
        %>
            <tr>
                <td colspan="17" align = "center"> 위치 정보를 입력한 후에 조회해 주세요.</td>
            </tr>
        <%
            }
        %>
    </table>
</body>
</html>
<script>

// 현재 위치 가져오기
function myPosition() {
    navigator.geolocation.getCurrentPosition(getSuccess, getError);

}

// 가져오기 성공
function getSuccess(position) {
  // 위도
  const lat = position.coords.latitude;
  // 경도
  const lng = position.coords.longitude;
  // 위도 경도 오차(m)
  const accuracy = Math.floor(position.coords.accuracy);
  console.log(position);
  console.log("위도 :"+lat);
  console.log("경도 :"+lng);
  document.getElementById("my_lat").value = lat
  document.getElementById("my_lng").value = lng
}

// 가지오기 실패(거부)
function getError() {
  alert('Geolocation Error');
}

function getNearWIFI() {
  const lat = document.getElementById("my_lat").value;
  const lng = document.getElementById("my_lng").value;
  location.href="http://localhost:8080/?lat="+lat+"&lng="+lng;
}

</script>
