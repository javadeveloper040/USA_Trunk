/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.edu.uams.pojo;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Mohammed.Tauseef
 */
@Entity
@Table(name = "student_tab")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StudentTab.findAll", query = "SELECT s FROM StudentTab s"),
    @NamedQuery(name = "StudentTab.findByAdmnNum", query = "SELECT s FROM StudentTab s WHERE s.admnNum = :admnNum"),
    @NamedQuery(name = "StudentTab.findByRollNum", query = "SELECT s FROM StudentTab s WHERE s.rollNum = :rollNum"),
    @NamedQuery(name = "StudentTab.findByStudentName", query = "SELECT s FROM StudentTab s WHERE s.studentName = :studentName"),
    @NamedQuery(name = "StudentTab.findByBranchName", query = "SELECT s FROM StudentTab s WHERE s.branchName = :branchName"),
    @NamedQuery(name = "StudentTab.findBySem", query = "SELECT s FROM StudentTab s WHERE s.sem = :sem"),
    @NamedQuery(name = "StudentTab.findByPhoto", query = "SELECT s FROM StudentTab s WHERE s.photo = :photo"),
    @NamedQuery(name = "StudentTab.findByPath", query = "SELECT s FROM StudentTab s WHERE s.path = :path")})
public class StudentTab implements Serializable {
    private static final long serialVersionUID = 1L;
    @Column(name = "admn_num")
    private Long admnNum;
    @Id
    @Basic(optional = false)
    @Column(name = "roll_num")
    private String rollNum;
    @Column(name = "student_name")
    private String studentName;
    @Basic(optional = false)
    @Column(name = "branch_name")
    private String branchName;
    @Column(name = "sem")
    private Short sem;
    @Basic(optional = false)
    @Column(name = "photo")
    private long photo;
    @Column(name = "path")
    private String path;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "rollNum")
    private Collection<StudentOtherDetailsTab> studentOtherDetailsTabCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "rollNum")
    private Collection<StudentFeeTab> studentFeeTabCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "rollNum")
    private Collection<StudentPersonalDetailsTab> studentPersonalDetailsTabCollection;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "studentTab")
    private StudentDegreequalificationDetailsTab studentDegreequalificationDetailsTab;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "studentTab")
    private StudentCorrAddressDetailsTab studentCorrAddressDetailsTab;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "studentTab")
    private StudentDiplomaqualificationDetailsTab studentDiplomaqualificationDetailsTab;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "studentTab")
    private StudentPermAddressDetailsTab studentPermAddressDetailsTab;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "studentTab")
    private StudentSscqualificationDetailsTab studentSscqualificationDetailsTab;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "studentTab")
    private StudentInterqualificationDetailsTab studentInterqualificationDetailsTab;

    public StudentTab() {
    }

    public StudentTab(String rollNum) {
        this.rollNum = rollNum;
    }

    public StudentTab(String rollNum, String branchName, long photo) {
        this.rollNum = rollNum;
        this.branchName = branchName;
        this.photo = photo;
    }

    public Long getAdmnNum() {
        return admnNum;
    }

    public void setAdmnNum(Long admnNum) {
        this.admnNum = admnNum;
    }

    public String getRollNum() {
        return rollNum;
    }

    public void setRollNum(String rollNum) {
        this.rollNum = rollNum;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    public Short getSem() {
        return sem;
    }

    public void setSem(Short sem) {
        this.sem = sem;
    }

    public long getPhoto() {
        return photo;
    }

    public void setPhoto(long photo) {
        this.photo = photo;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @XmlTransient
    public Collection<StudentOtherDetailsTab> getStudentOtherDetailsTabCollection() {
        return studentOtherDetailsTabCollection;
    }

    public void setStudentOtherDetailsTabCollection(Collection<StudentOtherDetailsTab> studentOtherDetailsTabCollection) {
        this.studentOtherDetailsTabCollection = studentOtherDetailsTabCollection;
    }

    @XmlTransient
    public Collection<StudentFeeTab> getStudentFeeTabCollection() {
        return studentFeeTabCollection;
    }

    public void setStudentFeeTabCollection(Collection<StudentFeeTab> studentFeeTabCollection) {
        this.studentFeeTabCollection = studentFeeTabCollection;
    }

    @XmlTransient
    public Collection<StudentPersonalDetailsTab> getStudentPersonalDetailsTabCollection() {
        return studentPersonalDetailsTabCollection;
    }

    public void setStudentPersonalDetailsTabCollection(Collection<StudentPersonalDetailsTab> studentPersonalDetailsTabCollection) {
        this.studentPersonalDetailsTabCollection = studentPersonalDetailsTabCollection;
    }

    public StudentDegreequalificationDetailsTab getStudentDegreequalificationDetailsTab() {
        return studentDegreequalificationDetailsTab;
    }

    public void setStudentDegreequalificationDetailsTab(StudentDegreequalificationDetailsTab studentDegreequalificationDetailsTab) {
        this.studentDegreequalificationDetailsTab = studentDegreequalificationDetailsTab;
    }

    public StudentCorrAddressDetailsTab getStudentCorrAddressDetailsTab() {
        return studentCorrAddressDetailsTab;
    }

    public void setStudentCorrAddressDetailsTab(StudentCorrAddressDetailsTab studentCorrAddressDetailsTab) {
        this.studentCorrAddressDetailsTab = studentCorrAddressDetailsTab;
    }

    public StudentDiplomaqualificationDetailsTab getStudentDiplomaqualificationDetailsTab() {
        return studentDiplomaqualificationDetailsTab;
    }

    public void setStudentDiplomaqualificationDetailsTab(StudentDiplomaqualificationDetailsTab studentDiplomaqualificationDetailsTab) {
        this.studentDiplomaqualificationDetailsTab = studentDiplomaqualificationDetailsTab;
    }

    public StudentPermAddressDetailsTab getStudentPermAddressDetailsTab() {
        return studentPermAddressDetailsTab;
    }

    public void setStudentPermAddressDetailsTab(StudentPermAddressDetailsTab studentPermAddressDetailsTab) {
        this.studentPermAddressDetailsTab = studentPermAddressDetailsTab;
    }

    public StudentSscqualificationDetailsTab getStudentSscqualificationDetailsTab() {
        return studentSscqualificationDetailsTab;
    }

    public void setStudentSscqualificationDetailsTab(StudentSscqualificationDetailsTab studentSscqualificationDetailsTab) {
        this.studentSscqualificationDetailsTab = studentSscqualificationDetailsTab;
    }

    public StudentInterqualificationDetailsTab getStudentInterqualificationDetailsTab() {
        return studentInterqualificationDetailsTab;
    }

    public void setStudentInterqualificationDetailsTab(StudentInterqualificationDetailsTab studentInterqualificationDetailsTab) {
        this.studentInterqualificationDetailsTab = studentInterqualificationDetailsTab;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (rollNum != null ? rollNum.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof StudentTab)) {
            return false;
        }
        StudentTab other = (StudentTab) object;
        if ((this.rollNum == null && other.rollNum != null) || (this.rollNum != null && !this.rollNum.equals(other.rollNum))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.edu.uams.pojo.StudentTab[ rollNum=" + rollNum + " ]";
    }
    
}
