// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.itchyno.iteff.web;

import com.itchyno.iteff.domain.Ambiente;
import com.itchyno.iteff.domain.TipoEquipamento;
import com.itchyno.iteff.web.TipoEquipamentoController;
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

privileged aspect TipoEquipamentoController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String TipoEquipamentoController.create(@Valid TipoEquipamento tipoEquipamento, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, tipoEquipamento);
            return "tipoequipamentoes/create";
        }
        uiModel.asMap().clear();
        tipoEquipamento.persist();
        return "redirect:/tipoequipamentoes/" + encodeUrlPathSegment(tipoEquipamento.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String TipoEquipamentoController.createForm(Model uiModel) {
        populateEditForm(uiModel, new TipoEquipamento());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Ambiente.countAmbientes() == 0) {
            dependencies.add(new String[] { "codigo", "ambientes" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "tipoequipamentoes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String TipoEquipamentoController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("tipoequipamento", TipoEquipamento.findTipoEquipamento(id));
        uiModel.addAttribute("itemId", id);
        return "tipoequipamentoes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String TipoEquipamentoController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("tipoequipamentoes", TipoEquipamento.findTipoEquipamentoEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) TipoEquipamento.countTipoEquipamentoes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("tipoequipamentoes", TipoEquipamento.findAllTipoEquipamentoes(sortFieldName, sortOrder));
        }
        return "tipoequipamentoes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String TipoEquipamentoController.update(@Valid TipoEquipamento tipoEquipamento, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, tipoEquipamento);
            return "tipoequipamentoes/update";
        }
        uiModel.asMap().clear();
        tipoEquipamento.merge();
        return "redirect:/tipoequipamentoes/" + encodeUrlPathSegment(tipoEquipamento.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String TipoEquipamentoController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, TipoEquipamento.findTipoEquipamento(id));
        return "tipoequipamentoes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String TipoEquipamentoController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        TipoEquipamento tipoEquipamento = TipoEquipamento.findTipoEquipamento(id);
        tipoEquipamento.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/tipoequipamentoes";
    }
    
    void TipoEquipamentoController.populateEditForm(Model uiModel, TipoEquipamento tipoEquipamento) {
        uiModel.addAttribute("tipoEquipamento", tipoEquipamento);
        uiModel.addAttribute("ambientes", Ambiente.findAllAmbientes());
    }
    
    String TipoEquipamentoController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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