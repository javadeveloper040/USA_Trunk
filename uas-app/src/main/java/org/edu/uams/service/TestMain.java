/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/

package org.edu.uams.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.edu.uams.pojo.UsersEntity;


public class TestMain {
    
    private static final String PERSISTENCE_UNIT_NAME = "TestAppPU";
    private static EntityManagerFactory factory;
    
    public static void main(String[] args) {
      factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
      EntityManager em = factory.createEntityManager();
      // read the existing entries and write to console

      Query q = em.createNamedQuery(UsersEntity.USER_MASTER_FIND_ALL);
      List<UsersEntity> todoList = q.getResultList();
      for (UsersEntity todo : todoList) {
          System.out.println(""+todo.getUserName());
      }
      System.out.println("Size: " + todoList.size());
      
      // create new todo
      em.getTransaction().begin();
      //UsersTab todo = new UsersTab();
     // em.persist(todo);
      em.getTransaction().commit();
      em.close();
        
      
        
    }
}
