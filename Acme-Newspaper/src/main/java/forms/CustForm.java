package forms;

import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

import domain.DomainEntity;
import domain.Newspaper;

@Entity
@Access(AccessType.PROPERTY)
public class CustForm extends DomainEntity {
	
	private String title;
	private String description;
	private Integer gauge;
	private Date moment;
	private Boolean isDraft;
	private Newspaper newspaper;
	
	
	@NotBlank
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@NotBlank
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public Date getMoment() {
		return moment;
	}
	public void setMoment(Date moment) {
		this.moment = moment;
	}
	public Boolean getIsDraft() {
		return isDraft;
	}
	public void setIsDraft(Boolean isDraft) {
		this.isDraft = isDraft;
	}
	@ManyToOne
	public Newspaper getNewspaper() {
		return newspaper;
	}
	public void setNewspaper(Newspaper newspaper) {
		this.newspaper = newspaper;
	}

	

}
