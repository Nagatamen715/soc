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
        <div class="county_logo" style="text-align: center;">
            <img src="soc_header.png" />
        </div>

        <!--<div class='county_logo' style='text-align: center;'><img src='soc_header.png' /></div><br>-->
        <%
	if request.querystring("submit") = "2" then

            emailsubject = request.form("initial_call_staff_location")
            emailsubject = emailsubject & " - " & request.form("initial_call_date") & " - " & request.form("initial_call_soc")

            emailmessage = "<div style='border:1px solid black;'><b><u>Initial Call</u></b>" & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Packet:</b> " & request.form("packets_radio") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>SOC:</b> " & request.form("initial_call_soc") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Date:</b> " & request.form("initial_call_date") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Client's Initials:</b> " & request.form("initial_call_client_initials") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Time of call to SOC:</b> " & request.form("initial_call_time") & "<br>" & vbcrlf            
            emailmessage = emailmessage & "<b>Origin of the call to CCRT:</b> " & request.form("initial_call_origin") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Client's DOB:</b> " & request.form("initial_call_client_dob") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>CCRT Field Staff:</b> " & request.form("initial_call_staff_name") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>CCRT Field Staff Location:</b> " & request.form("initial_call_staff_location") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>CCRT Staff Person on the Phone:</b> " & request.form("initial_call_staff_on_phone") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Description of Situation:</b> " & request.form("initial_call_description") & "<br></div>" & vbcrlf
            emailmessage = emailmessage & "<br>" & vbcrlf
            emailmessage = emailmessage & "<div style='border:1px solid black;'><b><u>Disposition</u></b>" & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Time staff left the scene:</b> " & request.form("time_staff_left_scene") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Disposition of Client/Incident:</b> " & request.form("disposition_of_client_incident") & "<br>" & vbcrlf
            emailmessage = emailmessage & "<b>Incident continued to the next shift:</b> " & request.form("incident_continued") & "<br>" & vbcrlf
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

			SMTP.LicenseKey = "San Bernardino County ISD (Single Developer)/00105404104417008f00"
			x = SMTP.Send
			if x > 0 then
				sendstatus = "<div style='text-align:center;' class='alert alert-danger' role='alert'>There was a problem sending email. The error code is: " & x & "</div>"
			else
				sendstatus = "<div style='text-align:center;' class='alert alert-success' role='alert'>Your message has been sent.<br><br>Click <a href='soc_contact.asp'>here</a> "
                sendstatus = sendstatus & "to send another record.<br><br>Click <a href='http://www.sbcounty.gov/dbh/index.asp'>here</a> to return to the DBH Home Page</div><br>"
			end if
			set smtp=Nothing
    end if
	if request.querystring("submit")<> "2" then %>

        <form action="soc_contact.asp?submit=2" method="POST">
            <div class="panel panel-default initial_call">
                <div class="panel-body">
                    <div class="row">

                        <div class="col-md-3 left_text">
                            <label for="packets_radio">Packets:</label></div>
                        <div class="col-md-2">
                            <label>
                                <input type="radio" name="packets_radio" id="packets_371" value="371">
                                371 </label>
                        </div>
                        <div class="col-md-2">
                            <label>
                                <input type="radio" name="packets_radio" id="packets_560" value="560">
                                560 </label>
                        </div>
                        <div class="col-md-2">
                            <label>
                                <input type="radio" name="packets_radio" id="packets_indirect" value="Indirect">
                                Indirect </label>
                        </div>

                    </div>

                    <h4><b>Initial Call</b></h4>

                    <div class="row">
                        <div class="col-md-4 left_text">
                            <label>SOC:</label></div>
                        <div class="col-md-3 left_field">
                            <input type="text" id="initial_call_soc" name="initial_call_soc" maxlength="50" class="form-control">
                        </div>
                        <div class="col-md-3 right_text">
                            <label for="initial_call_date">Date:</label></div>
                        <div class="col-md-2 right_field">
                            <input type="text" id="initial_call_date" name="initial_call_date" maxlength="15" class="soc_date form-control">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4 left_text">
                            <label for="initial_call_client_name">Client's Initials:</label></div>
                        <div class="col-md-3 left_field">
                            <input type="text" id="initial_call_client_initials" name="initial_call_client_initials" maxlength="10" class="form-control">
                        </div>
                        <div class="col-md-3 right_text">
                            <label for="initial_call_time">Time of call to SOC:</label></div>
                        <div class="col-md-2 right_field">
                            <input type="text" id="initial_call_time" name="initial_call_time" maxlength="15" class="soc_time form-control">
                        </div>
                        
                    </div>
                    <div class="row">
                        <div class="col-md-4 left_text">
                            <label for="initial_call_origin">Origin of the call to CCRT:</label></div>
                        <div class="col-md-3 left_field">
                            <input type="text" id="initial_call_origin" name="initial_call_origin" maxlength="50" class="form-control">
                        </div>
                        <div class="col-md-3 right_text">
                            <label for="initial_call_client_dob">Client's DOB:</label></div>
                        <div class="col-md-2 right_field">
                            <input type="text" id="initial_call_client_dob" name="initial_call_client_dob" maxlength="15" class="form-control">
                        </div>
                        
                    </div>
                    <div class="row">
                        <div class="col-md-4 left_text">
                            <label for="initial_call_staff_name">CCRT Field Staff:</label></div>
                        <div class="col-md-3 left_field">
                            <select id="initial_call_staff_name" name="initial_call_staff_name" class="selectList form-control">
                            </select>
                        </div>
                        <div class="col-md-5">&nbsp;</div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 left_text">
                            <label for="initial_call_staff_location">CCRT Field Staff Location:</label></div>
                        <div class="col-md-3 left_field">
                            <select id="initial_call_staff_location" name="initial_call_staff_location" class="form-control">
                                <option>East Valley</option>
                                <option>West Valley</option>
                                <option>High Desert</option>
                                <option>Morongo Basin</option>
                            </select>

                        </div>
                        <div class="col-md-5">&nbsp;</div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 left_text">
                            <label for="initial_call_staff_on_phone">CCRT Staff Person on the Phone:</label></div>
                        <div class="col-md-3 left_field">
                            <select id="initial_call_staff_on_phone" name="initial_call_staff_on_phone" class="selectList form-control">
                            </select>
                        </div>
                        <div class="col-md-5">&nbsp;</div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 left_text">
                            <label for="initial_call_description">Description of Situation:</label></div>
                        <div class="col-md-8 right_field">
                            <textarea id="initial_call_description" name="initial_call_description" rows="5" maxlength="500" class="form-control"></textarea>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel panel-default disposition">
                <div class="panel-body">
                    <h4><b>Disposition</b></h4>
                    <div class="row">
                        <div class="col-md-7">&nbsp</div>
                        <div class="col-md-3 right_text">
                            <label for="time_staff_left_scene">Time staff left the scene:</label></div>
                        <div class="col-md-2 right_field">
                            <input type="text" id="time_staff_left_scene" name="time_staff_left_scene" maxlength="15" class="soc_time form-control">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 left_text">
                            <label for="disposition_of_client_incident">Disposition of Client/Incident:</label></div>
                        <div class="col-md-8 right_field">
                            <textarea id="disposition_of_client_incident" name="disposition_of_client_incident" rows="5" maxlength="500" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 left_text">
                            <label for="incident_continued">Incident continued to the next shift:</label></div>
                        <div class="col-md-2">
                            <label>
                                <input type="radio" name="incident_continued" id="incident_continued_yes" value="Yes">
                                Yes </label>
                        </div>
                        <div class="col-md-2">
                            <label>
                                <input type="radio" name="incident_continued" id="incident_continued_no" value="No">
                                No </label>
                        </div>
                        <div class="col-md-4">&nbsp;</div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 left_text"><label for="disposition_staff_handed_to">Incident handed off to SOC:</label></div>
                        <div class="col-md-3 left_field">
                            <select id="disposition_staff_handed_to" name="disposition_staff_handed_to" class="selectList form-control">
                            </select>
                        </div>
                        <div class="col-md-3 right_text"><label for="time_incident_handed_off">Time incident handed off:</label></div>
                        <div class="col-md-2 right_field">
                            <input type="text" id="time_incident_handed_off" name="time_incident_handed_off" maxlength="15" class="soc_time form-control">
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
    <script src="js/dropdown.js"></script>

</body>

</html>


