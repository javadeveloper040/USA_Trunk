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
@Table(name = "student_diplomaqualification_details_tab")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StudentDiplomaqualificationDetailsTab.findAll", query = "SELECT s FROM StudentDiplomaqualificationDetailsTab s"),
    @NamedQuery(name = "StudentDiplomaqualificationDetailsTab.findByRollNum", query = "SELECT s FROM StudentDiplomaqualificationDetailsTab s WHERE s.rollNum = :rollNum"),
    @NamedQuery(name = "StudentDiplomaqualificationDetailsTab.findByDinameInstitution", query = "SELECT s FROM StudentDiplomaqualificationDetailsTab s WHERE s.dinameInstitution = :dinameInstitution"),
    @NamedQuery(name = "StudentDiplomaqualificationDetailsTab.findByDimedium", query = "SELECT s FROM StudentDiplomaqualificationDetailsTab s WHERE s.dimedium = :dimedium"),
    @NamedQuery(name = "StudentDiplomaqualificationDetailsTab.findByDidivision", query = "SELECT s FROM StudentDiplomaqualificationDetailsTab s WHERE s.didivision = :didivision"),
    @NamedQuery(name = "StudentDiplomaqualificationDetailsTab.findByDipercentage", query = "SELECT s FROM StudentDiplomaqualificationDetailsTab s WHERE s.dipercentage = :dipercentage"),
    @NamedQuery(name = "StudentDiplomaqualificationDetailsTab.findByDiyearOfPass", query = "SELECT s FROM StudentDiplomaqualificationDetailsTab s WHERE s.diyearOfPass = :diyearOfPass")})
public class StudentDiplomaqualificationDetailsTab implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "roll_num")
    private String rollNum;
    @Column(name = "diname_institution")
    private String dinameInstitution;
    @Column(name = "dimedium")
    private String dimedium;
    @Column(name = "didivision")
    private String didivision;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "dipercentage")
    private Double dipercentage;
    @Column(name = "diyear_of_pass")
    private Integer diyearOfPass;
    @JoinColumn(name = "roll_num", referencedColumnName = "roll_num", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private StudentTab studentTab;

    public StudentDiplomaqualificationDetailsTab() {
    }

    public StudentDiplomaqualificationDetailsTab(String rollNum) {
        this.rollNum = rollNum;
    }

    public String getRollNum() {
        return rollNum;
    }

    public void setRollNum(String rollNum) {
        this.rollNum = rollNum;
    }

    public String getDinameInstitution() {
        return dinameInstitution;
    }

    public void setDinameInstitution(String dinameInstitution) {
        this.dinameInstitution = dinameInstitution;
    }

    public String getDimedium() {
        return dimedium;
    }

    public void setDimedium(String dimedium) {
        this.dimedium = dimedium;
    }

    public String getDidivision() {
        return didivision;
    }

    public void setDidivision(String didivision) {
        this.didivision = didivision;
    }

    public Double getDipercentage() {
        return dipercentage;
    }

    public void setDipercentage(Double dipercentage) {
        this.dipercentage = dipercentage;
    }

    public Integer getDiyearOfPass() {
        return diyearOfPass;
    }

    public void setDiyearOfPass(Integer diyearOfPass) {
        this.diyearOfPass = diyearOfPass;
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
        if (!(object instanceof StudentDiplomaqualificationDetailsTab)) {
            return false;
        }
        StudentDiplomaqualificationDetailsTab other = (StudentDiplomaqualificationDetailsTab) object;
        if ((this.rollNum == null && other.rollNum != null) || (this.rollNum != null && !this.rollNum.equals(other.rollNum))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.edu.uams.pojo.StudentDiplomaqualificationDetailsTab[ rollNum=" + rollNum + " ]";
    }
    
}
