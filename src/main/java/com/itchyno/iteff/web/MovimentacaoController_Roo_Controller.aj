// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.itchyno.iteff.web;

import com.itchyno.iteff.domain.Ambiente;
import com.itchyno.iteff.domain.Equipamento;
import com.itchyno.iteff.domain.Movimentacao;
import com.itchyno.iteff.domain.Produto;
import com.itchyno.iteff.domain.TipoMovimentacao;
import com.itchyno.iteff.domain.Usuario;
import com.itchyno.iteff.web.MovimentacaoController;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect MovimentacaoController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String MovimentacaoController.create(@Valid Movimentacao movimentacao, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, movimentacao);
            return "movimentacaos/create";
        }
        uiModel.asMap().clear();
        movimentacao.persist();
        return "redirect:/movimentacaos/" + encodeUrlPathSegment(movimentacao.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String MovimentacaoController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Movimentacao());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Ambiente.countAmbientes() == 0) {
            dependencies.add(new String[] { "codigo", "ambientes" });
        }
        if (TipoMovimentacao.countTipoMovimentacaos() == 0) {
            dependencies.add(new String[] { "tipo", "tipomovimentacaos" });
        }
        if (Produto.countProdutoes() == 0) {
            dependencies.add(new String[] { "produto", "produtoes" });
        }
        if (Equipamento.countEquipamentoes() == 0) {
            dependencies.add(new String[] { "equipamento", "equipamentoes" });
        }
        if (Usuario.countUsuarios() == 0) {
            dependencies.add(new String[] { "usuarioCadastro", "usuarios" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "movimentacaos/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String MovimentacaoController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("movimentacao", Movimentacao.findMovimentacao(id));
        uiModel.addAttribute("itemId", id);
        return "movimentacaos/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String MovimentacaoController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("movimentacaos", Movimentacao.findMovimentacaoEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Movimentacao.countMovimentacaos() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("movimentacaos", Movimentacao.findAllMovimentacaos(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "movimentacaos/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String MovimentacaoController.update(@Valid Movimentacao movimentacao, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, movimentacao);
            return "movimentacaos/update";
        }
        uiModel.asMap().clear();
        movimentacao.merge();
        return "redirect:/movimentacaos/" + encodeUrlPathSegment(movimentacao.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String MovimentacaoController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Movimentacao.findMovimentacao(id));
        return "movimentacaos/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String MovimentacaoController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Movimentacao movimentacao = Movimentacao.findMovimentacao(id);
        movimentacao.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/movimentacaos";
    }
    
    void MovimentacaoController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("movimentacao_criacao_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void MovimentacaoController.populateEditForm(Model uiModel, Movimentacao movimentacao) {
        uiModel.addAttribute("movimentacao", movimentacao);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("ambientes", Ambiente.findAllAmbientes());
        uiModel.addAttribute("equipamentoes", Equipamento.findAllEquipamentoes());
        uiModel.addAttribute("produtoes", Produto.findAllProdutoes());
        uiModel.addAttribute("tipomovimentacaos", TipoMovimentacao.findAllTipoMovimentacaos());
        uiModel.addAttribute("usuarios", Usuario.findAllUsuarios());
    }
    
    String MovimentacaoController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
