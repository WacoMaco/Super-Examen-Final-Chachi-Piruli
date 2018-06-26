package domain;

import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.hibernate.validator.constraints.SafeHtml;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
public class ControlCheckAudit extends DomainEntity {
	
	private String ticker;
	private String controlTitle;
	private String controlDescription;
	private Integer gauge;
	private Date controlMoment;
	private Boolean isDraft;
	private Admin creator;
	private Newspaper newspaper;
	
	@Column(unique=true)
	@NotNull
	public String getTicker() {
		return ticker;
	}
	public void setTicker(String ticker) {
		this.ticker = ticker;
	}
	@NotBlank
	@SafeHtml(whitelistType = SafeHtml.WhiteListType.NONE)
	public String getControlTitle() {
		return controlTitle;
	}
	public void setControlTitle(String controlTitle) {
		this.controlTitle = controlTitle;
	}
	@NotBlank
	@SafeHtml(whitelistType = SafeHtml.WhiteListType.NONE)
	public String getControlDescription() {
		return controlDescription;
	}
	public void setControlDescription(String controlDescription) {
		this.controlDescription = controlDescription;
	}
	@Range(min=1, max=3)
	@NotNull
	public Integer getGauge() {
		return gauge;
	}
	public void setGauge(Integer gauge) {
		this.gauge = gauge;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
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
	@Valid
	@ManyToOne(optional=true)
	public Admin getCreator() {
		return creator;
	}
	public void setCreator(Admin creator) {
		this.creator = creator;
	}
	@ManyToOne(optional=true)
	public Newspaper getNewspaper() {
		return newspaper;
	}
	public void setNewspaper(Newspaper newspaper) {
		this.newspaper = newspaper;
	}
	
	
	
	

}
