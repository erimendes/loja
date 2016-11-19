// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.itchyno.iteff.web;

import com.itchyno.iteff.domain.Ambiente;
import com.itchyno.iteff.domain.Equipamento;
import com.itchyno.iteff.domain.TipoEquipamento;
import com.itchyno.iteff.domain.Usuario;
import com.itchyno.iteff.web.EquipamentoController;
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

privileged aspect EquipamentoController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String EquipamentoController.create(@Valid Equipamento equipamento, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, equipamento);
            return "equipamentoes/create";
        }
        uiModel.asMap().clear();
        equipamento.persist();
        return "redirect:/equipamentoes/" + encodeUrlPathSegment(equipamento.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String EquipamentoController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Equipamento());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Ambiente.countAmbientes() == 0) {
            dependencies.add(new String[] { "codigo", "ambientes" });
        }
        if (TipoEquipamento.countTipoEquipamentoes() == 0) {
            dependencies.add(new String[] { "tipo", "tipoequipamentoes" });
        }
        if (Usuario.countUsuarios() == 0) {
            dependencies.add(new String[] { "usuarioCadastro", "usuarios" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "equipamentoes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String EquipamentoController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("equipamento", Equipamento.findEquipamento(id));
        uiModel.addAttribute("itemId", id);
        return "equipamentoes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String EquipamentoController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("equipamentoes", Equipamento.findEquipamentoEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Equipamento.countEquipamentoes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("equipamentoes", Equipamento.findAllEquipamentoes(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "equipamentoes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String EquipamentoController.update(@Valid Equipamento equipamento, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, equipamento);
            return "equipamentoes/update";
        }
        uiModel.asMap().clear();
        equipamento.merge();
        return "redirect:/equipamentoes/" + encodeUrlPathSegment(equipamento.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String EquipamentoController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Equipamento.findEquipamento(id));
        return "equipamentoes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String EquipamentoController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Equipamento equipamento = Equipamento.findEquipamento(id);
        equipamento.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/equipamentoes";
    }
    
    void EquipamentoController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("equipamento_datacompra_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void EquipamentoController.populateEditForm(Model uiModel, Equipamento equipamento) {
        uiModel.addAttribute("equipamento", equipamento);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("ambientes", Ambiente.findAllAmbientes());
        uiModel.addAttribute("tipoequipamentoes", TipoEquipamento.findAllTipoEquipamentoes());
        uiModel.addAttribute("usuarios", Usuario.findAllUsuarios());
    }
    
    String EquipamentoController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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