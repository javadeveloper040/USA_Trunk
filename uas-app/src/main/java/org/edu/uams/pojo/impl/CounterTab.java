/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/

package org.edu.uams.pojo.impl;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private long id;
    
    
    @Basic(optional = false)
    @Column(name = "counter_name")
    private String counterName;
    
    @Basic(optional = false)
    @Column(name = "counter_num")
    private String counterNum;

    
    
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
    
    public CounterTab(long id) {
        this.id = id;
    }
    
    public CounterTab(long id, String location, String incharge, String password) {
        this.id = id;
        this.location = location;
        this.incharge = incharge;
        this.password = password;
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
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCounterName() {
        return counterName;
    }

    public void setCounterName(String counterName) {
        this.counterName = counterName;
    }

    public String getCounterNum() {
        return counterNum;
    }

    public void setCounterNum(String counterNum) {
        this.counterNum = counterNum;
    }
    
    
    
    @Override
    public String toString() {
        return "com.mylearning.CounterTab[ id=" + id + " ]";
    }
    
}
