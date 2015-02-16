/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.edu.uams.pojo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author Mohammed.Tauseef
 */
@Embeddable
public class CourseTabPK implements Serializable {
    @Basic(optional = false)
    @Column(name = "course_name")
    private String courseName;
    @Basic(optional = false)
    @Column(name = "branch_code")
    private String branchCode;
    @Basic(optional = false)
    @Column(name = "branch_name")
    private String branchName;

    public CourseTabPK() {
    }

    public CourseTabPK(String courseName, String branchCode, String branchName) {
        this.courseName = courseName;
        this.branchCode = branchCode;
        this.branchName = branchName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (courseName != null ? courseName.hashCode() : 0);
        hash += (branchCode != null ? branchCode.hashCode() : 0);
        hash += (branchName != null ? branchName.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CourseTabPK)) {
            return false;
        }
        CourseTabPK other = (CourseTabPK) object;
        if ((this.courseName == null && other.courseName != null) || (this.courseName != null && !this.courseName.equals(other.courseName))) {
            return false;
        }
        if ((this.branchCode == null && other.branchCode != null) || (this.branchCode != null && !this.branchCode.equals(other.branchCode))) {
            return false;
        }
        if ((this.branchName == null && other.branchName != null) || (this.branchName != null && !this.branchName.equals(other.branchName))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mylearning.CourseTabPK[ courseName=" + courseName + ", branchCode=" + branchCode + ", branchName=" + branchName + " ]";
    }
    
}
