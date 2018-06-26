package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import domain.Actor;
import domain.Cust;
import domain.Customer;
import domain.Newspaper;
import domain.User;

import services.ActorService;
import services.AdminService;
import services.ControlCheckAuditService;
import services.NewspaperService;

@Controller
@RequestMapping("/controlCheckAudit")
public class ControlCheckAuditController extends AbstractController {

	public ControlCheckAuditController() {
		super();
		// TODO Auto-generated constructor stub
	}
	//Autowired
			@Autowired
			ControlCheckAuditService	controlCheckAuditService;
			
			@Autowired
			AdminService	adminService;
			
			@Autowired
			ActorService	actorService;
			
			@Autowired
			NewspaperService	newspaperService;

			
			@RequestMapping(value = "/display", method = RequestMethod.GET)
			public ModelAndView display(@RequestParam final int controlCheckAuditId, RedirectAttributes redir) {
				ModelAndView result;
				Cust controlCheckAudit;
				try{
				Actor principal = this.actorService.findByPrincipal();
				controlCheckAudit = this.controlCheckAuditService.findOne(controlCheckAuditId);
				if (principal instanceof User){
					Assert.isTrue(((User) principal).getNewspapers().contains(controlCheckAudit.getNewspaper()));
				}
				if (principal instanceof Customer){
					Collection<Newspaper> test = this.newspaperService.selectSubscribedNewspapers();
					Assert.isTrue(test.contains(controlCheckAudit.getNewspaper()) || !controlCheckAudit.getNewspaper().getIsPrivate());
				}
				
				

				result = new ModelAndView("controlCheckAudit/display");
				result.addObject("principal", principal);
				result.addObject("controlCheckAudit", controlCheckAudit);
				}catch (Throwable oops){
					result = new ModelAndView("redirect:/newspaper/list.do");	
					redir.addFlashAttribute("message", "article.permission"); 
				}//da igual que sea de artículo, el mensaje es el mismo
				
				return result;

		}

}
