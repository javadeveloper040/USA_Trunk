/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/

package org.edu.uams.pojo.impl;

import org.edu.uams.pojo.api.FeeDetails;
import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Mohammed.Tauseef
 */
@Entity(name = "FeeDetails")
@Table(name = "fee_details")
@XmlRootElement
@NamedQueries({
  })

public class FeeDetailsEntity implements FeeDetails {
    
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private long id;
    
    
    @Basic(optional = false)
    @Column(name = "code", unique = true, nullable = false, length = 10)
    private String feeCode;
    
    
    
    @Basic(optional = false)
    @Column(name = "description", unique = true, nullable = false, length = 50)
    private String feeName;
    
    
    @JoinColumn(name = "fee_type", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private FeeTypeEntity feeType;
    
    @JoinColumn(name = "fee_cat", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private FeeCategoryTypeEntity feeCategoryType;
    
    
    @Basic(optional = false)
    @Column(name = "admn_type")
    private String admnType;
    

    
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "orig_amount")
    private BigDecimal origAmount;
    
    @JoinColumn(name = "account_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Account accountId;
    
    public FeeDetailsEntity() {
    }
    
    public FeeDetailsEntity(long id) {
        this.id = id;
    }

    @Override
    public long getId() {
        return id;
    }

    @Override
    public void setId(long id) {
        this.id = id;
    }

    @Override
    public String getFeeCode() {
        return feeCode;
    }

    @Override
    public void setFeeCode(String feeCode) {
        this.feeCode = feeCode;
    }

    @Override
    public String getFeeName() {
        return feeName;
    }

    @Override
    public void setFeeName(String feeName) {
        this.feeName = feeName;
    }

    @Override
    public FeeTypeEntity getFeeType() {
        return feeType;
    }

    @Override
    public void setFeeType(FeeTypeEntity feeType) {
        this.feeType = feeType;
    }

    @Override
    public FeeCategoryTypeEntity getFeeCategoryType() {
        return feeCategoryType;
    }

    @Override
    public void setFeeCategoryType(FeeCategoryTypeEntity feeCategoryType) {
        this.feeCategoryType = feeCategoryType;
    }

    @Override
    public String getAdmnType() {
        return admnType;
    }

    @Override
    public void setAdmnType(String admnType) {
        this.admnType = admnType;
    }

    

    @Override
    public BigDecimal getOrigAmount() {
        return origAmount;
    }

    @Override
    public void setOrigAmount(BigDecimal origAmount) {
        this.origAmount = origAmount;
    }

    @Override
    public Account getAccountId() {
        return accountId;
    }

    @Override
    public void setAccountId(Account accountId) {
        this.accountId = accountId;
    }
    
    
    
}
