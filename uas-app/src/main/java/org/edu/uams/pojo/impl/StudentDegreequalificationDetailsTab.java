/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.edu.uams.pojo.impl;

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
@Table(name = "student_degreequalification_details_tab")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StudentDegreequalificationDetailsTab.findAll", query = "SELECT s FROM StudentDegreequalificationDetailsTab s"),
    @NamedQuery(name = "StudentDegreequalificationDetailsTab.findByRollNum", query = "SELECT s FROM StudentDegreequalificationDetailsTab s WHERE s.rollNum = :rollNum"),
    @NamedQuery(name = "StudentDegreequalificationDetailsTab.findByDenameInstitution", query = "SELECT s FROM StudentDegreequalificationDetailsTab s WHERE s.denameInstitution = :denameInstitution"),
    @NamedQuery(name = "StudentDegreequalificationDetailsTab.findByDemedium", query = "SELECT s FROM StudentDegreequalificationDetailsTab s WHERE s.demedium = :demedium"),
    @NamedQuery(name = "StudentDegreequalificationDetailsTab.findByDedivision", query = "SELECT s FROM StudentDegreequalificationDetailsTab s WHERE s.dedivision = :dedivision"),
    @NamedQuery(name = "StudentDegreequalificationDetailsTab.findByDepercentage", query = "SELECT s FROM StudentDegreequalificationDetailsTab s WHERE s.depercentage = :depercentage"),
    @NamedQuery(name = "StudentDegreequalificationDetailsTab.findByDeyearOfPass", query = "SELECT s FROM StudentDegreequalificationDetailsTab s WHERE s.deyearOfPass = :deyearOfPass")})
public class StudentDegreequalificationDetailsTab implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "roll_num")
    private String rollNum;
    @Column(name = "dename_institution")
    private String denameInstitution;
    @Column(name = "demedium")
    private String demedium;
    @Column(name = "dedivision")
    private String dedivision;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "depercentage")
    private Double depercentage;
    @Column(name = "deyear_of_pass")
    private Integer deyearOfPass;
    @JoinColumn(name = "roll_num", referencedColumnName = "roll_num", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private StudentTab studentTab;

    public StudentDegreequalificationDetailsTab() {
    }

    public StudentDegreequalificationDetailsTab(String rollNum) {
        this.rollNum = rollNum;
    }

    public String getRollNum() {
        return rollNum;
    }

    public void setRollNum(String rollNum) {
        this.rollNum = rollNum;
    }

    public String getDenameInstitution() {
        return denameInstitution;
    }

    public void setDenameInstitution(String denameInstitution) {
        this.denameInstitution = denameInstitution;
    }

    public String getDemedium() {
        return demedium;
    }

    public void setDemedium(String demedium) {
        this.demedium = demedium;
    }

    public String getDedivision() {
        return dedivision;
    }

    public void setDedivision(String dedivision) {
        this.dedivision = dedivision;
    }

    public Double getDepercentage() {
        return depercentage;
    }

    public void setDepercentage(Double depercentage) {
        this.depercentage = depercentage;
    }

    public Integer getDeyearOfPass() {
        return deyearOfPass;
    }

    public void setDeyearOfPass(Integer deyearOfPass) {
        this.deyearOfPass = deyearOfPass;
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
        if (!(object instanceof StudentDegreequalificationDetailsTab)) {
            return false;
        }
        StudentDegreequalificationDetailsTab other = (StudentDegreequalificationDetailsTab) object;
        if ((this.rollNum == null && other.rollNum != null) || (this.rollNum != null && !this.rollNum.equals(other.rollNum))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.edu.uams.pojo.StudentDegreequalificationDetailsTab[ rollNum=" + rollNum + " ]";
    }
    
}
