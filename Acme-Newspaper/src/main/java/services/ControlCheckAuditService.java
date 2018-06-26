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
import domain.Cust;
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
		
		public Cust create(){
			Admin principal = this.adminService.findByPrincipal();
			Cust controlCheckAudit = new Cust();
			controlCheckAudit.setCreator(principal);
			
			String ticker = this.GenerateTicker();
			controlCheckAudit.setSymbol(ticker);
			
			return controlCheckAudit;
			
		}
		
		public Cust save(Cust toSave){
		Collection<Cust> toUpdate1,toUpdate2,updated1,updated2;	
		Admin principal = this.adminService.findByPrincipal();
		Assert.isTrue(toSave.getCreator().equals(principal));
		if(toSave.getNewspaper()== null){
			Assert.isTrue(toSave.getIsDraft()==true);
		}
		
		Date now = new Date();
		if (toSave.getMoment() != null){
			Assert.isTrue(toSave.getMoment().after(now));
		}
		
		Cust saved = this.controlCheckAuditRepository.save(toSave);
		
		toUpdate1 = principal.getCusts();
		updated1 = new ArrayList<Cust>(toUpdate1);
		updated1.add(saved);
		principal.setCusts(updated1);
		
		if (toSave.getNewspaper() != null){
		toUpdate2 = saved.getNewspaper().getCusts();
		updated2 = new ArrayList<Cust>(toUpdate2);
		updated2.add(saved);
		saved.getNewspaper().setCusts(updated2);
		}
			
		return saved;
		}
		
		
		public void delete(Cust toDelete){
		Collection<Cust> toUpdate1,toUpdate2,updated1,updated2;	
		Admin principal = this.adminService.findByPrincipal();
		
		Assert.isTrue(toDelete.getCreator().equals(principal));
		
		toUpdate1 = principal.getCusts();
		updated1 = new ArrayList<Cust>(toUpdate1);
		updated1.remove(toDelete);
		principal.setCusts(updated1);
		
		if (toDelete.getNewspaper() != null){
		toUpdate2 = toDelete.getNewspaper().getCusts();
		updated2 = new ArrayList<Cust>(toUpdate2);
		updated2.remove(toDelete);
		toDelete.getNewspaper().setCusts(updated2);
		}
		
		this.controlCheckAuditRepository.delete(toDelete);
		

		}
		
		
		public Cust findOne(Integer id){
		Cust res = this.controlCheckAuditRepository.findOne(id);
		Assert.notNull(res);
		return res;
			
		}
		
		public Collection<Cust> findAll(){
		Collection<Cust> res = this.controlCheckAuditRepository.findAll();
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

		public Cust reconstruct(
				ControlCheckAuditForm controlCheckAuditForm,
				BindingResult binding) {
			Cust res = new Cust ();
			if (controlCheckAuditForm.getId() == 0){
				res = this.create();
			}
			else {
					res = this.findOne(controlCheckAuditForm.getId());	
				}
				res.setTitle(controlCheckAuditForm.getControlTitle());
				res.setDescription(controlCheckAuditForm.getControlDescription());
				res.setGauge(controlCheckAuditForm.getGauge());
				res.setMoment(controlCheckAuditForm.getControlMoment());
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
				Cust controlCheckAudit) {
			ControlCheckAuditForm res = new ControlCheckAuditForm();
			res.setId(controlCheckAudit.getId());
			res.setVersion(controlCheckAudit.getVersion());
			res.setControlTitle(controlCheckAudit.getTitle());
			res.setControlDescription(controlCheckAudit.getDescription());
			res.setGauge(controlCheckAudit.getGauge());
			res.setControlMoment(controlCheckAudit.getMoment());
			res.setNewspaper(controlCheckAudit.getNewspaper());
			res.setIsDraft(controlCheckAudit.getIsDraft());
			return res;
		}
	
	public Collection<Cust> SelectPublishedByNewspaper (Integer newspaperId){
		Collection<Cust> res = this.controlCheckAuditRepository.findPublished(newspaperId);
		return res;
	}
	public void flush(){
		this.controlCheckAuditRepository.flush();
	}
}
