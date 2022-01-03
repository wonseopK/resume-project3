package data.project;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("projectDTO")
public class ProjectDTO {
	private int num;
	private String project_title;
	private String main_image;
	private String service;
	private String environment;
	private String function_detail;
	private String maintenance;
	private String code_link;
	private Timestamp write_day;
	private MultipartFile upload;
}
