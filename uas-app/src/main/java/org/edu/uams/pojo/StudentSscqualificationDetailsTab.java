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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Mohammed.Tauseef
 */
@Entity
@Table(name = "student_sscqualification_details_tab")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StudentSscqualificationDetailsTab.findAll", query = "SELECT s FROM StudentSscqualificationDetailsTab s"),
    @NamedQuery(name = "StudentSscqualificationDetailsTab.findByRollNum", query = "SELECT s FROM StudentSscqualificationDetailsTab s WHERE s.rollNum = :rollNum"),
    @NamedQuery(name = "StudentSscqualificationDetailsTab.findBySnameInstitution", query = "SELECT s FROM StudentSscqualificationDetailsTab s WHERE s.snameInstitution = :snameInstitution"),
    @NamedQuery(name = "StudentSscqualificationDetailsTab.findBySmedium", query = "SELECT s FROM StudentSscqualificationDetailsTab s WHERE s.smedium = :smedium"),
    @NamedQuery(name = "StudentSscqualificationDetailsTab.findBySdivision", query = "SELECT s FROM StudentSscqualificationDetailsTab s WHERE s.sdivision = :sdivision"),
    @NamedQuery(name = "StudentSscqualificationDetailsTab.findBySpercentage", query = "SELECT s FROM StudentSscqualificationDetailsTab s WHERE s.spercentage = :spercentage"),
    @NamedQuery(name = "StudentSscqualificationDetailsTab.findBySyearOfPass", query = "SELECT s FROM StudentSscqualificationDetailsTab s WHERE s.syearOfPass = :syearOfPass")})
public class StudentSscqualificationDetailsTab implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "roll_num")
    private String rollNum;
    @Column(name = "sname_institution")
    private String snameInstitution;
    @Column(name = "smedium")
    private String smedium;
    @Column(name = "sdivision")
    private String sdivision;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "spercentage")
    private Double spercentage;
    @Column(name = "syear_of_pass")
    private Integer syearOfPass;
    @JoinColumn(name = "roll_num", referencedColumnName = "roll_num", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private StudentTab studentTab;

    public StudentSscqualificationDetailsTab() {
    }

    public StudentSscqualificationDetailsTab(String rollNum) {
        this.rollNum = rollNum;
    }

    public String getRollNum() {
        return rollNum;
    }

    public void setRollNum(String rollNum) {
        this.rollNum = rollNum;
    }

    public String getSnameInstitution() {
        return snameInstitution;
    }

    public void setSnameInstitution(String snameInstitution) {
        this.snameInstitution = snameInstitution;
    }

    public String getSmedium() {
        return smedium;
    }

    public void setSmedium(String smedium) {
        this.smedium = smedium;
    }

    public String getSdivision() {
        return sdivision;
    }

    public void setSdivision(String sdivision) {
        this.sdivision = sdivision;
    }

    public Double getSpercentage() {
        return spercentage;
    }

    public void setSpercentage(Double spercentage) {
        this.spercentage = spercentage;
    }

    public Integer getSyearOfPass() {
        return syearOfPass;
    }

    public void setSyearOfPass(Integer syearOfPass) {
        this.syearOfPass = syearOfPass;
    }

    public StudentTab getStudentTab() {
        return studentTab;
    }

    public void setStudentTab(StudentTab studentTab) {
        this.studentTab = studentTab;
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
        if (!(object instanceof StudentSscqualificationDetailsTab)) {
            return false;
        }
        StudentSscqualificationDetailsTab other = (StudentSscqualificationDetailsTab) object;
        if ((this.rollNum == null && other.rollNum != null) || (this.rollNum != null && !this.rollNum.equals(other.rollNum))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.edu.uams.pojo.StudentSscqualificationDetailsTab[ rollNum=" + rollNum + " ]";
    }
    
}
