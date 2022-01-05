package data.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProjectController {
	@Autowired
	ProjectService projectService;
	
	@GetMapping("/resume/project-list")
	public String showProject(@RequestParam(value = "currentPage" , defaultValue = "1" ) int currentPage, Model model) {
		int totalCount = projectService.getTotalProject();//총 글의 수
		
		//페이징 처리에 필요한 변수선언
		int perPage = 2; //한페이지에 보여질 글의 갯수
		int totalPage; //총 페이지수
		int start; //각페이지에서 불러올 db의 시작번호
		int perBlock = 5; //몇개의 페이지번호씩 표현할것인가
		int startPage; //각 블럭에 표시할 시작페이지
		int endPage; //각 블럭에 표시할 마지막페이지
		
		//총페이지 갯수 구하기
		totalPage = totalCount/perPage + (totalCount%perPage == 0 ? 0 : 1);
		
		//각 블럭의 시작페이지
		startPage = (currentPage-1)/perBlock*perBlock+1;
		endPage = startPage+perBlock-1;
		
		if(endPage>totalPage){
			endPage = totalPage;
		}
		
		//각 페이지에서 불러올 시작번호
		start = (currentPage-1)*perPage; //오라클은 첫번이1이라 1더해야함
		//각페이지에서 필요한 게시글 가져오기
		List<ProjectDTO> list = projectService.getAllProject(start, perPage);
		
		//각페이지에 출력할 시작번호
		int no = totalCount-(currentPage-1)*perPage; 
		
		model.addAttribute("list", list);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("no", no);
		model.addAttribute("currentPage", currentPage);
		
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
		projectService.insertNewProject(dto, request);
		return "redirect:/resume/project-list";
	}
}
