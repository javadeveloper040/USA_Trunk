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
@Table(name = "coursemaster_tab")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CoursemasterTab.findAll", query = "SELECT c FROM CoursemasterTab c"),
    @NamedQuery(name = "CoursemasterTab.findByCourseName", query = "SELECT c FROM CoursemasterTab c WHERE c.courseName = :courseName"),
    @NamedQuery(name = "CoursemasterTab.findByCourseDuration", query = "SELECT c FROM CoursemasterTab c WHERE c.courseDuration = :courseDuration"),
    @NamedQuery(name = "CoursemasterTab.findByUniversityName", query = "SELECT c FROM CoursemasterTab c WHERE c.universityName = :universityName")})
public class CoursemasterTab implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "course_name")
    private String courseName;
    @Basic(optional = false)
    @Column(name = "course_duration")
    private int courseDuration;
    @Basic(optional = false)
    @Column(name = "university_name")
    private String universityName;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "courseName")
    private List<FeeCoursemasterDetails> feeCoursemasterDetailsList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "courseName")
    private List<BranchCoursemasterDetails> branchCoursemasterDetailsList;

    public CoursemasterTab() {
    }

    public CoursemasterTab(String courseName) {
        this.courseName = courseName;
    }

    public CoursemasterTab(String courseName, int courseDuration, String universityName) {
        this.courseName = courseName;
        this.courseDuration = courseDuration;
        this.universityName = universityName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public int getCourseDuration() {
        return courseDuration;
    }

    public void setCourseDuration(int courseDuration) {
        this.courseDuration = courseDuration;
    }

    public String getUniversityName() {
        return universityName;
    }

    public void setUniversityName(String universityName) {
        this.universityName = universityName;
    }

    @XmlTransient
    public List<FeeCoursemasterDetails> getFeeCoursemasterDetailsList() {
        return feeCoursemasterDetailsList;
    }

    public void setFeeCoursemasterDetailsList(List<FeeCoursemasterDetails> feeCoursemasterDetailsList) {
        this.feeCoursemasterDetailsList = feeCoursemasterDetailsList;
    }

    @XmlTransient
    public List<BranchCoursemasterDetails> getBranchCoursemasterDetailsList() {
        return branchCoursemasterDetailsList;
    }

    public void setBranchCoursemasterDetailsList(List<BranchCoursemasterDetails> branchCoursemasterDetailsList) {
        this.branchCoursemasterDetailsList = branchCoursemasterDetailsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (courseName != null ? courseName.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CoursemasterTab)) {
            return false;
        }
        CoursemasterTab other = (CoursemasterTab) object;
        if ((this.courseName == null && other.courseName != null) || (this.courseName != null && !this.courseName.equals(other.courseName))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mylearning.CoursemasterTab[ courseName=" + courseName + " ]";
    }
    
}
