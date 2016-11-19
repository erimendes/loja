package com.itchyno.iteff.web;
import com.itchyno.iteff.domain.Equipamento;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/equipamentoes")
@Controller
@RooWebScaffold(path = "equipamentoes", formBackingObject = Equipamento.class)
public class EquipamentoController {
}
