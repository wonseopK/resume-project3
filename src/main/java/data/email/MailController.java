package data.email;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@AllArgsConstructor
public class MailController {
    private final MailService mailService;
    @ResponseBody
    @PostMapping("/send/send")
    public void execMail(MailDto mailDto) {
//    	System.out.println(mailDto.getEmail());
//    	System.out.println(mailDto.getMessage());
//    	System.out.println(mailDto.getAddress());
    	mailService.mailSend(mailDto);
    }
}

