
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
@Access(AccessType.PROPERTY)
public class Admin extends Actor {
	
	private Collection<ControlCheckAudit> controlCheckAudits;

	
	@OneToMany(mappedBy="creator")
	public Collection<ControlCheckAudit> getControlCheckAudits() {
		return controlCheckAudits;
	}

	public void setControlCheckAudits(
			Collection<ControlCheckAudit> controlCheckAudits) {
		this.controlCheckAudits = controlCheckAudits;
	}
	
	

}
