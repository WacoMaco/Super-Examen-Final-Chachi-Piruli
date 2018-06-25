package forms;

import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

import domain.DomainEntity;
import domain.Newspaper;

@Entity
@Access(AccessType.PROPERTY)
public class ControlCheckAuditForm extends DomainEntity {
	
	private String controlTitle;
	private String controlDescription;
	private Integer gauge;
	private Date controlMoment;
	private Boolean isDraft;
	private Newspaper newspaper;
	
	
	@NotBlank
	public String getControlTitle() {
		return controlTitle;
	}
	public void setControlTitle(String controlTitle) {
		this.controlTitle = controlTitle;
	}
	@NotBlank
	public String getControlDescription() {
		return controlDescription;
	}
	public void setControlDescription(String controlDescription) {
		this.controlDescription = controlDescription;
	}
	@Range(min=1, max=3)
	public Integer getGauge() {
		return gauge;
	}
	public void setGauge(Integer gauge) {
		this.gauge = gauge;
	}
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	public Date getControlMoment() {
		return controlMoment;
	}
	public void setControlMoment(Date controlMoment) {
		this.controlMoment = controlMoment;
	}
	public Boolean getIsDraft() {
		return isDraft;
	}
	public void setIsDraft(Boolean isDraft) {
		this.isDraft = isDraft;
	}

	public Newspaper getNewspaper() {
		return newspaper;
	}
	public void setNewspaper(Newspaper newspaper) {
		this.newspaper = newspaper;
	}

	

}
