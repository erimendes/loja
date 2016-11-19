package com.itchyno.iteff.web;
import com.itchyno.iteff.domain.Produto;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/produtoes")
@Controller
@RooWebScaffold(path = "produtoes", formBackingObject = Produto.class)
public class ProdutoController {
}
