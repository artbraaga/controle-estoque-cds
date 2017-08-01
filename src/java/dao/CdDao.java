/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import modelo.Cd;

/**
 *
 * @author DesenvolvedorJava
 */
public class CdDao {
    private EntityManager em;
    public void cadastrarCd(Cd cd){
        EntityManagerFactory factory = 
                Persistence.createEntityManagerFactory("HelloSpringPU");
        
        EntityManager enManager = factory.createEntityManager();
        enManager.getTransaction().begin();
        enManager.persist(cd);
        enManager.getTransaction().commit();
        enManager.close();
    }
    public void editarCd(Cd cd){
        EntityManagerFactory factory = 
                Persistence.createEntityManagerFactory("HelloSpringPU");
        
        EntityManager enManager = factory.createEntityManager();
        enManager.getTransaction().begin();
        Cd cdDB = enManager.find(Cd.class, cd.getId());
        cdDB.setTitulo(cd.getTitulo());
        cdDB.setArtista(cd.getArtista());
        cdDB.setLancamento(cd.getLancamento());
        cdDB.setGenero(cd.getGenero());
        enManager.merge(cdDB);
        enManager.getTransaction().commit();
        enManager.close();
    }
    
    public void excluirCd(int id){
        EntityManagerFactory factory;
        factory = Persistence.createEntityManagerFactory("HelloSpringPU");
        
        EntityManager enManager = factory.createEntityManager();
        enManager.getTransaction().begin();
        Cd cd = enManager.find(Cd.class, id);
        enManager.remove(cd);
        enManager.getTransaction().commit();
        enManager.close();
    }
    
    public List<Cd> listarCds(){
        EntityManagerFactory factory = 
            Persistence.createEntityManagerFactory("HelloSpringPU");
        
        EntityManager entity = factory.createEntityManager();
        entity.getTransaction().begin();
        List listaCds = entity.createQuery("Select c from Cd as c").getResultList();
        entity.close();
        return listaCds;
    }
}
