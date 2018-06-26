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
import services.CustService;
import services.NewspaperService;

@Controller
@RequestMapping("/cust")
public class CustController extends AbstractController {

	public CustController() {
		super();
		// TODO Auto-generated constructor stub
	}
	//Autowired
			@Autowired
			CustService	custService;
			
			@Autowired
			AdminService	adminService;
			
			@Autowired
			ActorService	actorService;
			
			@Autowired
			NewspaperService	newspaperService;

			
			@RequestMapping(value = "/display", method = RequestMethod.GET)
			public ModelAndView display(@RequestParam final int custId, RedirectAttributes redir) {
				ModelAndView result;
				Cust cust;
				try{
				Actor principal = this.actorService.findByPrincipal();
				cust = this.custService.findOne(custId);
				if (principal instanceof User){
					Assert.isTrue(((User) principal).getNewspapers().contains(cust.getNewspaper()));
				}
				if (principal instanceof Customer){
					Collection<Newspaper> test = this.newspaperService.selectSubscribedNewspapers();
					Assert.isTrue(test.contains(cust.getNewspaper()) || !cust.getNewspaper().getIsPrivate());
				}
				
				

				result = new ModelAndView("cust/display");
				result.addObject("principal", principal);
				result.addObject("cust", cust);
				}catch (Throwable oops){
					result = new ModelAndView("redirect:/newspaper/list.do");	
					redir.addFlashAttribute("message", "article.permission"); 
				}//da igual que sea de artículo, el mensaje es el mismo
				
				return result;

		}

}
