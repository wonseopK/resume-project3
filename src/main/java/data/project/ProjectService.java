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
	public void insertServicePurpose(ProjectDTO dto) {
		dto.setNum(projectMapper.getProjectMaxNum());
		System.out.println(dto.getNum());
		projectMapper.insertServicePurpose(dto);
	}
	public void insertEnvironment(ProjectDTO dto) {
		dto.setNum(projectMapper.getProjectMaxNum());
		projectMapper.insertEnvironment(dto);
	}
	public void insertFunctionDetail(ProjectDTO dto) {
		dto.setNum(projectMapper.getProjectMaxNum());
		projectMapper.insertFunctionDetail(dto);
	}
	public void insertMaintenance(ProjectDTO dto) {
		dto.setNum(projectMapper.getProjectMaxNum());
		projectMapper.insertMaintenance(dto);
	}
}
