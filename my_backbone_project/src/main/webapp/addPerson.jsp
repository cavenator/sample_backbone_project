<html>
    <head>
    	<title>Add People</title>
    </head>
    <body>
	<h1>Add Person to Frankenstein Application</h1>
	<p><h3>Please add some CSS to me (or some Jquery UI or Twitter bootstrap or something).  MAKE ME PRETTY!</h3></p>
	<p>
        <form action="/maven_spring-1.0-SNAPSHOT/person.html"  method="POST">
	    <label for="first_name">First Name: </label>
	    <input type="text" id="first_name" name="first_name" /><br/><br/>
	    <label for="last_name">Last Name: </label>
	    <input type="text" id="last_name"  name="last_name" /><br/><br/>
	    <label for="age">Age: </label>
	    <input type="text" id="age"	       name="age"  /><br/>
	    <input type="submit" id="submitButton" />
	</form>
	</p>
    </body>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>
</html>
