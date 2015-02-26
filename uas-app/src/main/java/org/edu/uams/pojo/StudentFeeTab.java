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
import javax.persistence.Entity;
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
@Entity
@Table(name = "student_fee_tab")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StudentFeeTab.findAll", query = "SELECT s FROM StudentFeeTab s"),
    @NamedQuery(name = "StudentFeeTab.findByTotalAmount", query = "SELECT s FROM StudentFeeTab s WHERE s.totalAmount = :totalAmount"),
    @NamedQuery(name = "StudentFeeTab.findByFeePaymentDate", query = "SELECT s FROM StudentFeeTab s WHERE s.feePaymentDate = :feePaymentDate"),
    @NamedQuery(name = "StudentFeeTab.findByFeeName", query = "SELECT s FROM StudentFeeTab s WHERE s.feeName = :feeName"),
    @NamedQuery(name = "StudentFeeTab.findByDiscountType", query = "SELECT s FROM StudentFeeTab s WHERE s.discountType = :discountType"),
    @NamedQuery(name = "StudentFeeTab.findBySerial", query = "SELECT s FROM StudentFeeTab s WHERE s.serial = :serial")})
public class StudentFeeTab implements Serializable {
    private static final long serialVersionUID = 1L;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @Column(name = "total_amount")
    private BigDecimal totalAmount;
    @Basic(optional = false)
    @Column(name = "fee_payment_date")
    private String feePaymentDate;
    @Basic(optional = false)
    @Column(name = "fee_name")
    private String feeName;
    @Basic(optional = false)
    @Column(name = "discount_type")
    private String discountType;
    @Id
    @Basic(optional = false)
    @Column(name = "serial")
    private String serial;
    @JoinColumn(name = "roll_num", referencedColumnName = "roll_num")
    @ManyToOne(optional = false)
    private StudentTab rollNum;

    public StudentFeeTab() {
    }

    public StudentFeeTab(String serial) {
        this.serial = serial;
    }

    public StudentFeeTab(String serial, BigDecimal totalAmount, String feePaymentDate, String feeName, String discountType) {
        this.serial = serial;
        this.totalAmount = totalAmount;
        this.feePaymentDate = feePaymentDate;
        this.feeName = feeName;
        this.discountType = discountType;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getFeePaymentDate() {
        return feePaymentDate;
    }

    public void setFeePaymentDate(String feePaymentDate) {
        this.feePaymentDate = feePaymentDate;
    }

    public String getFeeName() {
        return feeName;
    }

    public void setFeeName(String feeName) {
        this.feeName = feeName;
    }

    public String getDiscountType() {
        return discountType;
    }

    public void setDiscountType(String discountType) {
        this.discountType = discountType;
    }

    public String getSerial() {
        return serial;
    }

    public void setSerial(String serial) {
        this.serial = serial;
    }

    public StudentTab getRollNum() {
        return rollNum;
    }

    public void setRollNum(StudentTab rollNum) {
        this.rollNum = rollNum;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (serial != null ? serial.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof StudentFeeTab)) {
            return false;
        }
        StudentFeeTab other = (StudentFeeTab) object;
        if ((this.serial == null && other.serial != null) || (this.serial != null && !this.serial.equals(other.serial))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.edu.uams.pojo.StudentFeeTab[ serial=" + serial + " ]";
    }
    
}
