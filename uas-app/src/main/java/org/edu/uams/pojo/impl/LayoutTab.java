/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.edu.uams.pojo.impl;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Mohammed.Tauseef
 */
@Entity
@Table(name = "layout_tab")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "LayoutTab.findAll", query = "SELECT l FROM LayoutTab l"),
    @NamedQuery(name = "LayoutTab.findByLayoutName", query = "SELECT l FROM LayoutTab l WHERE l.layoutName = :layoutName")})
public class LayoutTab implements Serializable {
    private static final long serialVersionUID = 1L;

   
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private long id;
    
    
    @Basic(optional = false)
    @Column(name = "layout_name")
    private String layoutName;
    
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "layoutName")
    private List<BusDetailsTab> busDetailsTabList;

    public LayoutTab() {
    }

    public LayoutTab(String layoutName) {
        this.layoutName = layoutName;
    }

    public String getLayoutName() {
        return layoutName;
    }

    public void setLayoutName(String layoutName) {
        this.layoutName = layoutName;
    }

    @XmlTransient
    public List<BusDetailsTab> getBusDetailsTabList() {
        return busDetailsTabList;
    }

    public void setBusDetailsTabList(List<BusDetailsTab> busDetailsTabList) {
        this.busDetailsTabList = busDetailsTabList;
    }

     public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
    
    
}
