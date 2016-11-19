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

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Equipamento {

    /**
     */
    @NotNull
    @ManyToOne
    private Ambiente codigo;

    /**
     */
    @NotNull
    private Long ean13;

    /**
     */
    @NotNull
    private String descricao;

    /**
     */
    @NotNull
    @ManyToOne
    private TipoEquipamento tipo;

    /**
     */
    @NotNull
    private Long quantidade;

    /**
     */
    @NotNull
    private Double valorCompra;

    /**
     */
    private Double valorVenda;

    /**
     */
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date dataCompra;

    /**
     */
    @NotNull
    @ManyToOne
    private Usuario usuarioCadastro;
}
