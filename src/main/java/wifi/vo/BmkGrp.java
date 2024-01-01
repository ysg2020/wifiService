package src.main.java.wifi.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BmkGrp {

    int ID; //아이디
    String BMK_NM; //북마크 이름
    int SOON; //순서
    String ADD_DTTM; //등록일자
    String EDIT_DTTM; //수정일자
}
