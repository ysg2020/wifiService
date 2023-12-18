<%@ page import = "src.main.wifi.*" %>
<%@ page import = "src.main.wifi.vo.*" %>
<%@ page import = "java.util.List" %>
<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<body>

<%
    ApiExplorer apiExplorer = new ApiExplorer();
    WifiInfo wifiInfo = apiExplorer.apiExplorer();
    int totalCnt = wifiInfo.getTbPublicWifiInfo().getList_total_count();
%>
<h2><%=totalCnt%>개의 WIFI 정보를 정상적으로 저장하였습니다.</h2>

<%
        WifiService wifiService = new WifiService();
        wifiService.saveOpenApi();

%>
<a href="http://localhost:8080/"/>홈 으로 가기</a>

</body>
</html>