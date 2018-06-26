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
import services.CustService;
import services.NewspaperService;

import controllers.AbstractController;
import domain.Admin;
import domain.Article;
import domain.Cust;
import domain.Newspaper;
import domain.User;
import forms.ArticleForm;
import forms.CustForm;
import forms.NewspaperForm;

@Controller
@RequestMapping("/cust/admin")
public class CustAdminController extends AbstractController {
	
	//Autowired
		@Autowired
		CustService	custService;
		
		@Autowired
		AdminService	adminService;
		
		@Autowired
		NewspaperService	newspaperService;

		
		public CustAdminController() {
			super();
		}
		
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public ModelAndView list(String filter) {
			ModelAndView result;
			Admin principal = this.adminService.findByPrincipal();
			Collection<Cust> custs = principal.getCusts();
			result = new ModelAndView("cust/list");
			result.addObject("custs", custs);
			result.addObject("principal", principal);
			return result;
		}
		
		
		// Creation ---------------------------------------------------------------

		@RequestMapping(value = "/create", method = RequestMethod.GET)
		public ModelAndView create() {
			ModelAndView result;
			CustForm custForm = new CustForm();

			result = this.createEditModelAndView(custForm);

			return result;
		}

		// Edition ----------------------------------------------------------------
		
		
		@RequestMapping(value = "/edit", method = RequestMethod.GET)
		public ModelAndView edit(@RequestParam final int custId, final RedirectAttributes redir) {
			ModelAndView result;
			Cust cust;
			CustForm custForm;
			try {
				Admin admin = this.adminService.findByPrincipal();
				cust = this.custService.findOne(custId);
				Assert.isTrue(cust.getIsDraft()== true);
				Assert.isTrue(cust.getCreator().equals(admin));
				custForm = this.custService.reconstructForm(cust);
				result = this.createEditModelAndView(custForm);
			} catch (final Throwable oops) {
				result = new ModelAndView("redirect:/article/list.do");
				redir.addFlashAttribute("message", "article.permision");

			}

			return result;

		}

				@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
				public ModelAndView save(final CustForm custForm, final BindingResult binding) {
					ModelAndView result;
					Cust cust = this.custService.reconstruct(custForm,binding);
					if (binding.hasErrors())
						result = this.createEditModelAndView(custForm);
					else
						try {
							this.custService.save(cust);
							result = new ModelAndView("redirect:/cust/admin/list.do");
						} catch (final Throwable oops) {
							String errorMessage = "newspaper.commit.error";
							result = this.createEditModelAndView(custForm, errorMessage);
						}

					return result;
				}
				
				@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
				public ModelAndView delete(final CustForm custForm, final BindingResult binding) {
					ModelAndView result;
						try {
							Cust toDelete = this.custService.findOne(custForm.getId());
							this.custService.delete(toDelete);
							result = new ModelAndView("redirect:/cust/admin/list.do");
						} catch (final Throwable oops) {
							String errorMessage = "newspaper.commit.error";
							result = this.createEditModelAndView(custForm, errorMessage);
						}

					return result;
				}
		
		
		
		private ModelAndView createEditModelAndView(CustForm custForm){
				ModelAndView result;

				result = this.createEditModelAndView(custForm, null);

				return result;
			}

		private ModelAndView createEditModelAndView(
				CustForm custForm, String message) {
			ModelAndView result;
			
			Collection<Newspaper> newspapers = this.newspaperService.publishedNewspapers();

			result = new ModelAndView("cust/edit");
			result.addObject("newspapers", newspapers);
			result.addObject("custForm", custForm);
			result.addObject("message", message);

			return result;
		}

}
