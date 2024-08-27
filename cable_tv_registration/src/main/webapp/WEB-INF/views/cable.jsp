<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>

</head>
<body>
	
	<div class="container mt-4">
 
		<div class="h3 text-primary text-center">Cable TV Registration
			Form</div>
 
		<form action="./register" method="post" enctype="multipart/form-data">
 
			<div class="row">
				<div class="col-3">
					<div>
						<label>Provider</label> <select class="form-control"
							name="provider.providerId" id="providerId"
							onchange="getSubscriptionByProviderId(this.value)">
							<option value="0">-select-</option>
							<c:forEach items="${providerList}" var="provider">
								<option value="${provider.providerId }">${provider.providerName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="col-3">
					<div>
						<label>Subscriptions</label> <select class="form-control"
							name="subscription.subscriptionId" id="subscriptionId">
 
						</select>
					</div>
				</div>
				<div class="card mt-4">
					<div class="card-header">
						<h4>Applicant Details</h4>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label for="name">Name</label> <input type="text"
										class="form-control" id="name" name="applicantName" required>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="email">Email</label> <input type="email"
										class="form-control" id="email" name="email" required>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="mobile">Mobile Number</label> <input type="text"
										class="form-control" id="mobile" name="mobileNo" required>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="dob">Date of Birth</label> <input type="date"
										class="form-control" id="dob" name="dob" required>
								</div>
							</div>
							<div class="col-md-4">
								<label>Gender</label>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="gender"
										id="genderMale" value="male" required> <label
										class="form-check-label" for="genderMale"> Male </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="gender"
										id="genderFemale" value="female" required> <label
										class="form-check-label" for="genderFemale"> Female </label>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="image">Upload Image</label> <input type="file"
										class="form-control" id="image" name="iPath" required>
								</div>
							</div>
						</div>
						<div class="row mt-3 justify-content-center">
							<div class="col-md-6 text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
								<button type="reset" class="btn btn-secondary">Reset</button>
							</div>
						</div>
						
						
					</div>
		</form>
<div class="card mt-4">
		<div class="card-header">
			<h4>Registration Details</h4>
		</div>
		<div class="card-body">
			<div class="row mb-3">
				<div class="col-md-4">
					<h5>Filter</h5>
					<label>Provider Name</label>
					<select class="form-control" name="filterProvider" id="filterProviderId">
						<option value="0">-select-</option>
						<c:forEach items="${providerList}" var="provider">
							<option value="${provider.providerId}">${provider.providerName}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-2 d-flex align-items-end">
					<button type="button" class="btn btn-primary" onclick="filterResults()">Search</button>
				</div>
			</div>
			<div class="card mt-4">
				<div class="card-body">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Sl No</th>
								<th>Name</th>
								<th>Email</th>
								<th>Mobile Number</th>
								<th>Document</th>
								<th>Provider Name</th>
								<th>Subscription</th>
								<th>Fees</th>
							</tr>
						</thead>
						<tbody id="registrationDetails">
							<!-- Dynamic content goes here -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
 
 
	</div>
</div>

<script type="text/javascript">

	function getSubscriptionByProviderId(providerId){
		
		
		$.ajax({
		    url: 'getSubscriptionByProviderId',
		    type: 'GET',
		    data : {providerId : providerId},
		    
		    success: function(response){
		        $("#subscriptionId").html(response);
		     },
		    error: function(error){
		      console.log(error)
		    }
		});
		
		
		
		
	}




</script>



</body>
</html>