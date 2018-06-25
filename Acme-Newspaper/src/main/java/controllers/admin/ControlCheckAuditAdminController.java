package controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.AdminService;
import services.ControlCheckAuditService;

import controllers.AbstractController;
import domain.Admin;
import domain.ControlCheckAudit;
import domain.Newspaper;
import forms.ControlCheckAuditForm;
import forms.NewspaperForm;

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
		
		
		// Creation ---------------------------------------------------------------

		@RequestMapping(value = "/create", method = RequestMethod.GET)
		public ModelAndView create() {
			ModelAndView result;
			ControlCheckAuditForm controlCheckAuditForm = new ControlCheckAuditForm();

			result = this.createEditModelAndView(controlCheckAuditForm);

			return result;
		}

		// Edition ----------------------------------------------------------------

				@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
				public ModelAndView save(final ControlCheckAuditForm controlCheckAuditForm, final BindingResult binding) {
					ModelAndView result;
					ControlCheckAudit controlCheckAudit = this.controlCheckAuditService.reconstruct(controlCheckAuditForm,binding);
					if (binding.hasErrors())
						result = this.createEditModelAndView(controlCheckAuditForm);
					else
						try {
							this.controlCheckAuditService.save(controlCheckAudit);
							result = new ModelAndView("redirect:/controlCheckAudit/admin/list.do");
						} catch (final Throwable oops) {
							String errorMessage = "newspaper.commit.error";
							result = this.createEditModelAndView(controlCheckAuditForm, errorMessage);
						}

					return result;
				}
		
		
		
		private ModelAndView createEditModelAndView(ControlCheckAuditForm controlCheckAuditForm){
				ModelAndView result;

				result = this.createEditModelAndView(controlCheckAuditForm, null);

				return result;
			}

		private ModelAndView createEditModelAndView(
				ControlCheckAuditForm controlCheckAuditForm, String message) {
			ModelAndView result;

			result = new ModelAndView("controlCheckAudit/edit");
			result.addObject("controlCheckAuditForm", controlCheckAuditForm);
			result.addObject("message", message);

			return result;
		}

}
