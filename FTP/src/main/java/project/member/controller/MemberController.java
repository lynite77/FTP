package project.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import project.member.service.MemberService;
import project.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/getMebmer")
	String getMember(Model model) {
		
		List<MemberVO> getMember= memberService.getMemberList();
		
		model.addAttribute("dataList",getMember);
		
		return "memberList";
	}
	
	//@PostMapping("/insertMember")
	//String insertMember(@ModelAttribute MemberVO member) {
	//	memberService.insertMember(member);
	//	
	//	return "redirect:/getMebmer";
	//}
	

}
