<html>
<head>
<title>Hello :: Spring Application</title></head>
  <body>
    <h1>Hello - Spring Application</h1>
    <p>Greetings.  This is being <b>broadcasted</b> from a different directory</p>
    <p>${message}</p>
    <p>
	<button id="standard">Create hibernate object!</button>
    </p>
    <p>
	<button id="custom">Add a new person</button>
    </p>
  </body>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" ></script>
   <script>
	$(document).ready(function(){
		$("button#standard").click(function(){
		    window.open("/maven_spring-1.0-SNAPSHOT/create_object.html");
		});
		$("button#custom").click(function(){
		    window.open("/maven_spring-1.0-SNAPSHOT/add_person.html");
		});
	  });
   </script>
</html>
