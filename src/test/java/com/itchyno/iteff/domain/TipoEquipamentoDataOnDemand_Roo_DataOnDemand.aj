// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.itchyno.iteff.domain;

import com.itchyno.iteff.domain.Ambiente;
import com.itchyno.iteff.domain.AmbienteDataOnDemand;
import com.itchyno.iteff.domain.TipoEquipamento;
import com.itchyno.iteff.domain.TipoEquipamentoDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect TipoEquipamentoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TipoEquipamentoDataOnDemand: @Component;
    
    private Random TipoEquipamentoDataOnDemand.rnd = new SecureRandom();
    
    private List<TipoEquipamento> TipoEquipamentoDataOnDemand.data;
    
    @Autowired
    AmbienteDataOnDemand TipoEquipamentoDataOnDemand.ambienteDataOnDemand;
    
    public TipoEquipamento TipoEquipamentoDataOnDemand.getNewTransientTipoEquipamento(int index) {
        TipoEquipamento obj = new TipoEquipamento();
        setCategoria(obj, index);
        setCodigo(obj, index);
        setNome(obj, index);
        return obj;
    }
    
    public void TipoEquipamentoDataOnDemand.setCategoria(TipoEquipamento obj, int index) {
        String categoria = "categoria_" + index;
        if (categoria.length() > 255) {
            categoria = categoria.substring(0, 255);
        }
        obj.setCategoria(categoria);
    }
    
    public void TipoEquipamentoDataOnDemand.setCodigo(TipoEquipamento obj, int index) {
        Ambiente codigo = ambienteDataOnDemand.getRandomAmbiente();
        obj.setCodigo(codigo);
    }
    
    public void TipoEquipamentoDataOnDemand.setNome(TipoEquipamento obj, int index) {
        String nome = "nome_" + index;
        if (nome.length() > 255) {
            nome = nome.substring(0, 255);
        }
        obj.setNome(nome);
    }
    
    public TipoEquipamento TipoEquipamentoDataOnDemand.getSpecificTipoEquipamento(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        TipoEquipamento obj = data.get(index);
        Long id = obj.getId();
        return TipoEquipamento.findTipoEquipamento(id);
    }
    
    public TipoEquipamento TipoEquipamentoDataOnDemand.getRandomTipoEquipamento() {
        init();
        TipoEquipamento obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return TipoEquipamento.findTipoEquipamento(id);
    }
    
    public boolean TipoEquipamentoDataOnDemand.modifyTipoEquipamento(TipoEquipamento obj) {
        return false;
    }
    
    public void TipoEquipamentoDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = TipoEquipamento.findTipoEquipamentoEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'TipoEquipamento' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<TipoEquipamento>();
        for (int i = 0; i < 10; i++) {
            TipoEquipamento obj = getNewTransientTipoEquipamento(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
