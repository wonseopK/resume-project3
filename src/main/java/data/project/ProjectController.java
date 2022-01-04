package data.project;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProjectController {
	@Autowired
	ProjectService projectService;
	
	@GetMapping("/resume/project-list")
	public String showProject(Model model) {
		List<ProjectDTO> list = projectService.getAllProject();
		model.addAttribute("list", list);
		return "/project/project";
	}
	
	
	@GetMapping("/project-list/project-detail")
	public String showDetail(int num, Model model) {
		ProjectDTO project = projectService.getProject(num);
		model.addAttribute("project", project);
		return "/project/projectDetail";
	}
	
	
	@GetMapping("/project-list/project-form")
	public String showProjectForm() {
		return "/project/projectForm";
	}
	
	@PostMapping("/project-list/new-project")
	public String postNewProject(ProjectDTO dto, HttpServletRequest request) {
		//출력확인
//		System.out.println(dto.getCode_link());
//		System.out.println(dto.getEnvironment());
//		System.out.println(dto.getFunction_detail());
//		System.out.println(dto.getMain_image());
//		System.out.println(dto.getMaintenance());
//		System.out.println(dto.getProject_title());
//		System.out.println(dto.getService());
		String path = request.getSession().getServletContext().getRealPath("/project");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String mainImage = sdf.format(new Date()) + "_" + dto.getUpload().getOriginalFilename();
		dto.setMain_image(mainImage);
		try {
			dto.getUpload().transferTo(new File(path + "\\" + mainImage));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		projectService.insertNewProject(dto);
		projectService.insertServicePurpose(dto);
		projectService.insertEnvironment(dto);
		projectService.insertFunctionDetail(dto);
		projectService.insertMaintenance(dto);
		return "redirect:/resume/project-list";
	}
}
