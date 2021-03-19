package pet.member.vo;
import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class FollowVO {
	private int follow_number;
	private int member_number;
	private int target_member_number;
	private Date follow_date;
}