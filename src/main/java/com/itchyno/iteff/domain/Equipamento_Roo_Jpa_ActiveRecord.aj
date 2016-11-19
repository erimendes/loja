// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.itchyno.iteff.domain;

import com.itchyno.iteff.domain.Equipamento;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Equipamento_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Equipamento.entityManager;
    
    public static final List<String> Equipamento.fieldNames4OrderClauseFilter = java.util.Arrays.asList("codigo", "ean13", "descricao", "tipo", "quantidade", "valorCompra", "valorVenda", "dataCompra", "usuarioCadastro");
    
    public static final EntityManager Equipamento.entityManager() {
        EntityManager em = new Equipamento().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Equipamento.countEquipamentoes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Equipamento o", Long.class).getSingleResult();
    }
    
    public static List<Equipamento> Equipamento.findAllEquipamentoes() {
        return entityManager().createQuery("SELECT o FROM Equipamento o", Equipamento.class).getResultList();
    }
    
    public static List<Equipamento> Equipamento.findAllEquipamentoes(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Equipamento o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Equipamento.class).getResultList();
    }
    
    public static Equipamento Equipamento.findEquipamento(Long id) {
        if (id == null) return null;
        return entityManager().find(Equipamento.class, id);
    }
    
    public static List<Equipamento> Equipamento.findEquipamentoEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Equipamento o", Equipamento.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Equipamento> Equipamento.findEquipamentoEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Equipamento o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Equipamento.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Equipamento.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Equipamento.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Equipamento attached = Equipamento.findEquipamento(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Equipamento.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Equipamento.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Equipamento Equipamento.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Equipamento merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
