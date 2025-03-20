package edu.du.sb0320.dto;

import com.fasterxml.jackson.annotation.JsonTypeId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder            //생성할 때 사용
@AllArgsConstructor //생성자 - 모든 괄호안에 아무것도 없는 아규먼트들을 생성해줌.
@NoArgsConstructor  //
public class SampleDTO {

    private Long id;
    private String name;
    private Long age;
}
