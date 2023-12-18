package src.main.wifi;

import src.main.wifi.vo.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class WifiService {
    ApiExplorer apiExplorer = new ApiExplorer();
    SQLiteManager sqLiteManager = new SQLiteManager();

    //Open API 와이파이 정보 가져오기 (저장)
    public void saveOpenApi() throws IOException, SQLException {
        int start = 1;
        int end = 1000;
        int totalCnt = apiExplorer.apiExplorer().getTbPublicWifiInfo().getList_total_count();
        for (int i = 0; i < (totalCnt / 1000) + 1; i++) {
            WifiInfo wifiInfo = apiExplorer.apiExplorer(String.valueOf(start), String.valueOf(end));
            sqLiteManager.saveWifiInfo(wifiInfo);
            start +=1000;
            end += 1000;
        }
    }

    //근처 WIFI 정보 조회
    public List<Row> getNearWifi(double lnt, double lat) throws SQLException {
        return sqLiteManager.getWifiInfo(lnt, lat);
    }

    //위치 히스토리 목록 조회
    public List<History> getHistory() throws SQLException {
        return sqLiteManager.getHistory();
    }

    //위치 히스토리 추가
    public void saveHistory(double lnt , double lat) throws SQLException {
        sqLiteManager.saveHistory(lnt , lat);
    }

    //위치 히스토리 삭제
    public void removeHistory(int id) throws SQLException {
        sqLiteManager.removeHistory(id);
    }

    //와이파이 상세 정보 조회
    public Row getWifiInfoDtl(String mgrNo) throws SQLException {
        return sqLiteManager.getWifiInfoDtl(mgrNo);
    }

    //북마크 그룹 전체 조회
    public List<BmkGrp> getBmkGrps() throws SQLException {
        return sqLiteManager.getBmkGrps();
    }

    //북마크 그룹 단건 조회
    public BmkGrp getBmkGrp(int id) throws SQLException {
        return sqLiteManager.getBmkGrp(id);
    }

    //북마크 그룹 추가
    public void saveBmkGrp(String bmk_nm ,int soon) throws SQLException {
        sqLiteManager.saveBmkGrp(bmk_nm,soon);
    }

    //북마크 그룹 수정
    public void editBmkGrp(String bmk_nm ,int soon, int id) throws SQLException {
        sqLiteManager.editBmkGrp(bmk_nm,soon,id);
    }

    //북마크 그룹 삭제
    public void removeBmkGrp(int id) throws SQLException {
        sqLiteManager.removeBmkGrp(id);
    }

    //북마크 전체 조회
    public List<Bmk> getBmks() throws SQLException {
        return sqLiteManager.getBmks();
    }

    //북마크 단건 조회
    public Bmk getBmk(int id) throws SQLException {
        return sqLiteManager.getBmk(id);
    }

    //북마크 추가
    public void saveBmk(String bmk_nm, String main_nm) throws SQLException {
        sqLiteManager.saveBmk(bmk_nm, main_nm);
    }

    //북마크 삭제
    public void removeBmk(int id) throws SQLException {
        sqLiteManager.removeBmk(id);
    }
}
