package data.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import data.paging.PagingDTO;

@Controller
public class ProjectController {
	@Autowired
	ProjectService projectService;
	
	@GetMapping("/resume/project-list")
	public String showProject(PagingDTO pagingDTO, Model model) {
		int totalCount = projectService.getTotalProject();//총 글의 수
		pagingDTO.page(pagingDTO.getCurrentPage(), totalCount);
		//각페이지에서 필요한 게시글 가져오기
		List<ProjectDTO> list = projectService.getAllProject(pagingDTO.getStart(), pagingDTO.getPerPage());
		model.addAttribute("list", list);
		model.addAttribute("page", pagingDTO);
		
		return "/project/project";
	}
	
	
	
	
	@GetMapping("/project-list/project-detail")
	public String showDetail(int num, int currentPage, Model model) {
		ProjectDTO project = projectService.getProject(num);
		project.setNum(num);
		model.addAttribute("project", project);
		model.addAttribute("currentPage", currentPage);
		return "/project/projectDetail";
	}
	
	
	@GetMapping("/project-list/project-form")
	public String showProjectForm() {
		return "/project/projectForm";
	}
	
	
	@PostMapping("/project-list/new-project")
	public String postNewProject(ProjectDTO dto, HttpServletRequest request) {
		projectService.insertNewProject(dto, request);
		return "redirect:/resume/project-list";
	}
	
	@ResponseBody
	@DeleteMapping("/project-list/bad-project")
	public String  deleteProject(int num, HttpSession session) {
		System.out.println(num);
		projectService.deleteProject(num, session);
		return "project";
	}
	
}
