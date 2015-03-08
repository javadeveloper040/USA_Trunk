package org.edu.uams.business.impl;

import java.util.List;
import org.edu.uams.business.api.FeeTypeDao;

import org.edu.uams.pojo.api.FeeType;
import org.edu.uams.pojo.impl.FeeTypeEntity;

public class FeeTypeImpl extends AbstractDaoImpl<FeeType,FeeTypeEntity> implements FeeTypeDao{

	public FeeTypeImpl() {
		super(FeeTypeEntity.class);
	}

    public List<FeeType> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
     

}
