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
public class Cliente {

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
    private String email;

    /**
     */
    private Integer numTelefone1;

    /**
     */
    private Integer numTelefone2;

    /**
     */
    private Integer numCelular1;

    /**
     */
    private Integer numCelular2;

    /**
     */
    @ManyToOne
    private Usuario nomeUsuario;

    /**
     */
    @Size(max = 255)
    private String nomeEndereco;

    /**
     */
    @Size(max = 50)
    private String compEndereco;

    /**
     */
    private Integer numEndereco;

    /**
     */
    @Size(max = 50)
    private String nomeCidade;

    /**
     */
    @Size(max = 50)
    private String nomeEstado;

    /**
     */
    @Size(max = 50)
    private String nomePais;
}
