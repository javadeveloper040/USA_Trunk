/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.edu.uams.pojo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Mohammed.Tauseef
 */
@Entity
@Table(name = "counter_tab")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CounterTab.findAll", query = "SELECT c FROM CounterTab c"),
    @NamedQuery(name = "CounterTab.findByCounterNum", query = "SELECT c FROM CounterTab c WHERE c.counterTabPK.counterNum = :counterNum"),
    @NamedQuery(name = "CounterTab.findByCounterName", query = "SELECT c FROM CounterTab c WHERE c.counterTabPK.counterName = :counterName"),
    @NamedQuery(name = "CounterTab.findByLocation", query = "SELECT c FROM CounterTab c WHERE c.location = :location"),
    @NamedQuery(name = "CounterTab.findByIncharge", query = "SELECT c FROM CounterTab c WHERE c.incharge = :incharge"),
    @NamedQuery(name = "CounterTab.findByPassword", query = "SELECT c FROM CounterTab c WHERE c.password = :password")})
public class CounterTab implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected CounterTabPK counterTabPK;
    @Basic(optional = false)
    @Column(name = "location")
    private String location;
    @Basic(optional = false)
    @Column(name = "incharge")
    private String incharge;
    @Basic(optional = false)
    @Column(name = "password")
    private String password;

    public CounterTab() {
    }

    public CounterTab(CounterTabPK counterTabPK) {
        this.counterTabPK = counterTabPK;
    }

    public CounterTab(CounterTabPK counterTabPK, String location, String incharge, String password) {
        this.counterTabPK = counterTabPK;
        this.location = location;
        this.incharge = incharge;
        this.password = password;
    }

    public CounterTab(int counterNum, String counterName) {
        this.counterTabPK = new CounterTabPK(counterNum, counterName);
    }

    public CounterTabPK getCounterTabPK() {
        return counterTabPK;
    }

    public void setCounterTabPK(CounterTabPK counterTabPK) {
        this.counterTabPK = counterTabPK;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getIncharge() {
        return incharge;
    }

    public void setIncharge(String incharge) {
        this.incharge = incharge;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (counterTabPK != null ? counterTabPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CounterTab)) {
            return false;
        }
        CounterTab other = (CounterTab) object;
        if ((this.counterTabPK == null && other.counterTabPK != null) || (this.counterTabPK != null && !this.counterTabPK.equals(other.counterTabPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mylearning.CounterTab[ counterTabPK=" + counterTabPK + " ]";
    }
    
}
