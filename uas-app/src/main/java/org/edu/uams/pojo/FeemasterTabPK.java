/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.edu.uams.pojo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author Mohammed.Tauseef
 */
@Embeddable
public class FeemasterTabPK implements Serializable {
    @Basic(optional = false)
    @Column(name = "fee_code")
    private String feeCode;
    @Basic(optional = false)
    @Column(name = "fee_name")
    private String feeName;

    public FeemasterTabPK() {
    }

    public FeemasterTabPK(String feeCode, String feeName) {
        this.feeCode = feeCode;
        this.feeName = feeName;
    }

    public String getFeeCode() {
        return feeCode;
    }

    public void setFeeCode(String feeCode) {
        this.feeCode = feeCode;
    }

    public String getFeeName() {
        return feeName;
    }

    public void setFeeName(String feeName) {
        this.feeName = feeName;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (feeCode != null ? feeCode.hashCode() : 0);
        hash += (feeName != null ? feeName.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FeemasterTabPK)) {
            return false;
        }
        FeemasterTabPK other = (FeemasterTabPK) object;
        if ((this.feeCode == null && other.feeCode != null) || (this.feeCode != null && !this.feeCode.equals(other.feeCode))) {
            return false;
        }
        if ((this.feeName == null && other.feeName != null) || (this.feeName != null && !this.feeName.equals(other.feeName))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mylearning.FeemasterTabPK[ feeCode=" + feeCode + ", feeName=" + feeName + " ]";
    }
    
}
