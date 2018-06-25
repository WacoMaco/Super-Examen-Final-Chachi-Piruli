package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Random;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import domain.Admin;
import domain.ControlCheckAudit;
import forms.ControlCheckAuditForm;

import repositories.ControlCheckAuditRepository;

@Service
@Transactional
public class ControlCheckAuditService {

	// Managed Repository
		@Autowired
		private ControlCheckAuditRepository	controlCheckAuditRepository;

		// Supporting services
		@Autowired
		private AdminService adminService;
		
		@Autowired
		private Validator		validator;

		public ControlCheckAuditService() {
			super();
		}
		
		public ControlCheckAudit create(){
			Admin principal = this.adminService.findByPrincipal();
			ControlCheckAudit controlCheckAudit = new ControlCheckAudit();
			controlCheckAudit.setCreator(principal);
			
			String ticker = this.GenerateTicker();
			controlCheckAudit.setTicker(ticker);
			
			return controlCheckAudit;
			
		}
		
		public ControlCheckAudit save(ControlCheckAudit toSave){
		Collection<ControlCheckAudit> toUpdate1,toUpdate2,updated1,updated2;	
		Admin principal = this.adminService.findByPrincipal();
		Assert.isTrue(toSave.getCreator().equals(principal));
		if(toSave.getNewspaper()== null){
			Assert.isTrue(toSave.getIsDraft()==true);
		}
		if (toSave.getId() != 0){
		ControlCheckAudit old = this.controlCheckAuditRepository.findOne(toSave.getId());
		Assert.isTrue(old.getIsDraft()==false);
		}
		
		ControlCheckAudit saved = this.controlCheckAuditRepository.save(toSave);
		
		toUpdate1 = principal.getControlCheckAudits();
		updated1 = new ArrayList<ControlCheckAudit>(toUpdate1);
		updated1.add(saved);
		principal.setControlCheckAudits(updated1);
		
		if (saved.getNewspaper() != null){
		toUpdate2 = saved.getNewspaper().getControlCheckAudit();
		updated2 = new ArrayList<ControlCheckAudit>(toUpdate2);
		updated2.add(saved);
		saved.getNewspaper().setControlCheckAudit(updated2);
		}
			
		return saved;
		}
		
		
		public void delete(ControlCheckAudit toDelete){
		Collection<ControlCheckAudit> toUpdate1,toUpdate2,updated1,updated2;	
		Admin principal = this.adminService.findByPrincipal();
		
		Assert.isTrue(toDelete.getCreator().equals(principal));
		
		toUpdate1 = principal.getControlCheckAudits();
		updated1 = new ArrayList<ControlCheckAudit>(toUpdate1);
		updated1.remove(toDelete);
		principal.setControlCheckAudits(updated1);
		
		if (toDelete.getNewspaper() != null){
		toUpdate2 = toDelete.getNewspaper().getControlCheckAudit();
		updated2 = new ArrayList<ControlCheckAudit>(toUpdate2);
		updated2.remove(toDelete);
		toDelete.getNewspaper().setControlCheckAudit(updated2);
		}
		
		this.controlCheckAuditRepository.delete(toDelete);
		

		}
		
		
		public ControlCheckAudit findOne(Integer id){
		ControlCheckAudit res = this.controlCheckAuditRepository.findOne(id);
		Assert.notNull(res);
		return res;
			
		}
		
		public Collection<ControlCheckAudit> findAll(){
		Collection<ControlCheckAudit> res = this.controlCheckAuditRepository.findAll();
		return res;
		}
		
		public String GenerateTicker(){
		String res = "";
		Random rand = new Random();
		int  n = rand.nextInt(50) + 1;
		LocalDate date = new LocalDate();
		String day = String.valueOf(date.getDayOfMonth());
		String month = String.valueOf(date.getMonthOfYear());
		String year = String.valueOf(date.getYear());
		String random = String.valueOf(n);
		res = day + month + "/" + year + random;
		return res;
		
		}

		public ControlCheckAudit reconstruct(
				ControlCheckAuditForm controlCheckAuditForm,
				BindingResult binding) {
			ControlCheckAudit res = new ControlCheckAudit ();
			if (controlCheckAuditForm.getId() == 0){
				res = this.create();
			}
			else {
					res = this.findOne(controlCheckAuditForm.getId());	
				}
				res.setControlTitle(controlCheckAuditForm.getControlTitle());
				res.setControlDescription(controlCheckAuditForm.getControlDescription());
				res.setGauge(controlCheckAuditForm.getGauge());
				res.setControlMoment(controlCheckAuditForm.getControlMoment());
				res.setNewspaper(controlCheckAuditForm.getNewspaper());
				res.setIsDraft(controlCheckAuditForm.getIsDraft());
				
				this.validator.validate(controlCheckAuditForm, binding);
				
				Date now = new Date();
				
				if (controlCheckAuditForm.getControlMoment() != null && controlCheckAuditForm.getControlMoment().before(now)){
					binding.rejectValue("controlMoment", "controlCheckAudit.invalid.moment");
				}
				
				if (controlCheckAuditForm.getNewspaper() == null && (controlCheckAuditForm.getIsDraft() == false)){
					binding.rejectValue("newspaper", "controlCheckAudit.invalid.newspaper");
				}
			
			
			return res;
		}

		public ControlCheckAuditForm reconstructForm(
				ControlCheckAudit controlCheckAudit) {
			ControlCheckAuditForm res = new ControlCheckAuditForm();
			res.setId(controlCheckAudit.getId());
			res.setVersion(controlCheckAudit.getVersion());
			res.setControlTitle(controlCheckAudit.getControlTitle());
			res.setControlDescription(controlCheckAudit.getControlDescription());
			res.setGauge(controlCheckAudit.getGauge());
			res.setControlMoment(controlCheckAudit.getControlMoment());
			res.setNewspaper(controlCheckAudit.getNewspaper());
			res.setIsDraft(controlCheckAudit.getIsDraft());
			return res;
		}
	
		
}
