package com.itchyno.iteff.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Ambiente {

    /**
     */
    @NotNull
    @Size(min = 3, max = 3)
    private String codigo;

    /**
     */
    @NotNull
    @Size(max = 255)
    private String descricao;

    /**
     */
    @NotNull
    private Boolean indAtivo;
}
