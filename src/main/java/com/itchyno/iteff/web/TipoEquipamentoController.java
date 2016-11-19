package com.itchyno.iteff.web;
import com.itchyno.iteff.domain.TipoEquipamento;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/tipoequipamentoes")
@Controller
@RooWebScaffold(path = "tipoequipamentoes", formBackingObject = TipoEquipamento.class)
public class TipoEquipamentoController {
}
