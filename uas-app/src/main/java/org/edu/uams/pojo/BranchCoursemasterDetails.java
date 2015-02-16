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
@Table(name = "branch_coursemaster_details")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BranchCoursemasterDetails.findAll", query = "SELECT b FROM BranchCoursemasterDetails b"),
    @NamedQuery(name = "BranchCoursemasterDetails.findByBranchCode", query = "SELECT b FROM BranchCoursemasterDetails b WHERE b.branchCode = :branchCode"),
    @NamedQuery(name = "BranchCoursemasterDetails.findByBranchName", query = "SELECT b FROM BranchCoursemasterDetails b WHERE b.branchName = :branchName"),
    @NamedQuery(name = "BranchCoursemasterDetails.findByRef", query = "SELECT b FROM BranchCoursemasterDetails b WHERE b.ref = :ref"),
    @NamedQuery(name = "BranchCoursemasterDetails.findBySeats", query = "SELECT b FROM BranchCoursemasterDetails b WHERE b.seats = :seats"),
    @NamedQuery(name = "BranchCoursemasterDetails.findById", query = "SELECT b FROM BranchCoursemasterDetails b WHERE b.id = :id")})
public class BranchCoursemasterDetails implements Serializable {
    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "branch_code")
    private String branchCode;
    @Basic(optional = false)
    @Column(name = "branch_name")
    private String branchName;
    @Basic(optional = false)
    @Column(name = "ref")
    private String ref;
    @Basic(optional = false)
    @Column(name = "seats")
    private int seats;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @JoinColumn(name = "course_name", referencedColumnName = "course_name")
    @ManyToOne(optional = false)
    private CoursemasterTab courseName;

    public BranchCoursemasterDetails() {
    }

    public BranchCoursemasterDetails(Long id) {
        this.id = id;
    }

    public BranchCoursemasterDetails(Long id, String branchCode, String branchName, String ref, int seats) {
        this.id = id;
        this.branchCode = branchCode;
        this.branchName = branchName;
        this.ref = ref;
        this.seats = seats;
    }

    public String getBranchCode() {
        return branchCode;
    }

    public void setBranchCode(String branchCode) {
        this.branchCode = branchCode;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    public String getRef() {
        return ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
    }

    public int getSeats() {
        return seats;
    }

    public void setSeats(int seats) {
        this.seats = seats;
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
        if (!(object instanceof BranchCoursemasterDetails)) {
            return false;
        }
        BranchCoursemasterDetails other = (BranchCoursemasterDetails) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mylearning.BranchCoursemasterDetails[ id=" + id + " ]";
    }
    
}
