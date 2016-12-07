<!DOCTYPE html>
<html>
<head>
<title>jQuery Select Change Event For Dependent Select Option
	Field - Demo Preview</title>
<meta name="robots" content="noindex, nofollow">
<!-- Include CSS File Here -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class='col-sm-6'>
				<div class="form-group">
					<div class='input-group date' id='datetimepicker3'>
						<input type='text' class="form-control" /> <span
							class="input-group-addon"> <span
							class="glyphicon glyphicon-time"></span>
						</span>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				$(document).ready(
						function() {
							$('#datetimepicker3').datetimepicker(
									{
										format : 'LT',
										stepping : 30,
										enabledHours : [ 5, 6, 7, 8, 9, 10, 11, 12, 13,
												14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24 ]
									});
						});
			</script>
		</div>
	</div>
</body>
<script type="text/javascript">
	
</script>
</html>