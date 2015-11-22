package webapp;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/**")
@RestController
public class Controller {

    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return "Welcome to WEBAPP Version 1";
    }
}
