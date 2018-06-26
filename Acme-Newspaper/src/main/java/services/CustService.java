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
import forms.CustForm;

import repositories.CustRepository;

@Service
@Transactional
public class CustService {

	// Managed Repository
		@Autowired
		private CustRepository	custRepository;

		// Supporting services
		@Autowired
		private AdminService adminService;
		
		@Autowired
		private Validator		validator;

		public CustService() {
			super();
		}
		
		public Cust create(){
			Admin principal = this.adminService.findByPrincipal();
			Cust cust = new Cust();
			cust.setCreator(principal);
			
			String ticker = this.GenerateTicker();
			cust.setSymbol(ticker);
			
			return cust;
			
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
		
		Cust saved = this.custRepository.save(toSave);
		
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
		
		this.custRepository.delete(toDelete);
		

		}
		
		
		public Cust findOne(Integer id){
		Cust res = this.custRepository.findOne(id);
		Assert.notNull(res);
		return res;
			
		}
		
		public Collection<Cust> findAll(){
		Collection<Cust> res = this.custRepository.findAll();
		return res;
		}
		
		public String GenerateTicker(){
			
			String randomString = "";
			String alphabet = "abcdefghijklmnopqrstuvwxyz";	
			char[] alphabetArray = alphabet.toCharArray();
			
			Random r = new Random();

			Integer numberOfRandomsCharacters = r.nextInt(5-2) + 2;
			
			for (int i = 0; i  <= numberOfRandomsCharacters ; i ++){
			Integer numberOfRandomCharacters = r.nextInt(alphabetArray.length-0) + 0;
			randomString += alphabetArray[numberOfRandomCharacters];
				
			}
			
		String res = "";
		
		
		LocalDate date = new LocalDate();
		String day = String.valueOf(date.getDayOfMonth());
		String month = String.valueOf(date.getMonthOfYear());
		if(date.getMonthOfYear() < 10){
			month = 0 + month;
		}
		String year = String.valueOf(date.getYearOfCentury());
		res = day + randomString + "-" + month + year ;
		return res;
		
		}

		public Cust reconstruct(
				CustForm custForm,
				BindingResult binding) {
			Cust res = new Cust ();
			if (custForm.getId() == 0){
				res = this.create();
			}
			else {
					res = this.findOne(custForm.getId());	
				}
				res.setTitle(custForm.getTitle());
				res.setDescription(custForm.getDescription());
				res.setGauge(custForm.getGauge());
				res.setMoment(custForm.getMoment());
				res.setNewspaper(custForm.getNewspaper());
				res.setIsDraft(custForm.getIsDraft());
				
				this.validator.validate(custForm, binding);
				
				Date now = new Date();
				
				if (custForm.getMoment() != null && custForm.getMoment().before(now)){
					binding.rejectValue("moment", "cust.invalid.moment");
				}
				
				if (custForm.getNewspaper() == null && (custForm.getIsDraft() == false)){
					binding.rejectValue("newspaper", "cust.invalid.newspaper");
				}
			
			
			return res;
		}

		public CustForm reconstructForm(
				Cust cust) {
			CustForm res = new CustForm();
			res.setId(cust.getId());
			res.setVersion(cust.getVersion());
			res.setTitle(cust.getTitle());
			res.setDescription(cust.getDescription());
			res.setGauge(cust.getGauge());
			res.setMoment(cust.getMoment());
			res.setNewspaper(cust.getNewspaper());
			res.setIsDraft(cust.getIsDraft());
			return res;
		}
	
	public Collection<Cust> SelectPublishedByNewspaper (Integer newspaperId){
		Collection<Cust> res = this.custRepository.findCustPublished(newspaperId);
		return res;
	}
	public void flush(){
		this.custRepository.flush();
	}
}
