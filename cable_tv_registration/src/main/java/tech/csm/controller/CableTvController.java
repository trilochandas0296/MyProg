package tech.csm.controller;

import java.util.List;

import org.apache.tomcat.util.http.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletResponse;
import tech.csm.model.RegistrationDetails;
import tech.csm.model.Subscription;
import tech.csm.service.ProviderService;
import tech.csm.service.registrationDetailsService;

@Controller
public class CableTvController {
	@Autowired
	private ProviderService providerService;
	
	
	@GetMapping("/getform")
	public String getForm(Model Model) {
		
		Model.addAttribute("providerList", providerService.getAllProviders());
		
		return "cable";
	}
	
	@GetMapping("/getSubscriptionByProviderId")
		public void getSubscriptionByProviderId(@RequestParam("providerId") Integer providerId,HttpServletResponse servletResponse) {
			System.out.println(providerId+"*************************");
			List<Subscription> subscriptionList = providerService.getProviderById(providerId).getSubscriptions();
			
			String res= "<option value='0'>--Select--</option>";
			for(Subscription s: subscriptionList) {
				res+="<option value='"+s.getSubscriptionId()+"'>"+s.getSubscriptionType()+"</option>";
			}
			
		}
	
	public void saveRegistration (@ModelAttribute RegistrationDetails registrationDetails
			({
				registrationDetails.setImagePath(FileUpload.uploadFile(registrationDetails().getIpath()));
				registrationDetailsService.saveRegistration(registrationDetails);
				
				return "redirect:/getform";
				}
			}
		
	


