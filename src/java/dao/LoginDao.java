/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import modelo.Login;

/**
 *
 * @author DesenvolvedorJava
 */
public class LoginDao {
    
    public void cadastrarLogin(Login login){
        EntityManagerFactory factory = 
                Persistence.createEntityManagerFactory("HelloSpringPU");
        
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        em.persist(login);
       
        em.getTransaction().commit();
        em.close();
    }
    
    public boolean validarUsuario(Login login){
        EntityManagerFactory factory = 
                Persistence.createEntityManagerFactory("HelloSpringPU");
        
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        
        Login l = em.find(Login.class, login.getLogin());
        em.close();
        if(l != null && l.getSenha().equals(login.getSenha())){
            return true;
        }
        
        return false;
    }
    
}
