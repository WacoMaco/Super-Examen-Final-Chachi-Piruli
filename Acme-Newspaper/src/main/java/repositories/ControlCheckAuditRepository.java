package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Agent;
import domain.ControlCheckAudit;

@Repository
public interface ControlCheckAuditRepository  extends JpaRepository<ControlCheckAudit, Integer> {

	@Query("select cC from ControlCheckAudit cC where cC.isDraft = false and (cC.controlMoment < CURRENT_TIMESTAMP or cC.controlMoment = null) and cC.newspaper.id = ?1")
	public Collection<ControlCheckAudit> findPublished(int userAccountId);
	
}
