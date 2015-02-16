/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.edu.uams.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
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
@Table(name = "feemaster_tab")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "FeemasterTab.findAll", query = "SELECT f FROM FeemasterTab f"),
    @NamedQuery(name = "FeemasterTab.findByFeeCode", query = "SELECT f FROM FeemasterTab f WHERE f.feemasterTabPK.feeCode = :feeCode"),
    @NamedQuery(name = "FeemasterTab.findByFeeName", query = "SELECT f FROM FeemasterTab f WHERE f.feemasterTabPK.feeName = :feeName"),
    @NamedQuery(name = "FeemasterTab.findByAccountName", query = "SELECT f FROM FeemasterTab f WHERE f.accountName = :accountName"),
    @NamedQuery(name = "FeemasterTab.findByFeeSched", query = "SELECT f FROM FeemasterTab f WHERE f.feeSched = :feeSched"),
    @NamedQuery(name = "FeemasterTab.findByFine", query = "SELECT f FROM FeemasterTab f WHERE f.fine = :fine"),
    @NamedQuery(name = "FeemasterTab.findByRefundable", query = "SELECT f FROM FeemasterTab f WHERE f.refundable = :refundable"),
    @NamedQuery(name = "FeemasterTab.findByExclude", query = "SELECT f FROM FeemasterTab f WHERE f.exclude = :exclude"),
    @NamedQuery(name = "FeemasterTab.findByFeeAdmin", query = "SELECT f FROM FeemasterTab f WHERE f.feeAdmin = :feeAdmin"),
    @NamedQuery(name = "FeemasterTab.findByFeeCat", query = "SELECT f FROM FeemasterTab f WHERE f.feeCat = :feeCat"),
    @NamedQuery(name = "FeemasterTab.findByFeesType", query = "SELECT f FROM FeemasterTab f WHERE f.feesType = :feesType"),
    @NamedQuery(name = "FeemasterTab.findByUnderGroup", query = "SELECT f FROM FeemasterTab f WHERE f.underGroup = :underGroup"),
    @NamedQuery(name = "FeemasterTab.findByCounterType", query = "SELECT f FROM FeemasterTab f WHERE f.counterType = :counterType"),
    @NamedQuery(name = "FeemasterTab.findByCounterNum", query = "SELECT f FROM FeemasterTab f WHERE f.counterNum = :counterNum"),
    @NamedQuery(name = "FeemasterTab.findByCounterName", query = "SELECT f FROM FeemasterTab f WHERE f.counterName = :counterName"),
    @NamedQuery(name = "FeemasterTab.findByLocation", query = "SELECT f FROM FeemasterTab f WHERE f.location = :location"),
    @NamedQuery(name = "FeemasterTab.findByIncharge", query = "SELECT f FROM FeemasterTab f WHERE f.incharge = :incharge"),
    @NamedQuery(name = "FeemasterTab.findByPassword", query = "SELECT f FROM FeemasterTab f WHERE f.password = :password"),
    @NamedQuery(name = "FeemasterTab.findByOrigAmount", query = "SELECT f FROM FeemasterTab f WHERE f.origAmount = :origAmount")})
public class FeemasterTab implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected FeemasterTabPK feemasterTabPK;
    @Basic(optional = false)
    @Column(name = "account_name")
    private String accountName;
    @Column(name = "fee_sched")
    private String feeSched;
    @Column(name = "fine")
    private String fine;
    @Column(name = "refundable")
    private String refundable;
    @Column(name = "exclude")
    private String exclude;
    @Column(name = "fee_admin")
    private String feeAdmin;
    @Column(name = "fee_cat")
    private String feeCat;
    @Column(name = "fees_type")
    private String feesType;
    @Column(name = "under_group")
    private String underGroup;
    @Column(name = "counter_type")
    private String counterType;
    @Basic(optional = false)
    @Column(name = "counter_num")
    private int counterNum;
    @Column(name = "counter_name")
    private String counterName;
    @Column(name = "location")
    private String location;
    @Column(name = "incharge")
    private String incharge;
    @Column(name = "password")
    private String password;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "orig_amount")
    private BigDecimal origAmount;

    public FeemasterTab() {
    }

    public FeemasterTab(FeemasterTabPK feemasterTabPK) {
        this.feemasterTabPK = feemasterTabPK;
    }

    public FeemasterTab(FeemasterTabPK feemasterTabPK, String accountName, int counterNum) {
        this.feemasterTabPK = feemasterTabPK;
        this.accountName = accountName;
        this.counterNum = counterNum;
    }

    public FeemasterTab(String feeCode, String feeName) {
        this.feemasterTabPK = new FeemasterTabPK(feeCode, feeName);
    }

    public FeemasterTabPK getFeemasterTabPK() {
        return feemasterTabPK;
    }

    public void setFeemasterTabPK(FeemasterTabPK feemasterTabPK) {
        this.feemasterTabPK = feemasterTabPK;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getFeeSched() {
        return feeSched;
    }

    public void setFeeSched(String feeSched) {
        this.feeSched = feeSched;
    }

    public String getFine() {
        return fine;
    }

    public void setFine(String fine) {
        this.fine = fine;
    }

    public String getRefundable() {
        return refundable;
    }

    public void setRefundable(String refundable) {
        this.refundable = refundable;
    }

    public String getExclude() {
        return exclude;
    }

    public void setExclude(String exclude) {
        this.exclude = exclude;
    }

    public String getFeeAdmin() {
        return feeAdmin;
    }

    public void setFeeAdmin(String feeAdmin) {
        this.feeAdmin = feeAdmin;
    }

    public String getFeeCat() {
        return feeCat;
    }

    public void setFeeCat(String feeCat) {
        this.feeCat = feeCat;
    }

    public String getFeesType() {
        return feesType;
    }

    public void setFeesType(String feesType) {
        this.feesType = feesType;
    }

    public String getUnderGroup() {
        return underGroup;
    }

    public void setUnderGroup(String underGroup) {
        this.underGroup = underGroup;
    }

    public String getCounterType() {
        return counterType;
    }

    public void setCounterType(String counterType) {
        this.counterType = counterType;
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

    public BigDecimal getOrigAmount() {
        return origAmount;
    }

    public void setOrigAmount(BigDecimal origAmount) {
        this.origAmount = origAmount;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (feemasterTabPK != null ? feemasterTabPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FeemasterTab)) {
            return false;
        }
        FeemasterTab other = (FeemasterTab) object;
        if ((this.feemasterTabPK == null && other.feemasterTabPK != null) || (this.feemasterTabPK != null && !this.feemasterTabPK.equals(other.feemasterTabPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mylearning.FeemasterTab[ feemasterTabPK=" + feemasterTabPK + " ]";
    }
    
}
