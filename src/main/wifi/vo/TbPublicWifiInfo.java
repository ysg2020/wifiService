package src.main.wifi.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class TbPublicWifiInfo {
    int  list_total_count;
    Result RESULT;
    List<Row> row;

}
