package services;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import domain.Chirp;
import domain.Cust;
import domain.Newspaper;
import forms.ChirpForm;

import utilities.AbstractTest;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring/junit.xml"})
@Transactional
public class ControlCheckAuditTest extends AbstractTest {
	
	//Autowired
	@Autowired
	ControlCheckAuditService	controlCheckAuditService;
	
	@Autowired
	AdminService	adminService;
	
	@Autowired
	NewspaperService	newspaperService;
	
	@Test
	public void driverControlCheckTest() throws ParseException{
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm");
		
		java.util.Date past = sdf.parse("02-06-2013 12:00");
		
		java.util.Date future = sdf.parse("03-07-2019 12:00");
		
		Object testingData[][] = {
								//Requisitos B 16. An actor who is authenticated as a user must be able to:
								//1. Post a chirp. Chirps may not be changed or deleted once they are posted.
							
								//Tests POSITIVOS 
								//
								//Crear un chirp como un usuario
								{"admin", "title1","description2",2,future,false,"newspaper1", null},
								//Tests NEGATIVOS
								//Intentar editar un chrip ya creado
								{"admin", "title1","description2",2,future,false,"", IllegalArgumentException.class},
								//Intentar crear un chirp con otro rol
								{"admin", "title1","description2",2,past,false,"newspaper1", IllegalArgumentException.class},
								
		};
		for (int i = 0; i < testingData.length; i++){
			this.startTransaction();
			templateControlCheck(((String) testingData[i][0]), (String) testingData[i][1],(String)testingData[i][2], (Integer) testingData[i][3],(java.util.Date) testingData[i][4], (Boolean) testingData[i][5],(String)  testingData[i][6], (Class<?>) testingData[i][7]);
			this.rollbackTransaction();
		}
	}

	protected void templateControlCheck(String username, String title,String description, Integer gauge, java.util.Date testingData,Boolean isDraft,String newspaperId, Class<?> expected) {
		Class<?> caught;
		caught = null;
		Cust res,saved;
		Newspaper newspaper = null;
		try{
			super.authenticate(username);
			
			//Crear el chirp
			if (newspaperId != ""){
			newspaper = this.newspaperService.findOne(this.getEntityId(newspaperId));
			}
			
			res = this.controlCheckAuditService.create();
			res.setTitle(title);
			res.setDescription(description);
			res.setMoment(testingData);
			res.setIsDraft(true);
			res.setNewspaper(newspaper);
			res.setGauge(gauge);
			saved = this.controlCheckAuditService.save(res);
			this.controlCheckAuditService.flush();
			saved.setTitle("Changing the title");
			saved.setIsDraft(false);
			this.controlCheckAuditService.save(saved);
			this.controlCheckAuditService.flush();
			unauthenticate();
		}catch(Throwable oops){
			caught = oops.getClass();
		}
		checkExceptions(expected, caught);
		
	}

}
