package data.project;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProjectMapper {
	//프로젝트 가져오기
	public ProjectDTO getProject(int num);
	public List<ProjectDTO> getAllProject(int start, int perPage);
	
	//프로젝트 이미지 이름 얻기
	public String getMainImage(int num);
	
	//프로젝트 총 갯수
	public int getTotalProject();
	
	//프로젝트 num 최댓값
	public int getProjectMaxNum();
	
	//프로젝트 등록
	public void insertNewProject(ProjectDTO dto);
	public void insertServicePurpose(ProjectDTO dto);
	public void insertEnvironment(ProjectDTO dto);
	public void insertFunctionDetail(ProjectDTO dto);
	public void insertMaintenance(ProjectDTO dto);
	
	//프로젝트 수정
	public void updateProject(ProjectDTO dto);
	public void updateService(ProjectDTO dto);
	public void updateEnvironment(ProjectDTO dto);
	public void updateFunctionDetail(ProjectDTO dto);
	public void updateMaintenance(ProjectDTO dto);
	
	//프로젝트 제거
	public void deleteProject(int num);
	
	
	
}
