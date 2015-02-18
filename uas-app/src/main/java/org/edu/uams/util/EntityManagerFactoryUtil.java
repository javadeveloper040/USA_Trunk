package org.edu.uams.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EntityManagerFactoryUtil {

	private static final String PERSISTENCE_UNIT_NAME = "TestAppPU";
	private static EntityManagerFactory factory;

	public static EntityManager getEntityManager() {
		createEntityManagerFactory();
		return factory.createEntityManager();

	}

	private static EntityManagerFactory createEntityManagerFactory() {

		if (factory==null) {
			factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		}
		return factory;

	}

}
