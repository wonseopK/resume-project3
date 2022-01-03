package data.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectService {
	@Autowired
	ProjectMapper projectMapper;
	
	public List<ProjectDTO> getAllProject(){
		return projectMapper.getAllProject();
	}
	public ProjectDTO getProject(int num){
		return projectMapper.getProject(num);
	}
	
	
	public void insertNewProject(ProjectDTO dto) {
		projectMapper.insertNewProject(dto);
	}
}
