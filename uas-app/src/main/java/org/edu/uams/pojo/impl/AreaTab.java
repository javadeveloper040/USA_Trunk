/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.edu.uams.pojo.impl;

import java.io.Serializable;
import java.math.BigInteger;
import javax.persistence.Basic;
import javax.persistence.Column;
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
@Table(name = "area_tab")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AreaTab.findAll", query = "SELECT a FROM AreaTab a"),
    @NamedQuery(name = "AreaTab.findByAreaCode", query = "SELECT a FROM AreaTab a WHERE a.areaCode = :areaCode"),
    @NamedQuery(name = "AreaTab.findByAreaName", query = "SELECT a FROM AreaTab a WHERE a.areaName = :areaName"),
    @NamedQuery(name = "AreaTab.findByAreaFee", query = "SELECT a FROM AreaTab a WHERE a.areaFee = :areaFee")})
public class AreaTab implements Serializable {
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private long id;

    
    @Basic(optional = false)
    @Column(name = "area_code")
    private String areaCode;
    
    @Basic(optional = false)
    @Column(name = "area_name")
    private String areaName;
    
    @Basic(optional = false)
    @Column(name = "area_fee")
    private BigInteger areaFee;

    public AreaTab() {
    }

    public AreaTab(String areaCode) {
        this.areaCode = areaCode;
    }

    public AreaTab(String areaCode, String areaName, BigInteger areaFee) {
        this.areaCode = areaCode;
        this.areaName = areaName;
        this.areaFee = areaFee;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public BigInteger getAreaFee() {
        return areaFee;
    }

    public void setAreaFee(BigInteger areaFee) {
        this.areaFee = areaFee;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
   

    @Override
    public String toString() {
        return "com.mylearning.AreaTab[ areaCode=" + areaCode + " ]";
    }
    
}
