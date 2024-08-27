package tech.csm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.model.RegistrationDetails;
import tech.csm.repo.RegistrationDetailsRepo;


@Service
public class RegistrationDetailsServiceImpl implements RegistrationDetailsService {
	
	
	@Autowired
	private RegistrationDetailsRepo registrationDetailsRepo;

	@Override
	public RegistrationDetails saveRegistrationDetails(RegistrationDetails registrationDetails) {
		return registrationDetailsRepo.save(registrationDetails);
	}

}
