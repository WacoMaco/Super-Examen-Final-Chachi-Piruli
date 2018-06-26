
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
@Access(AccessType.PROPERTY)
public class Admin extends Actor {
	
	private Collection<Cust> custs;

	
	@OneToMany(mappedBy="creator")
	public Collection<Cust> getCusts() {
		return custs;
	}

	public void setCusts(
			Collection<Cust> custs) {
		this.custs = custs;
	}
	
	

}
