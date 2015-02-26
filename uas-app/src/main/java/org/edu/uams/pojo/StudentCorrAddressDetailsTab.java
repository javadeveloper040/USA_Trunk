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
@Table(name = "student_corr_address_details_tab")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StudentCorrAddressDetailsTab.findAll", query = "SELECT s FROM StudentCorrAddressDetailsTab s"),
    @NamedQuery(name = "StudentCorrAddressDetailsTab.findByRollNum", query = "SELECT s FROM StudentCorrAddressDetailsTab s WHERE s.rollNum = :rollNum"),
    @NamedQuery(name = "StudentCorrAddressDetailsTab.findByDoorNum", query = "SELECT s FROM StudentCorrAddressDetailsTab s WHERE s.doorNum = :doorNum"),
    @NamedQuery(name = "StudentCorrAddressDetailsTab.findByStreetName", query = "SELECT s FROM StudentCorrAddressDetailsTab s WHERE s.streetName = :streetName"),
    @NamedQuery(name = "StudentCorrAddressDetailsTab.findByAreaName", query = "SELECT s FROM StudentCorrAddressDetailsTab s WHERE s.areaName = :areaName"),
    @NamedQuery(name = "StudentCorrAddressDetailsTab.findByDistrictName", query = "SELECT s FROM StudentCorrAddressDetailsTab s WHERE s.districtName = :districtName"),
    @NamedQuery(name = "StudentCorrAddressDetailsTab.findByPin", query = "SELECT s FROM StudentCorrAddressDetailsTab s WHERE s.pin = :pin")})
public class StudentCorrAddressDetailsTab implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "roll_num")
    private String rollNum;
    @Column(name = "door_num")
    private String doorNum;
    @Column(name = "street_name")
    private String streetName;
    @Column(name = "area_name")
    private String areaName;
    @Column(name = "district_name")
    private String districtName;
    @Column(name = "pin")
    private Long pin;
    @JoinColumn(name = "roll_num", referencedColumnName = "roll_num", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private StudentTab studentTab;

    public StudentCorrAddressDetailsTab() {
    }

    public StudentCorrAddressDetailsTab(String rollNum) {
        this.rollNum = rollNum;
    }

    public String getRollNum() {
        return rollNum;
    }

    public void setRollNum(String rollNum) {
        this.rollNum = rollNum;
    }

    public String getDoorNum() {
        return doorNum;
    }

    public void setDoorNum(String doorNum) {
        this.doorNum = doorNum;
    }

    public String getStreetName() {
        return streetName;
    }

    public void setStreetName(String streetName) {
        this.streetName = streetName;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public Long getPin() {
        return pin;
    }

    public void setPin(Long pin) {
        this.pin = pin;
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
        if (!(object instanceof StudentCorrAddressDetailsTab)) {
            return false;
        }
        StudentCorrAddressDetailsTab other = (StudentCorrAddressDetailsTab) object;
        if ((this.rollNum == null && other.rollNum != null) || (this.rollNum != null && !this.rollNum.equals(other.rollNum))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.edu.uams.pojo.StudentCorrAddressDetailsTab[ rollNum=" + rollNum + " ]";
    }
    
}
