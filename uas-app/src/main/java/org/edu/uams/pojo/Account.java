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
@Table(name = "account")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Account.findAll", query = "SELECT a FROM Account a"),
    @NamedQuery(name = "Account.findByAccountCode", query = "SELECT a FROM Account a WHERE a.accountCode = :accountCode"),
    @NamedQuery(name = "Account.findByAccountName", query = "SELECT a FROM Account a WHERE a.accountName = :accountName"),
    @NamedQuery(name = "Account.findByBankName", query = "SELECT a FROM Account a WHERE a.bankName = :bankName"),
    @NamedQuery(name = "Account.findByBankAddress", query = "SELECT a FROM Account a WHERE a.bankAddress = :bankAddress"),
    @NamedQuery(name = "Account.findByAccountNumber", query = "SELECT a FROM Account a WHERE a.accountNumber = :accountNumber")})
public class Account implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private long id;


   
    
    @Basic(optional = false)
    @Column(name = "account_code")
    private String accountCode;
    
    @Column(name = "account_name")
    private String accountName;
    
    @Basic(optional = false)
    @Column(name = "bank_name")
    private String bankName;
    
    @Basic(optional = false)
    @Column(name = "bank_address")
    private String bankAddress;
    
    @Column(name = "account_number")
    private String accountNumber;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "accountName")
    private List<FeeTab> feeTabList;

    public Account() {
    }

    public Account(String accountCode) {
        this.accountCode = accountCode;
    }

    public Account(String accountCode, String bankName, String bankAddress) {
        this.accountCode = accountCode;
        this.bankName = bankName;
        this.bankAddress = bankAddress;
    }

    public String getAccountCode() {
        return accountCode;
    }

    public void setAccountCode(String accountCode) {
        this.accountCode = accountCode;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getBankAddress() {
        return bankAddress;
    }

    public void setBankAddress(String bankAddress) {
        this.bankAddress = bankAddress;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    @XmlTransient
    public List<FeeTab> getFeeTabList() {
        return feeTabList;
    }

    public void setFeeTabList(List<FeeTab> feeTabList) {
        this.feeTabList = feeTabList;
    }
    

    @Override
    public String toString() {
        return "com.mylearning.Account[ accountCode=" + accountCode + " ]";
    }

    
     public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
