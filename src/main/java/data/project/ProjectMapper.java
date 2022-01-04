package data.project;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProjectMapper {
	public ProjectDTO getProject(int num);
	public List<ProjectDTO> getAllProject();
	
	public int getProjectMaxNum();
	
	public void insertNewProject(ProjectDTO dto);
	public void insertServicePurpose(ProjectDTO dto);
	public void insertEnvironment(ProjectDTO dto);
	public void insertFunctionDetail(ProjectDTO dto);
	public void insertMaintenance(ProjectDTO dto);
	
	public void updateServicePurpose(ProjectDTO dto);
}
