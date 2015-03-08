/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/

package org.edu.uams.pojo.impl;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import javax.persistence.Basic;
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
@Table(name = "hostel_tab")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "HostelTab.findAll", query = "SELECT h FROM HostelTab h"),
    @NamedQuery(name = "HostelTab.findByHostelCode", query = "SELECT h FROM HostelTab h WHERE h.hostelCode = :hostelCode"),
    @NamedQuery(name = "HostelTab.findByHostelName", query = "SELECT h FROM HostelTab h WHERE h.hostelName = :hostelName"),
    @NamedQuery(name = "HostelTab.findByNewAdmnFee", query = "SELECT h FROM HostelTab h WHERE h.newAdmnFee = :newAdmnFee"),
    @NamedQuery(name = "HostelTab.findByOldAdmnFee", query = "SELECT h FROM HostelTab h WHERE h.oldAdmnFee = :oldAdmnFee")})
public class HostelTab implements Serializable {
    private static final long serialVersionUID = 1L;
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private long id;

   
    
    @Basic(optional = false)
    @Column(name = "hostel_code")
    private String hostelCode;
    
    @Basic(optional = false)
    @Column(name = "hostel_name")
    private String hostelName;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @Column(name = "new_admn_fee")
    private BigDecimal newAdmnFee;
    
    @Basic(optional = false)
    @Column(name = "old_admn_fee")
    private BigDecimal oldAdmnFee;
    
    @OneToMany(mappedBy = "hostelCode")
    private List<HostelRoom> hostelRoomList;

   
    
    public HostelTab() {
    }
    
    public HostelTab(String hostelCode) {
        this.hostelCode = hostelCode;
    }
    
    public HostelTab(String hostelCode, String hostelName, BigDecimal newAdmnFee, BigDecimal oldAdmnFee) {
        this.hostelCode = hostelCode;
        this.hostelName = hostelName;
        this.newAdmnFee = newAdmnFee;
        this.oldAdmnFee = oldAdmnFee;
    }
    
     public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
    
    public String getHostelCode() {
        return hostelCode;
    }
    
    public void setHostelCode(String hostelCode) {
        this.hostelCode = hostelCode;
    }
    
    public String getHostelName() {
        return hostelName;
    }
    
    public void setHostelName(String hostelName) {
        this.hostelName = hostelName;
    }
    
    public BigDecimal getNewAdmnFee() {
        return newAdmnFee;
    }
    
    public void setNewAdmnFee(BigDecimal newAdmnFee) {
        this.newAdmnFee = newAdmnFee;
    }
    
    public BigDecimal getOldAdmnFee() {
        return oldAdmnFee;
    }
    
    public void setOldAdmnFee(BigDecimal oldAdmnFee) {
        this.oldAdmnFee = oldAdmnFee;
    }
    
    @XmlTransient
    public List<HostelRoom> getHostelRoomList() {
        return hostelRoomList;
    }
    
    public void setHostelRoomList(List<HostelRoom> hostelRoomList) {
        this.hostelRoomList = hostelRoomList;
    }
    
    @Override
    public int hashCode() {
        int hash = 5;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final HostelTab other = (HostelTab) obj;
        if (this.id != other.id) {
            return false;
        }
        if ((this.hostelCode == null) ? (other.hostelCode != null) : !this.hostelCode.equals(other.hostelCode)) {
            return false;
        }
        return true;
    }
    
   
    
  
    
}
