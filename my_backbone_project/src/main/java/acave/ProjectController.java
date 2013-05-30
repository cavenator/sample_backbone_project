package acave;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*; 
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;
import org.codehaus.jackson.map.*;
import org.springframework.http.*; 
import javax.servlet.http.*;
import java.util.*;
import java.io.IOException;
import java.io.StringWriter;
import org.codehaus.jackson.JsonEncoding;
import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.MappingJsonFactory;

@Controller
public class ProjectController {
     
    @RequestMapping("/backup")
    public ResponseEntity<String> handle(){
	return new ResponseEntity<String>("I am the backup! Please return to the index page.<hr><a href=\"/apps_prototype-1.0-SNAPSHOT/index.jsp\">Click me here</a></hr>", HttpStatus.OK);
    }
}
