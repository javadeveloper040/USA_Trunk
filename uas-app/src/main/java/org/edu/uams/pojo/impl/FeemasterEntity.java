/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/

package org.edu.uams.pojo.impl;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Mohammed.Tauseef
 */
@Entity(name = "FeemasterType")
@Table(name = "fee_master")
@XmlRootElement
@NamedQueries({
})

public class FeemasterEntity implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private long id;
    
    @Basic(optional = false)
    @Column(name = "fee_code" ,length = 10,unique = true)
    private String feeCode;
    
    @Basic(optional = false)
    @Column(name = "fee_name",length = 50)
    private String feeName;
    
    @Basic(optional = false)
    @Column(name = "account_name",length = 30,unique = true)
    private String accountName;
    
    @Basic(optional = false)
    @Column(name = "basic_fine_amount",nullable = false)
    private BigDecimal basicFineAmount;
    
    @Basic(optional = false)
    @Column(name = "refundable",nullable = false)
    private boolean isRefundable;
    
    @Basic(optional = false)
    @JoinColumn(name = "fee_type", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private FeeTypeEntity feeType;
    
    @Basic(optional = false)
    @JoinColumn(name = "fee_cat", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private FeeCategoryTypeEntity feeCategoryType;
    
    @Basic(optional = false)
    @Column(name = "begins_on",nullable = false)
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date beginsOn;
    
    @Basic(optional = false)
    @Column(name = "ends_on",nullable = false)
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date endsOn;
    
    
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @Column(name = "orig_amount",nullable = false)
    private BigDecimal origAmount;
    
    public FeemasterEntity() {
    }
    
    
    public String getAccountName() {
        return accountName;
    }
    
    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }
    
    
    
    public BigDecimal getOrigAmount() {
        return origAmount;
    }
    
    public void setOrigAmount(BigDecimal origAmount) {
        this.origAmount = origAmount;
    }
    
    public long getId() {
        return id;
    }
    
    public void setId(long id) {
        this.id = id;
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
    
    public BigDecimal getBasicFineAmount() {
        return basicFineAmount;
    }
    
    public void setBasicFineAmount(BigDecimal basicFineAmount) {
        this.basicFineAmount = basicFineAmount;
    }
    
    public boolean isIsRefundable() {
        return isRefundable;
    }
    
    public void setIsRefundable(boolean isRefundable) {
        this.isRefundable = isRefundable;
    }
    
    public FeeTypeEntity getFeeType() {
        return feeType;
    }
    
    public void setFeeType(FeeTypeEntity feeType) {
        this.feeType = feeType;
    }
    
    public FeeCategoryTypeEntity getFeeCategoryType() {
        return feeCategoryType;
    }
    
    public void setFeeCategoryType(FeeCategoryTypeEntity feeCategoryType) {
        this.feeCategoryType = feeCategoryType;
    }
    
    public Date getBeginsOn() {
        return beginsOn;
    }
    
    public void setBeginsOn(Date beginsOn) {
        this.beginsOn = beginsOn;
    }
    
    public Date getEndsOn() {
        return endsOn;
    }
    
    public void setEndsOn(Date endsOn) {
        this.endsOn = endsOn;
    }
    
    
    
}
