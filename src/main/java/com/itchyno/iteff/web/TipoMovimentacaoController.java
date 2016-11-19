package com.itchyno.iteff.web;
import com.itchyno.iteff.domain.TipoMovimentacao;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/tipomovimentacaos")
@Controller
@RooWebScaffold(path = "tipomovimentacaos", formBackingObject = TipoMovimentacao.class)
public class TipoMovimentacaoController {
}
