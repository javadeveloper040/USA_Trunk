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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Mohammed.Tauseef
 */
@Entity
@Table(name = "create_admission")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CreateAdmission.findAll", query = "SELECT c FROM CreateAdmission c"),
    @NamedQuery(name = "CreateAdmission.findByAdminNum", query = "SELECT c FROM CreateAdmission c WHERE c.adminNum = :adminNum"),
    @NamedQuery(name = "CreateAdmission.findByRollNum", query = "SELECT c FROM CreateAdmission c WHERE c.rollNum = :rollNum"),
    @NamedQuery(name = "CreateAdmission.findBySelectedCourse", query = "SELECT c FROM CreateAdmission c WHERE c.selectedCourse = :selectedCourse"),
    @NamedQuery(name = "CreateAdmission.findBySelectedBranch", query = "SELECT c FROM CreateAdmission c WHERE c.selectedBranch = :selectedBranch"),
    @NamedQuery(name = "CreateAdmission.findByStudentName", query = "SELECT c FROM CreateAdmission c WHERE c.studentName = :studentName"),
    @NamedQuery(name = "CreateAdmission.findById", query = "SELECT c FROM CreateAdmission c WHERE c.id = :id")})
public class CreateAdmission implements Serializable {
    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "admin_num")
    private long adminNum;
    @Column(name = "roll_num")
    private String rollNum;
    @Column(name = "selected_course")
    private String selectedCourse;
    @Column(name = "selected_branch")
    private String selectedBranch;
    @Column(name = "student_name")
    private String studentName;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;

    public CreateAdmission() {
    }

    public CreateAdmission(Long id) {
        this.id = id;
    }

    public CreateAdmission(Long id, long adminNum) {
        this.id = id;
        this.adminNum = adminNum;
    }

    public long getAdminNum() {
        return adminNum;
    }

    public void setAdminNum(long adminNum) {
        this.adminNum = adminNum;
    }

    public String getRollNum() {
        return rollNum;
    }

    public void setRollNum(String rollNum) {
        this.rollNum = rollNum;
    }

    public String getSelectedCourse() {
        return selectedCourse;
    }

    public void setSelectedCourse(String selectedCourse) {
        this.selectedCourse = selectedCourse;
    }

    public String getSelectedBranch() {
        return selectedBranch;
    }

    public void setSelectedBranch(String selectedBranch) {
        this.selectedBranch = selectedBranch;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
        if (!(object instanceof CreateAdmission)) {
            return false;
        }
        CreateAdmission other = (CreateAdmission) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mylearning.CreateAdmission[ id=" + id + " ]";
    }
    
}
