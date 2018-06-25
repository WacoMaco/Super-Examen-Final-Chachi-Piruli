package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.ControlCheckAudit;

@Repository
public interface ControlCheckAuditRepository  extends JpaRepository<ControlCheckAudit, Integer> {

}
