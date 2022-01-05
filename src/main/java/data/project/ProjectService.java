package data.project;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectService {
	@Autowired
	ProjectMapper projectMapper;
	
	public List<ProjectDTO> getAllProject(int start, int perPage){
		return projectMapper.getAllProject(start, perPage);
	}
	public ProjectDTO getProject(int num){
		return projectMapper.getProject(num);
	}
	
	public int getTotalProject() {
		return projectMapper.getTotalProject();
	}
	
	
	//프로젝트 등록
	public void insertNewProject(ProjectDTO dto, HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("/project");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String mainImage = sdf.format(new Date()) + "_" + dto.getUpload().getOriginalFilename();
		dto.setMain_image(mainImage);
		try {
			dto.getUpload().transferTo(new File(path + "\\" + mainImage));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		projectMapper.insertNewProject(dto);
		dto.setNum(projectMapper.getProjectMaxNum());
		projectMapper.insertServicePurpose(dto);
		projectMapper.insertEnvironment(dto);
		projectMapper.insertFunctionDetail(dto);
		projectMapper.insertMaintenance(dto);
	}
	
	//프로젝트 제거
	public void deleteProject(int num) {
		projectMapper.deleteProject(num);
	}
}
