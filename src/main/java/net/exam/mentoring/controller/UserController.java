package net.exam.mentoring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.exam.mentoring.dto.Mento;
import net.exam.mentoring.service.MentoService;

@Controller
public class UserController {
	@Autowired MentoService mentoService;
	@RequestMapping("user/index")
	public String index(Model model){
		model.addAttribute("mentos", mentoService.findAll());
		return "user/index";
	}
	@RequestMapping(value="user/mentoApplication", method=RequestMethod.GET)
	public String mentoApplication(Model model) {
		Mento mento=new Mento();
		model.addAttribute("mento", mento);
		return "user/mentoApplication";
	}
	@RequestMapping(value="user/mentoApplication", method=RequestMethod.POST)
	public String mentoApplication(Model model, Mento mento) {
		mentoService.insert(mento);
		return "redirect:index";
	}
}
