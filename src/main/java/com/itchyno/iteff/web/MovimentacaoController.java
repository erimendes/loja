package com.itchyno.iteff.web;
import com.itchyno.iteff.domain.Movimentacao;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/movimentacaos")
@Controller
@RooWebScaffold(path = "movimentacaos", formBackingObject = Movimentacao.class)
public class MovimentacaoController {
}
