/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.edu.uams.pojo;

import java.io.Serializable;
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
@Table(name = "fee_coursemaster_details")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "FeeCoursemasterDetails.findAll", query = "SELECT f FROM FeeCoursemasterDetails f"),
    @NamedQuery(name = "FeeCoursemasterDetails.findByFeeName", query = "SELECT f FROM FeeCoursemasterDetails f WHERE f.feeName = :feeName"),
    @NamedQuery(name = "FeeCoursemasterDetails.findByMonth", query = "SELECT f FROM FeeCoursemasterDetails f WHERE f.month = :month"),
    @NamedQuery(name = "FeeCoursemasterDetails.findByYear", query = "SELECT f FROM FeeCoursemasterDetails f WHERE f.year = :year"),
    @NamedQuery(name = "FeeCoursemasterDetails.findByAmount", query = "SELECT f FROM FeeCoursemasterDetails f WHERE f.amount = :amount"),
    @NamedQuery(name = "FeeCoursemasterDetails.findById", query = "SELECT f FROM FeeCoursemasterDetails f WHERE f.id = :id")})
public class FeeCoursemasterDetails implements Serializable {
    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "fee_name")
    private String feeName;
    @Column(name = "month")
    private Integer month;
    @Column(name = "year")
    private Integer year;
    @Basic(optional = false)
    @Column(name = "amount")
    private double amount;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @JoinColumn(name = "course_name", referencedColumnName = "course_name")
    @ManyToOne(optional = false)
    private CoursemasterTab courseName;

    public FeeCoursemasterDetails() {
    }

    public FeeCoursemasterDetails(Long id) {
        this.id = id;
    }

    public FeeCoursemasterDetails(Long id, String feeName, double amount) {
        this.id = id;
        this.feeName = feeName;
        this.amount = amount;
    }

    public String getFeeName() {
        return feeName;
    }

    public void setFeeName(String feeName) {
        this.feeName = feeName;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public CoursemasterTab getCourseName() {
        return courseName;
    }

    public void setCourseName(CoursemasterTab courseName) {
        this.courseName = courseName;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FeeCoursemasterDetails)) {
            return false;
        }
        FeeCoursemasterDetails other = (FeeCoursemasterDetails) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mylearning.FeeCoursemasterDetails[ id=" + id + " ]";
    }
    
}
