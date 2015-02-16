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
public class CounterTabPK implements Serializable {
    @Basic(optional = false)
    @Column(name = "counter_num")
    private int counterNum;
    @Basic(optional = false)
    @Column(name = "counter_name")
    private String counterName;

    public CounterTabPK() {
    }

    public CounterTabPK(int counterNum, String counterName) {
        this.counterNum = counterNum;
        this.counterName = counterName;
    }

    public int getCounterNum() {
        return counterNum;
    }

    public void setCounterNum(int counterNum) {
        this.counterNum = counterNum;
    }

    public String getCounterName() {
        return counterName;
    }

    public void setCounterName(String counterName) {
        this.counterName = counterName;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) counterNum;
        hash += (counterName != null ? counterName.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CounterTabPK)) {
            return false;
        }
        CounterTabPK other = (CounterTabPK) object;
        if (this.counterNum != other.counterNum) {
            return false;
        }
        if ((this.counterName == null && other.counterName != null) || (this.counterName != null && !this.counterName.equals(other.counterName))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mylearning.CounterTabPK[ counterNum=" + counterNum + ", counterName=" + counterName + " ]";
    }
    
}
