package controllers.admin;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import services.AdminService;
import services.ControlCheckAuditService;
import services.NewspaperService;

import controllers.AbstractController;
import domain.Admin;
import domain.Article;
import domain.Cust;
import domain.Newspaper;
import domain.User;
import forms.ArticleForm;
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
		
		@Autowired
		NewspaperService	newspaperService;

		
		public ControlCheckAuditAdminController() {
			super();
		}
		
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public ModelAndView list(String filter) {
			ModelAndView result;
			Admin principal = this.adminService.findByPrincipal();
			Collection<Cust> controlCheckAudits = principal.getCusts();
			result = new ModelAndView("controlCheckAudit/list");
			result.addObject("controlCheckAudits", controlCheckAudits);
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
		
		
		@RequestMapping(value = "/edit", method = RequestMethod.GET)
		public ModelAndView edit(@RequestParam final int controlCheckAuditId, final RedirectAttributes redir) {
			ModelAndView result;
			Cust controlCheckAudit;
			ControlCheckAuditForm controlCheckAuditForm;
			try {
				Admin admin = this.adminService.findByPrincipal();
				controlCheckAudit = this.controlCheckAuditService.findOne(controlCheckAuditId);
				Assert.isTrue(controlCheckAudit.getIsDraft()== true);
				Assert.isTrue(controlCheckAudit.getCreator().equals(admin));
				controlCheckAuditForm = this.controlCheckAuditService.reconstructForm(controlCheckAudit);
				result = this.createEditModelAndView(controlCheckAuditForm);
			} catch (final Throwable oops) {
				result = new ModelAndView("redirect:/article/list.do");
				redir.addFlashAttribute("message", "article.permision");

			}

			return result;

		}

				@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
				public ModelAndView save(final ControlCheckAuditForm controlCheckAuditForm, final BindingResult binding) {
					ModelAndView result;
					Cust controlCheckAudit = this.controlCheckAuditService.reconstruct(controlCheckAuditForm,binding);
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
				
				@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
				public ModelAndView delete(final ControlCheckAuditForm controlCheckAuditForm, final BindingResult binding) {
					ModelAndView result;
						try {
							Cust toDelete = this.controlCheckAuditService.findOne(controlCheckAuditForm.getId());
							this.controlCheckAuditService.delete(toDelete);
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
			
			Collection<Newspaper> newspapers = this.newspaperService.publishedNewspapers();

			result = new ModelAndView("controlCheckAudit/edit");
			result.addObject("newspapers", newspapers);
			result.addObject("controlCheckAuditForm", controlCheckAuditForm);
			result.addObject("message", message);

			return result;
		}

}
