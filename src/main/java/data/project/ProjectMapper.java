package data.project;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProjectMapper {
	public ProjectDTO getProject(int num);
	public List<ProjectDTO> getAllProject();
	
	public void insertNewProject(ProjectDTO dto);
}
