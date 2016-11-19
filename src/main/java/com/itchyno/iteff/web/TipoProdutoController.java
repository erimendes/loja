package com.itchyno.iteff.web;
import com.itchyno.iteff.domain.TipoProduto;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/tipoprodutoes")
@Controller
@RooWebScaffold(path = "tipoprodutoes", formBackingObject = TipoProduto.class)
public class TipoProdutoController {
}
