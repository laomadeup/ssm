package cn.laoma.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/test")
public class TestController {

	@RequestMapping()
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/test/index");
		mav.addObject("name", "jack");
		return mav;
	}
	
}
