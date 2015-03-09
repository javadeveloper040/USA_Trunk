/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.edu.uams.pojo.api;

import java.io.Serializable;

/**
 *
 * @author Mohammed.Tauseef
 */
public  interface FeeCategoryType extends Serializable{
    
      String getCode();

    String getDescription();

    long getId();

    void setCode(String code);

    void setDescription(String description);

    void setId(long id);
    
}
