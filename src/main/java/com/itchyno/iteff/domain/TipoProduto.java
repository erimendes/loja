package com.itchyno.iteff.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class TipoProduto {

    /**
     */
    @NotNull
    @ManyToOne
    private Ambiente codigo;

    /**
     */
    @NotNull
    @Size(max = 255)
    private String nome;

    /**
     */
    @NotNull
    @Size(max = 255)
    private String categoria;
}
