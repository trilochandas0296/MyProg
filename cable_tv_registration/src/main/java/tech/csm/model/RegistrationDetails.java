package tech.csm.model;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Getter;



@Entity
@Getter
@Table(name="registration_details")
public class RegistrationDetails implements Serializable {

	@Id
	@Column(name="registration_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer registrationId;
	
	
	@Column(name="applicant_name")
	private String applicantName;
	
	@Column(name="email_id")
	private String emailId;
	@Column(name="mobile_no")
	private String mobileNo;
	
	
	private String gender;
	
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dob;
	
	
	@Column(name="image_path")
	private String imagePath;
	
	@Transient
	private MultipartFile ipathFile;
	
	
	@ManyToOne
	@JoinColumn(name="provider_id")
	private  Provider provider;
	
	
	@ManyToOne
	@JoinColumn(name="subscription_Id")
	private Subscription subscription;
	
	
}
