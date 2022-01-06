package data.project;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectService {
	@Autowired
	ProjectMapper projectMapper;
	//모든 프로젝트 가져오기
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
	
	//프로젝트 수정
	public void updateProject(ProjectDTO dto) {
		System.out.println(dto.getProject_title());
		System.out.println(dto.getService());
		//수정
		projectMapper.updateProject(dto);
		System.out.println("dto숫자"+dto.getNum());
		projectMapper.updateService(dto);
		projectMapper.updateEnvironment(dto);
		projectMapper.updateFunctionDetail(dto);
		projectMapper.updateMaintenance(dto);
	}
	
	//프로젝트 제거
	public void deleteProject(int num, HttpSession session) {
		String main_image = projectMapper.getMainImage(num);
		//실제 업로드 경로
		String path = session.getServletContext().getRealPath("/project");
		
		System.out.println("main_image = " + main_image + "path" + path);
		File file = new File(path + "\\" + main_image);
		file.delete();
				
		projectMapper.deleteProject(num);
	}
}
