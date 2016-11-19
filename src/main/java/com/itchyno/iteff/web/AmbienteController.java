package com.itchyno.iteff.web;
import com.itchyno.iteff.domain.Ambiente;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/ambientes")
@Controller
@RooWebScaffold(path = "ambientes", formBackingObject = Ambiente.class)
public class AmbienteController {
}
