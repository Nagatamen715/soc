<%
	if request.querystring("submit") = "2" then

            emailsubject = request.form("initial_call_staff_location")

            emailmessage = "<div style='border:1px solid black;'><b><u>Initial Call</u></b>" & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Date:</b> " & request.form("initial_call_date") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Time of 1st call to SOC:</b> " & request.form("initial_call_time") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Client Name:</b> " & request.form("initial_call_client_name") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Client's DOB:</b> " & request.form("initial_call_client_dob") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Origin of the call to CCRT:</b> " & request.form("initial_call_origin") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>CCRT Field Staff:</b> " & request.form("initial_call_staff_name") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>CCRT Field Staff Location:</b> " & request.form("initial_call_staff_location") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>CCRT Staff Person on the Phone:</b> " & request.form("initial_call_staff_on_phone") & "<br></div>" & vbcrlf
            emailmessage = emailmessage & "<br>" & vbcrlf
            emailmessage = emailmessage & "<div style='border:1px solid black;'><b><u>Second Call</u></b>" & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>CCRT Staff Person on the Phone:</b> " & request.form("second_call_staff_on_phone") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Time of Call:</b> " & request.form("second_call_time") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Description of Situation:</b> " & request.form("second_call_description") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>SOC Recommendation:</b> " & request.form("second_call_soc_recommendation") & "<br></div>" & vbcrlf
            emailmessage = emailmessage & "<br>" & vbcrlf
            emailmessage = emailmessage & "<div style='border:1px solid black;'><b><u>Third Call</u></b>" & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>CCRT Staff Person on the Phone:</b> " & request.form("third_call_staff_on_phone") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Time of Call:</b> " & request.form("third_call_time") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Description of Situation:</b> " & request.form("third_call_description") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>SOC Recommendation:</b> " & request.form("third_call_soc_recommendation") & "<br></div>" & vbcrlf
            emailmessage = emailmessage & "<br>" & vbcrlf
            emailmessage = emailmessage & "<div style='border:1px solid black;'><b><u>Disposition</u></b>" & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>CCRT Staff Person on the Phone:</b> " & request.form("disposition_staff_on_phone") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Time staff left the scene:</b> " & request.form("time_staff_left_scene") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Disposition of Client/Incident:</b> " & request.form("disposition_of_client_incident") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Incident handed off to SOC:</b> " & request.form("disposition_staff_handed_to") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Time incident handed off:</b> " & request.form("time_incident_handed_off") & "<br></div>" & vbcrlf
  


			Set SMTP = CreateObject("EasyMail.SMTP.5")
		   	'SMTP.MailServer = "Mail.sbcounty.gov"   'Currently our Internal email server.
			SMTP.MailServer = "Mail.sbcounty.gov"   ' public email server
			SMTP.Subject = emailsubject
			SMTP.BodyText = emailmessage
			SMTP.BodyFormat = 1
			'SMTP.From = request.form("sendername")
			SMTP.FromAddr = "webmaster@dbh.sbcounty.gov"


			'-----add recipients as many times as necessary--------------
			'SMTP.AddRecipient "WebMaster","webmaster@dbh.sbcounty.gov", 1
            SMTP.AddRecipient "Benjamin","benjamin.hager@dbh.sbcounty.gov", 1
			'------------------------------------------------------------

			SMTP.LicenseKey = "Commented out for now"
			x = SMTP.Send
			if x > 0 then
				sendstatus = "<font color='red'>There was a problem sending email. The error code is: " & x & "</font>"
			else
				sendstatus = "<div style='text-align:center;'>Your message has been sent.<br><br>Click <a href='soc_contact_fancy.asp'>here</a> to send another record.<br><br>Click <a href='http://www.sbcounty.gov/dbh/index.asp'>here</a> to return to the DBH Home Page</div>"
			end if
			set smtp=Nothing
	end if
%>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SOC Record of Consultation</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/SOC_Consultation_Record.css" rel="stylesheet">
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <div class="container">
        <% if request.querystring("submit")<> "2" then %>
        <div class="county_logo" style="text-align: center;">
            <img src="soc_header.png" />
        </div>
        <form action="soc_contact.asp?submit=2" method="POST">
            <div class="panel panel-default initial_call">
                <div class="panel-body">
                    <h4><b>Initial Call</b></h4>
                    <div class="row">
                        <div class="col-md-4 left_text">Client's Name:</div>
                        <div class="col-md-3 left_field">
                            <input type="text" id="initial_call_client_name" name="initial_call_client_name" maxlength="50">
                        </div>
                        <div class="col-md-3 right_text">Date:</div>
                        <div class="col-md-2 right_field">
                            <input type="text" id="initial_call_date" name="initial_call_date" maxlength="50">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 left_text">Origin of the call to CCRT:</div>
                        <div class="col-md-3 left_field">
                            <input type="text" id="initial_call_origin" name="initial_call_origin" maxlength="50">
                        </div>
                        <div class="col-md-3 right_text">Time of 1st call to SOC:</div>
                        <div class="col-md-2 right_field">
                            <input type="text" id="initial_call_time" name="initial_call_time" maxlength="50">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 left_text">CCRT Field Staff:</div>
                        <div class="col-md-3 left_field">
                            <select id="initial_call_staff_name" name="initial_call_staff_name">
                                <option value="staff1">Staff 1</option>
                                <option value="staff2">Staff 2</option>
                                <option value="staff3">Staff 3</option>
                            </select>
                        </div>
                        <div class="col-md-3 right_text">Client's DOB:</div>
                        <div class="col-md-2 right_field">
                            <input type="text" id="initial_call_client_dob" name="initial_call_client_dob" maxlength="50">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 left_text">CCRT Field Staff Location:</div>
                        <div class="col-md-3 left_field">
                            <input type="text" id="initial_call_staff_location" name="initial_call_staff_location" maxlength="50">
                        </div>
                        <div class="col-md-5">&nbsp;</div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 left_text">CCRT Staff Person on the Phone:</div>
                        <div class="col-md-3 left_field">
                            <select id="initial_call_staff_on_phone" name="initial_call_staff_on_phone">
                                <option value="staff1">Staff 1</option>
                                <option value="staff2">Staff 2</option>
                                <option value="staff3">Staff 3</option>
                            </select>
                        </div>
                        <div class="col-md-5">&nbsp;</div>
                    </div>
                </div>
            </div>

            <div class="panel panel-default second_call">
                <div class="panel-body">
                    <h4><b>Second Call</b></h4>
                    <div class="row">
                        <div class="col-md-4 left_text">CCRT Staff Person on the Phone:</div>
                        <div class="col-md-3 left_field">
                            <select id="second_call_staff_on_phone" name="second_call_staff_on_phone">
                                <option value="staff1">Staff 1</option>
                                <option value="staff2">Staff 2</option>
                                <option value="staff3">Staff 3</option>
                            </select>
                        </div>
                        <div class="col-md-3 right_text">Time of Call:</div>
                        <div class="col-md-2 right_field">
                            <input type="text" id="second_call_time" name="second_call_time" maxlength="50">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 left_text">Description of Situation:</div>
                        <div class="col-md-3 left_field">
                            <input type="text" id="second_call_description" name="second_call_description" maxlength="50">
                        </div>
                        <div class="col-md-5">&nbsp;</div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 left_text">SOC Recommendation:</div>
                        <div class="col-md-3 left_field">
                            <input type="text" id="second_call_soc_recommendation" name="second_call_soc_recommendation" maxlength="50">
                        </div>
                        <div class="col-md-5">&nbsp;</div>
                    </div>
                </div>
            </div>

            <div class="panel panel-default third_call">
                <div class="panel-body">
                    <h4><b>Third Call</b></h4>
                    <div class="row">
                        <div class="col-md-4 left_text">CCRT Staff Person on the Phone:</div>
                        <div class="col-md-3 left_field">
                            <select id="third_call_staff_on_phone" name="third_call_staff_on_phone">
                                <option value="staff1">Staff 1</option>
                                <option value="staff2">Staff 2</option>
                                <option value="staff3">Staff 3</option>
                            </select>
                        </div>
                        <div class="col-md-3 right_text">Time of Call:</div>
                        <div class="col-md-2 right_field">
                            <input type="text" id="third_call_time" name="third_call_time" maxlength="50">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 left_text">Description of Situation:</div>
                        <div class="col-md-3 left_field">
                            <input type="text" id="third_call_description" name="third_call_description" maxlength="50">
                        </div>
                        <div class="col-md-5">&nbsp;</div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 left_text">SOC Recommendation:</div>
                        <div class="col-md-3 left_field">
                            <input type="text" id="third_call_soc_recommendation" name="third_call_soc_recommendation" maxlength="50">
                        </div>
                        <div class="col-md-5">&nbsp;</div>
                    </div>
                </div>
            </div>

            <div class="panel panel-default disposition">
                <div class="panel-body">
                    <h4><b>Disposition</b></h4>
                    <div class="row">
                        <div class="col-md-4 left_text">CCRT Staff Person on the Phone:</div>
                        <div class="col-md-3 left_field">
                            <select id="disposition_staff_on_phone" name="disposition_staff_on_phone">
                                <option value="staff1">Staff 1</option>
                                <option value="staff2">Staff 2</option>
                                <option value="staff3">Staff 3</option>
                            </select>
                        </div>
                        <div class="col-md-3 right_text">Time staff left the scene:</div>
                        <div class="col-md-2 right_field">
                            <input type="text" id="time_staff_left_scene" name="time_staff_left_scene" maxlength="50">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 left_text">Disposition of Client/Incident:</div>
                        <div class="col-md-3 left_field">
                            <input type="text" id="disposition_of_client_incident" name="disposition_of_client_incident" maxlength="50">
                        </div>
                        <div class="col-md-5">&nbsp;</div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 left_text">If incident continued to the next shift:</div>
                        <div class="col-md-7">&nbsp;</div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 left_text">Incident handed off to SOC:</div>
                        <div class="col-md-3 left_field">
                            <select id="disposition_staff_handed_to" name="disposition_staff_handed_to">
                                <option value="staff1">Staff 1</option>
                                <option value="staff2">Staff 2</option>
                                <option value="Last Name, First Name">Name Test</option>
                            </select>
                        </div>
                        <div class="col-md-3 right_text">Time incident handed off:</div>
                        <div class="col-md-2 right_field">
                            <input type="text" id="time_incident_handed_off" name="time_incident_handed_off" maxlength="50">
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel panel-default button_panel">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4"><a class="btn btn-primary" href="../../">Return Home</a></div>
                        <div class="col-md-4">
                            <button class="btn btn-primary" type="reset" id="clear">Reset Fields</button>
                        </div>
                        <div class="col-md-4">
                            <button class="btn btn-primary" type="submit" id="send">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <% else %>
        <br>
        <br>
        <br>
        <% = sendstatus %>
        <% end if %>
    </div>
    <script src="js/jquery-1.12.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/moment.min.js"></script>
    <script src="js/bootstrap-datetimepicker.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $('#initial_call_date').datetimepicker({
                format: 'L'
            });

            $('#initial_call_time').datetimepicker({
                format: 'LT'
            });

            $('#initial_call_client_dob').datetimepicker({
                format: 'L'
            });

            $('#second_call_time').datetimepicker({
                format: 'LT'
            });

            $('#third_call_time').datetimepicker({
                format: 'LT'
            });

            $('#time_staff_left_scene').datetimepicker({
                format: 'LT'
            });

            $('#time_incident_handed_off').datetimepicker({
                format: 'LT'
            });
        });
    </script>
</body>

</html>
