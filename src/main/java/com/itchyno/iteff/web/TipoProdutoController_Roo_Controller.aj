// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.itchyno.iteff.web;

import com.itchyno.iteff.domain.Ambiente;
import com.itchyno.iteff.domain.TipoProduto;
import com.itchyno.iteff.web.TipoProdutoController;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect TipoProdutoController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String TipoProdutoController.create(@Valid TipoProduto tipoProduto, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, tipoProduto);
            return "tipoprodutoes/create";
        }
        uiModel.asMap().clear();
        tipoProduto.persist();
        return "redirect:/tipoprodutoes/" + encodeUrlPathSegment(tipoProduto.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String TipoProdutoController.createForm(Model uiModel) {
        populateEditForm(uiModel, new TipoProduto());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Ambiente.countAmbientes() == 0) {
            dependencies.add(new String[] { "codigo", "ambientes" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "tipoprodutoes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String TipoProdutoController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("tipoproduto", TipoProduto.findTipoProduto(id));
        uiModel.addAttribute("itemId", id);
        return "tipoprodutoes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String TipoProdutoController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("tipoprodutoes", TipoProduto.findTipoProdutoEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) TipoProduto.countTipoProdutoes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("tipoprodutoes", TipoProduto.findAllTipoProdutoes(sortFieldName, sortOrder));
        }
        return "tipoprodutoes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String TipoProdutoController.update(@Valid TipoProduto tipoProduto, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, tipoProduto);
            return "tipoprodutoes/update";
        }
        uiModel.asMap().clear();
        tipoProduto.merge();
        return "redirect:/tipoprodutoes/" + encodeUrlPathSegment(tipoProduto.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String TipoProdutoController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, TipoProduto.findTipoProduto(id));
        return "tipoprodutoes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String TipoProdutoController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        TipoProduto tipoProduto = TipoProduto.findTipoProduto(id);
        tipoProduto.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/tipoprodutoes";
    }
    
    void TipoProdutoController.populateEditForm(Model uiModel, TipoProduto tipoProduto) {
        uiModel.addAttribute("tipoProduto", tipoProduto);
        uiModel.addAttribute("ambientes", Ambiente.findAllAmbientes());
    }
    
    String TipoProdutoController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
