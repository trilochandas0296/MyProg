package tech.csm.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import tech.csm.model.RegistrationDetails;

public interface RegistrationDetailsRepo extends JpaRepository<RegistrationDetails, Integer> {

}
