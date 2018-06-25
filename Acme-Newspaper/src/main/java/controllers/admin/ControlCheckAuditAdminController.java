package controllers.admin;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.AdminService;
import services.ControlCheckAuditService;

import controllers.AbstractController;
import domain.Admin;
import domain.Article;

@Controller
@RequestMapping("/controlCheckAudit/admin")
public class ControlCheckAuditAdminController extends AbstractController {
	
	//Autowired
		@Autowired
		ControlCheckAuditService	controlCheckAuditService;
		
		@Autowired
		AdminService	adminService;

		
		public ControlCheckAuditAdminController() {
			super();
		}
		
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public ModelAndView list(String filter) {
			ModelAndView result;
			Admin principal = this.adminService.findByPrincipal();

			result = new ModelAndView("article/list");
			result.addObject("controlCheckAudits", principal.getControlCheckAudits());
			result.addObject("principal", principal);
			return result;
		}

}
