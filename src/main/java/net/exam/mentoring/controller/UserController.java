package net.exam.mentoring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.exam.mentoring.dto.Mento;
import net.exam.mentoring.service.MentiService;
import net.exam.mentoring.service.MentoService;

@Controller
public class UserController {
	@Autowired MentoService mentoService;
	@Autowired MentiService mentiService;
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
	
	@RequestMapping("user/mentoInfo")
	public String mentoInfo(Model model, @RequestParam("id") int id) {
		model.addAttribute("mento", mentoService.findOne(id));
		model.addAttribute("mentis", mentiService.findByMentoId(id));
		System.out.println(mentoService.isMento(id));
		System.out.println(mentiService.isMenti(id));
		model.addAttribute("mentoBoolean", mentoService.isMento(id));
		model.addAttribute("mentiBoolean", mentiService.isMenti(id));
		return "user/mentoInfo";
	}
	@RequestMapping("user/mentiApplication")
	public String mentiApplication(Model model, @RequestParam("id") int id) {
		mentiService.insert(id);
		return "redirect:mentoInfo?id="+id;
	}
	@RequestMapping("user/mentiCancel")
	public String mentiCancel(Model model, @RequestParam("id") int id) {
		mentiService.delete(id);
		return "redirect:mentoInfo?id="+id;
	}
	
   

}
