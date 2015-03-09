/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.edu.uams.pojo.api;

import java.io.Serializable;
import java.math.BigDecimal;
import org.edu.uams.pojo.impl.Account;
import org.edu.uams.pojo.impl.FeeCategoryTypeEntity;
import org.edu.uams.pojo.impl.FeeTypeEntity;

/**
 *
 * @author Mohammed.Tauseef
 */
public interface FeeDetails extends Serializable {

    Account getAccountId();

    String getAdmnType();


    FeeCategoryTypeEntity getFeeCategoryType();

    String getFeeCode();


    String getFeeName();

    FeeTypeEntity getFeeType();

    long getId();

    BigDecimal getOrigAmount();

    void setAccountId(Account accountId);

    void setAdmnType(String admnType);


    void setFeeCategoryType(FeeCategoryTypeEntity feeCategoryType);

    void setFeeCode(String feeCode);


    void setFeeName(String feeName);

    void setFeeType(FeeTypeEntity feeType);

    void setId(long id);

    void setOrigAmount(BigDecimal origAmount);
    
}
