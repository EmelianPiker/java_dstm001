package dstm001.block_explorer;

import nz.net.ultraq.thymeleaf.LayoutDialect;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.context.annotation.Bean;

@Controller
public class MainController {

  @GetMapping("/greeting")
  public String greeting(@RequestParam(name="name", required=false, defaultValue="World") String name, Model model) {
    model.addAttribute("name", name);
    return "greeting";
  }

  @Bean
  public LayoutDialect layoutDialect() {
    return new LayoutDialect();
  }

}
