package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Agent;
import domain.Cust;

@Repository
public interface CustRepository  extends JpaRepository<Cust, Integer> {

	@Query("select cC from Cust cC where cC.isDraft = false and (cC.moment < CURRENT_TIMESTAMP or cC.moment = null) and cC.newspaper.id = ?1")
	public Collection<Cust> findCustPublished(int userAccountId);
	
	
}
