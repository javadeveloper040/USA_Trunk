/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.edu.uams.pojo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (layoutName != null ? layoutName.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof LayoutTab)) {
            return false;
        }
        LayoutTab other = (LayoutTab) object;
        if ((this.layoutName == null && other.layoutName != null) || (this.layoutName != null && !this.layoutName.equals(other.layoutName))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mylearning.LayoutTab[ layoutName=" + layoutName + " ]";
    }
    
}
