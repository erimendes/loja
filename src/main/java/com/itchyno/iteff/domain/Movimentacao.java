package com.itchyno.iteff.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Movimentacao {

    /**
     */
    @NotNull
    @ManyToOne
    private Ambiente codigo;

    /**
     */
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date criacao;

    /**
     */
    @NotNull
    @ManyToOne
    private TipoMovimentacao tipo;

    /**
     */
    @Size(max = 255)
    private String nota;

    /**
     */
    @Size(max = 255)
    private String serie;

    /**
     */
    @NotNull
    @ManyToOne
    private Produto produto;

    /**
     */
    @NotNull
    @ManyToOne
    private Equipamento equipamento;

    /**
     */
    @NotNull
    private Long quantidade;

    /**
     */
    @NotNull
    private Double valorUnitario;

    /**
     */
    @NotNull
    private Double valorTotal;

    /**
     */
    private Boolean indCancelamento;

    /**
     */
    @NotNull
    @ManyToOne
    private Usuario usuarioCadastro;
}
