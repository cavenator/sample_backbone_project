<html>
  <head><title>Multi-Product Ad Unit Prototype</title>
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="jquery-ui/js/jquery-ui-1.10.2.custom.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="underscore.js"></script>
	<script type="text/javascript" src="backbone.js"></script>
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css">
	<link href="jquery-ui/css/ui-lightness/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css">
	<style>
		.draggable { width: 200px; height: 200px; padding: 0.5em; float: left; margin: 10px 10px 10px 0; background-color: grey}
  		#container { width: 300px; height: 900px; padding: 0.5em; float: right; margin: 10px; background-color: lightblue}
	</style>
	<script>
	  $(function() {
	    $( ".draggable" ).draggable({ appendTo: "body", helper: "clone" });
	    $( "#container" ).droppable({
	      hoverClass: "ui-state-active",
	      drop: function( event, ui ) {}  
	    });
	    var Box = Backbone.Model.extend({
		initialize: function(){
			this.set({isInContainer:false});
		},
		promptColor: function(){
		   var cssColor = prompt("New Color");
		   this.set({color:cssColor});
		},
		inContainer: function(){
		   this.set({isInContainer: true});
		}
	    });
	    var BoxView = Backbone.View.extend({

		   initialize: function() {
			this.listenTo(this.model,'change:isInContainer', function(){
			   var isInContainer = this.model.get("isInContainer");
			   if (isInContainer)
				this.$el.hide();
			   else
				this.$el.show();
		   	});  
			this.model.set({viewId:this.$el.prop("id")});		
		   },

		   events: {
			"click #colorChanger": "changeColor",
			"click #toJson": "spitModelJsonOut"
		   },

		   changeColor: function(){
			this.model.promptColor();
			this.$el.css('background-color', this.model.get('color'));
		   },
		   spitModelJsonOut: function(){
			alert(JSON.stringify(this.model));
		   }	
 	   });

	    var ContainerView = Backbone.View.extend({
		el: $("#container"),

		events: {
		    "drop":"dropped"
		},
	
		dropped: function(event, ui){
			console.log(ui.draggable.html());
			var self = this;
			var elemId = ui.draggable.prop("id");
			var targetElem = self.model.find(function(elem){ return elem.get("viewId") == elemId });
			var copyElem = $("<div class='draggable'></div>");
			copyElem.html(ui.draggable.html()).css('background-color',targetElem.get("color"));
			copyElem.appendTo(this.$el.find("#elemContainer"));
			targetElem.inContainer();
		}

	    });

	    var Boxes = Backbone.Collection.extend({
		model:Box	
	    });
	    var boxes = new Boxes;
	    var boxViewArray = [];
	    $.each($(".draggable"), function(index, data){
		var id = $(data).prop("id"), boxName = "box"+(index+1);
		var elementId = "#"+id;
		var modelBox = new Box({name:boxName});
		boxViewArray.push(new BoxView({model: modelBox, el:$(elementId)}));
		boxes.add(modelBox);	
	    });

	    var container = new ContainerView({model: boxes});
	    window.container = container;
	    window.boxCollection = boxes;
	    window.viewCollection = boxViewArray;
	  });
	</script>
  </head>
  <body>
    <h1>Multi-Product Ad Unit protoype</h1>
	<div class="row">
	   <div class="span4">
		<div id="draggable1" class="draggable">
  			<button id="colorChanger">Change Color</button>
			<button id="toJson">To Json</button>
		</div>
		<div id="draggable2" class="draggable">
  			<button id="colorChanger">Change Color</button>
			<button id="toJson">To Json</button>
		</div>
		<div id="draggable3" class="draggable">
  			<button id="colorChanger">Change Color</button>
			<button id="toJson">To Json</button>
		</div>

	   </div>
	   <div class="span4">
 
		<div id="container" class="ui-widget-header">
		  <p>Drop here</p>
		  <div id="elemContainer"></div>
		</div>
	   </div>
	</div>
</body>
</html>

