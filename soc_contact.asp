<%
	if request.querystring("submit") = "2" then

			sendername = "Test Johnson"
            emailsubject = request.form("initial_call_staff_location")

            emailmessage = "############### Initial Call ###############" & "<br>" & vbcrlf
            emailmessage = emailmessage & "# Date: " & request.form("initial_call_date") & "<br>" & vbcrlf
            emailmessage = emailmessage & "# Time of 1st call to SOC: " & request.form("initial_call_time") & "<br>" & vbcrlf
            emailmessage = emailmessage & "# Client Name: " & request.form("initial_call_client_name") & "<br>" & vbcrlf
            emailmessage = emailmessage & "# Client's DOB: " & request.form("initial_call_client_dob") & "<br>" & vbcrlf
            emailmessage = emailmessage & "# Origin of the call to CCRT: " & request.form("initial_call_origin") & "<br>" & vbcrlf
            emailmessage = emailmessage & "# CCRT Field Staff: " & request.form("initial_call_staff_name") & "<br>" & vbcrlf
            emailmessage = emailmessage & "# CCRT Field Staff Location: " & request.form("initial_call_staff_location") & "<br>" & vbcrlf
            emailmessage = emailmessage & "# CCRT Staff Person on the Phone: " & request.form("initial_call_staff_on_phone") & "<br>" & vbcrlf
            emailmessage = emailmessage & "############################################" & "<br>" & vbcrlf
            emailmessage = emailmessage & "<br>" & vbcrlf
            emailmessage = emailmessage & "############### Second  Call ###############" & "<br>" & vbcrlf
            emailmessage = emailmessage & "# CCRT Staff Person on the Phone: " & request.form("second_call_staff_on_phone") & "<br>" & vbcrlf
            emailmessage = emailmessage & "# Time of Call: " & request.form("second_call_time") & "<br>" & vbcrlf
            emailmessage = emailmessage & "# Description of Situation: " & request.form("second_call_description") & "<br>" & vbcrlf
            emailmessage = emailmessage & "# SOC Recommendation: " & request.form("second_call_soc_recommendation") & "<br>" & vbcrlf
            emailmessage = emailmessage & "############################################" & "<br>" & vbcrlf
            emailmessage = emailmessage & "<br>" & vbcrlf
            emailmessage = emailmessage & "###############  Third Call  ###############" & "<br>" & vbcrlf
            emailmessage = emailmessage & "# CCRT Staff Person on the Phone: " & request.form("third_call_staff_on_phone") & "<br>" & vbcrlf
            emailmessage = emailmessage & "# Time of Call: " & request.form("third_call_time") & "<br>" & vbcrlf
            emailmessage = emailmessage & "# Description of Situation: " & request.form("third_call_description") & "<br>" & vbcrlf
            emailmessage = emailmessage & "# SOC Recommendation: " & request.form("third_call_soc_recommendation") & "<br>" & vbcrlf
            emailmessage = emailmessage & "############################################" & "<br>" & vbcrlf
            emailmessage = emailmessage & "<br>" & vbcrlf
            emailmessage = emailmessage & "############### Disposition  ###############" & "<br>" & vbcrlf
            emailmessage = emailmessage & "# CCRT Staff Person on the Phone: " & request.form("disposition_staff_on_phone") & "<br>" & vbcrlf
            emailmessage = emailmessage & "# Time staff left the scene: " & request.form("time_staff_left_scene") & "<br>" & vbcrlf
            emailmessage = emailmessage & "# Disposition of Client/Incident: " & request.form("disposition_of_client_incident") & "<br>" & vbcrlf
            emailmessage = emailmessage & "# Incident handed off to SOC: " & request.form("disposition_staff_handed_to") & "<br>" & vbcrlf
            emailmessage = emailmessage & "# Time incident handed off: " & request.form("time_incident_handed_off") & "<br>" & vbcrlf
            emailmessage = emailmessage & "############################################" & "<br>" & vbcrlf


			Set SMTP = CreateObject("EasyMail.SMTP.5")
		   	'SMTP.MailServer = "Mail.sbcounty.gov"   'Currently our Internal email server.
			SMTP.MailServer = "Mail.sbcounty.gov"   ' public email server
			SMTP.Subject = emailsubject
			SMTP.BodyText = emailmessage
			SMTP.BodyFormat = 1
			SMTP.From = request.form("sendername")
			SMTP.FromAddr = "webmaster@dbh.sbcounty.gov"


			'-----add recipients as many times as necessary--------------
			'SMTP.AddRecipient "WebMaster","webmaster@dbh.sbcounty.gov", 1
            SMTP.AddRecipient "Benjamin","benjamin.hager@dbh.sbcounty.gov", 1
			'------------------------------------------------------------

			SMTP.LicenseKey = "San Bernardino County ISD (Single Developer)/00105404104417008f00"
			x = SMTP.Send
			if x > 0 then
				sendstatus = "<font color='red'>There was a problem sending email. The error code is: " & x & "</font>"
			else
				sendstatus = "<div>Your message has been sent.</div>"
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
                                <option value="staff3">Staff 3</option>
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
</body>

</html>
