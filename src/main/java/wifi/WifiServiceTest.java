package src.main.java.wifi;

import src.main.java.wifi.vo.History;
import src.main.java.wifi.vo.Row;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class WifiServiceTest {
    public static void main(String[] args) throws IOException, SQLException {

        //api 테스트
        ApiExplorer apiExplorer = new ApiExplorer();
        //WifiInfo wifiInfo = apiExplorer.apiExplorer();
        //int totalCnt = wifiInfo.getTbPublicWifiInfo().getList_total_count();

        //저장 및 조회 테스트
        WifiService wifiService = new WifiService();
        //wifiService.saveOpenApi();
        List<Row> nearWifi = wifiService.getNearWifi(37.5157702,126.9052383);
        for (int i = 0; i < nearWifi.size(); i++) {
            System.out.print(nearWifi.get(i).getX_SWIFI_MGR_NO());
            System.out.print(nearWifi.get(i).getX_SWIFI_WRDOFC());
            System.out.print(nearWifi.get(i).getX_SWIFI_MAIN_NM());
            System.out.println();
        }


        List<History> history = wifiService.getHistory();
        //history.isEmpty();
        //wifiService.saveHistory();


    }
}
