// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.itchyno.iteff.domain;

import com.itchyno.iteff.domain.Ambiente;
import com.itchyno.iteff.domain.Produto;
import com.itchyno.iteff.domain.TipoProduto;
import com.itchyno.iteff.domain.Usuario;
import java.util.Date;

privileged aspect Produto_Roo_JavaBean {
    
    public Ambiente Produto.getCodigo() {
        return this.codigo;
    }
    
    public void Produto.setCodigo(Ambiente codigo) {
        this.codigo = codigo;
    }
    
    public Long Produto.getEan13() {
        return this.ean13;
    }
    
    public void Produto.setEan13(Long ean13) {
        this.ean13 = ean13;
    }
    
    public String Produto.getNome() {
        return this.nome;
    }
    
    public void Produto.setNome(String nome) {
        this.nome = nome;
    }
    
    public String Produto.getDescricao() {
        return this.descricao;
    }
    
    public void Produto.setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
    public TipoProduto Produto.getTipo() {
        return this.tipo;
    }
    
    public void Produto.setTipo(TipoProduto tipo) {
        this.tipo = tipo;
    }
    
    public String Produto.getFabricante() {
        return this.fabricante;
    }
    
    public void Produto.setFabricante(String fabricante) {
        this.fabricante = fabricante;
    }
    
    public Long Produto.getQuantidade() {
        return this.quantidade;
    }
    
    public void Produto.setQuantidade(Long quantidade) {
        this.quantidade = quantidade;
    }
    
    public Double Produto.getValorCompra() {
        return this.valorCompra;
    }
    
    public void Produto.setValorCompra(Double valorCompra) {
        this.valorCompra = valorCompra;
    }
    
    public Double Produto.getValorVenda() {
        return this.valorVenda;
    }
    
    public void Produto.setValorVenda(Double valorVenda) {
        this.valorVenda = valorVenda;
    }
    
    public Date Produto.getDataCompra() {
        return this.dataCompra;
    }
    
    public void Produto.setDataCompra(Date dataCompra) {
        this.dataCompra = dataCompra;
    }
    
    public Usuario Produto.getUsuarioCadastro() {
        return this.usuarioCadastro;
    }
    
    public void Produto.setUsuarioCadastro(Usuario usuarioCadastro) {
        this.usuarioCadastro = usuarioCadastro;
    }
    
}
