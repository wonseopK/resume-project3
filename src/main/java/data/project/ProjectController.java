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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import data.paging.PagingDTO;

@Controller
public class ProjectController {
	@Autowired
	ProjectService projectService;
	
	//프로젝트 게시물 생성 CREATE
	@PostMapping("/project-list/project")
	public String postNewProject(ProjectDTO dto, HttpServletRequest request) {
		projectService.insertNewProject(dto, request);
		return "redirect:/resume/project-list";
	}
	
	@GetMapping("/project-list/project-form")
	public String showProjectForm() {
		return "/project/projectForm";
	}
	
	
	//프로젝트 게시물 읽기 READ
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
	@GetMapping("/project-list/project")
	public String showDetail(int num, int currentPage, Model model) {
		ProjectDTO project = projectService.getProject(num);
		project.setNum(num);
		model.addAttribute("project", project);
		model.addAttribute("currentPage", currentPage);
		return "/project/projectDetail";
	}
	
	//프로젝트 게시물 수정 UPDATE
	@GetMapping("/project-list/updateForm")
	public String showUpdateForm(int num, Model m) {
		m.addAttribute("project", projectService.getProject(num));
		return "/project/projectUpdateForm";
	}
	
	@PostMapping("/project-list/content")
	public String updateProject(ProjectDTO projectDTO, HttpServletRequest request) {
//		System.out.println(projectDTO.getProject_title());
//		System.out.println(projectDTO.getService());
		//파일을 미입력하면 null이아닌 "" 즉 빈 문자열이 넘어 온다
		System.out.println(projectDTO.getUpload().getOriginalFilename()+": 파일이름");
		projectService.updateProject(projectDTO, request);
		return "redirect:/resume/project-list";
	}
	
	
	//프로젝트 게시물 삭제 DELETE
	@ResponseBody
	@DeleteMapping("/project-list/project")
	public String  deleteProject(int num, HttpSession session) {
		System.out.println(num);
		projectService.deleteProject(num, session);
		return "project";
	}
	
	//비밀번호확인
	@ResponseBody
	@PostMapping("/project-list/admin")
	public int checkPwd(String pwd) {
		System.out.println("비밀번호체크" +pwd+"결과"+ projectService.checkPwd(pwd));
		
		return projectService.checkPwd(pwd);
	}
	
	
}
