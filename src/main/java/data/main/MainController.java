package data.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {
	@GetMapping("/")
	public String showMain() {
		return "/layout/main";
	}
	@GetMapping("/resume/about-me")
	public String showAbout() {
		System.out.println("메인컨트");
		return "/layout/main";
	}
}
