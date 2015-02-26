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
@Table(name = "student_personal_details_tab")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StudentPersonalDetailsTab.findAll", query = "SELECT s FROM StudentPersonalDetailsTab s"),
    @NamedQuery(name = "StudentPersonalDetailsTab.findByDob", query = "SELECT s FROM StudentPersonalDetailsTab s WHERE s.dob = :dob"),
    @NamedQuery(name = "StudentPersonalDetailsTab.findByGender", query = "SELECT s FROM StudentPersonalDetailsTab s WHERE s.gender = :gender"),
    @NamedQuery(name = "StudentPersonalDetailsTab.findByParentName", query = "SELECT s FROM StudentPersonalDetailsTab s WHERE s.parentName = :parentName"),
    @NamedQuery(name = "StudentPersonalDetailsTab.findByParentOccup", query = "SELECT s FROM StudentPersonalDetailsTab s WHERE s.parentOccup = :parentOccup"),
    @NamedQuery(name = "StudentPersonalDetailsTab.findByLandNum", query = "SELECT s FROM StudentPersonalDetailsTab s WHERE s.landNum = :landNum"),
    @NamedQuery(name = "StudentPersonalDetailsTab.findByParentMob", query = "SELECT s FROM StudentPersonalDetailsTab s WHERE s.parentMob = :parentMob"),
    @NamedQuery(name = "StudentPersonalDetailsTab.findByStudentMob", query = "SELECT s FROM StudentPersonalDetailsTab s WHERE s.studentMob = :studentMob"),
    @NamedQuery(name = "StudentPersonalDetailsTab.findByEmail", query = "SELECT s FROM StudentPersonalDetailsTab s WHERE s.email = :email"),
    @NamedQuery(name = "StudentPersonalDetailsTab.findByAltEmail", query = "SELECT s FROM StudentPersonalDetailsTab s WHERE s.altEmail = :altEmail"),
    @NamedQuery(name = "StudentPersonalDetailsTab.findByCategory", query = "SELECT s FROM StudentPersonalDetailsTab s WHERE s.category = :category"),
    @NamedQuery(name = "StudentPersonalDetailsTab.findBySeat", query = "SELECT s FROM StudentPersonalDetailsTab s WHERE s.seat = :seat"),
    @NamedQuery(name = "StudentPersonalDetailsTab.findBySeatCategory", query = "SELECT s FROM StudentPersonalDetailsTab s WHERE s.seatCategory = :seatCategory"),
    @NamedQuery(name = "StudentPersonalDetailsTab.findById", query = "SELECT s FROM StudentPersonalDetailsTab s WHERE s.id = :id")})
public class StudentPersonalDetailsTab implements Serializable {
    private static final long serialVersionUID = 1L;
    @Column(name = "dob")
    private String dob;
    @Column(name = "gender")
    private String gender;
    @Column(name = "parent_name")
    private String parentName;
    @Column(name = "parent_occup")
    private String parentOccup;
    @Column(name = "land_num")
    private String landNum;
    @Basic(optional = false)
    @Column(name = "parent_mob")
    private String parentMob;
    @Basic(optional = false)
    @Column(name = "student_mob")
    private String studentMob;
    @Basic(optional = false)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @Column(name = "alt_email")
    private String altEmail;
    @Column(name = "category")
    private String category;
    @Column(name = "seat")
    private String seat;
    @Column(name = "seat_category")
    private String seatCategory;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @JoinColumn(name = "roll_num", referencedColumnName = "roll_num")
    @ManyToOne(optional = false)
    private StudentTab rollNum;

    public StudentPersonalDetailsTab() {
    }

    public StudentPersonalDetailsTab(Long id) {
        this.id = id;
    }

    public StudentPersonalDetailsTab(Long id, String parentMob, String studentMob, String email, String altEmail) {
        this.id = id;
        this.parentMob = parentMob;
        this.studentMob = studentMob;
        this.email = email;
        this.altEmail = altEmail;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public String getParentOccup() {
        return parentOccup;
    }

    public void setParentOccup(String parentOccup) {
        this.parentOccup = parentOccup;
    }

    public String getLandNum() {
        return landNum;
    }

    public void setLandNum(String landNum) {
        this.landNum = landNum;
    }

    public String getParentMob() {
        return parentMob;
    }

    public void setParentMob(String parentMob) {
        this.parentMob = parentMob;
    }

    public String getStudentMob() {
        return studentMob;
    }

    public void setStudentMob(String studentMob) {
        this.studentMob = studentMob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAltEmail() {
        return altEmail;
    }

    public void setAltEmail(String altEmail) {
        this.altEmail = altEmail;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getSeat() {
        return seat;
    }

    public void setSeat(String seat) {
        this.seat = seat;
    }

    public String getSeatCategory() {
        return seatCategory;
    }

    public void setSeatCategory(String seatCategory) {
        this.seatCategory = seatCategory;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public StudentTab getRollNum() {
        return rollNum;
    }

    public void setRollNum(StudentTab rollNum) {
        this.rollNum = rollNum;
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
        if (!(object instanceof StudentPersonalDetailsTab)) {
            return false;
        }
        StudentPersonalDetailsTab other = (StudentPersonalDetailsTab) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.edu.uams.pojo.StudentPersonalDetailsTab[ id=" + id + " ]";
    }
    
}
