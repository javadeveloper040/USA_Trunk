package org.edu.uams.business.impl;

import java.util.List;
import org.edu.uams.business.api.FeeCategoryTypeDao;

import org.edu.uams.pojo.api.FeeCategoryType;
import org.edu.uams.pojo.impl.FeeCategoryTypeEntity;

public class FeeCategoryTypeImpl extends AbstractDaoImpl<FeeCategoryType,FeeCategoryTypeEntity> implements FeeCategoryTypeDao{

	public FeeCategoryTypeImpl() {
		super(FeeCategoryTypeEntity.class);
	}

    public List<FeeCategoryType> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
     

}
