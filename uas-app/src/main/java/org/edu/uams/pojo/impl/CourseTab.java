/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/

package org.edu.uams.pojo.impl;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "course_tab")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CourseTab.findAll", query = "SELECT c FROM CourseTab c"),
    @NamedQuery(name = "CourseTab.findByCourseName", query = "SELECT c FROM CourseTab c WHERE c.courseTabPK.courseName = :courseName"),
    @NamedQuery(name = "CourseTab.findByCourseDuration", query = "SELECT c FROM CourseTab c WHERE c.courseDuration = :courseDuration"),
    @NamedQuery(name = "CourseTab.findByBranchCode", query = "SELECT c FROM CourseTab c WHERE c.courseTabPK.branchCode = :branchCode"),
    @NamedQuery(name = "CourseTab.findByBranchName", query = "SELECT c FROM CourseTab c WHERE c.courseTabPK.branchName = :branchName"),
    @NamedQuery(name = "CourseTab.findByNumOfSeats", query = "SELECT c FROM CourseTab c WHERE c.numOfSeats = :numOfSeats"),
    @NamedQuery(name = "CourseTab.findByFeeName", query = "SELECT c FROM CourseTab c WHERE c.feeName = :feeName"),
    @NamedQuery(name = "CourseTab.findByFeeAmount", query = "SELECT c FROM CourseTab c WHERE c.feeAmount = :feeAmount"),
    @NamedQuery(name = "CourseTab.findBySeatCategory", query = "SELECT c FROM CourseTab c WHERE c.seatCategory = :seatCategory"),
    @NamedQuery(name = "CourseTab.findByFeeCategory", query = "SELECT c FROM CourseTab c WHERE c.feeCategory = :feeCategory"),
    @NamedQuery(name = "CourseTab.findByPerOfSeatsPerCat", query = "SELECT c FROM CourseTab c WHERE c.perOfSeatsPerCat = :perOfSeatsPerCat"),
    @NamedQuery(name = "CourseTab.findByNumOfSemsPerCourse", query = "SELECT c FROM CourseTab c WHERE c.numOfSemsPerCourse = :numOfSemsPerCourse"),
    @NamedQuery(name = "CourseTab.findByNumOfYears", query = "SELECT c FROM CourseTab c WHERE c.numOfYears = :numOfYears")})
public class CourseTab implements Serializable {
    private static final long serialVersionUID = 1L;
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private long id;
    
    
    @Basic(optional = false)
    @Column(name = "course_duration",precision = 0,length = 3)
    private short courseDuration;
    
    @Basic(optional = false)
    @Column(name = "course_name",length = 50,nullable = false)
    private short courseName;
    
    @Basic(optional = false)
    @Column(name = "branch_code",length = 8,nullable = false)
    private short branchCode;
    
    @Basic(optional = false)
    @Column(name = "branch_code",length = 50,nullable = false)
    private short branchName;
    
    @Basic(optional = false)
    @Column(name = "num_of_seats")
    private int numOfSeats;
    
    @Basic(optional = false)
    @Column(name = "fee_name")
    private String feeName;
    
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @Column(name = "fee_amount")
    private BigDecimal feeAmount;
    
    @Basic(optional = false)
    @Column(name = "seat_category")
    private String seatCategory;
    
    @Basic(optional = false)
    @Column(name = "fee_category")
    private String feeCategory;
    
    @Basic(optional = false)
    @Column(name = "per_of_seats_per_cat")
    private BigDecimal perOfSeatsPerCat;
    
    @Basic(optional = false)
    @Column(name = "num_of_sems_per_course")
    private short numOfSemsPerCourse;
    
    @Basic(optional = false)
    @Column(name = "num_of_years")
    private short numOfYears;
    
    public CourseTab() {
    }
    
    public CourseTab(long id) {
        this.id = id;
    }
    
    public CourseTab(long id, short courseDuration, int numOfSeats, String feeName, BigDecimal feeAmount, String seatCategory, String feeCategory, BigDecimal perOfSeatsPerCat, short numOfSemsPerCourse, short numOfYears) {
        this.courseDuration = courseDuration;
        this.numOfSeats = numOfSeats;
        this.feeName = feeName;
        this.feeAmount = feeAmount;
        this.seatCategory = seatCategory;
        this.feeCategory = feeCategory;
        this.perOfSeatsPerCat = perOfSeatsPerCat;
        this.numOfSemsPerCourse = numOfSemsPerCourse;
        this.numOfYears = numOfYears;
    }
    
    public short getCourseDuration() {
        return courseDuration;
    }
    
    public void setCourseDuration(short courseDuration) {
        this.courseDuration = courseDuration;
    }
    
    public int getNumOfSeats() {
        return numOfSeats;
    }
    
    public void setNumOfSeats(int numOfSeats) {
        this.numOfSeats = numOfSeats;
    }
    
    public String getFeeName() {
        return feeName;
    }
    
    public void setFeeName(String feeName) {
        this.feeName = feeName;
    }
    
    public BigDecimal getFeeAmount() {
        return feeAmount;
    }
    
    public void setFeeAmount(BigDecimal feeAmount) {
        this.feeAmount = feeAmount;
    }
    
    public String getSeatCategory() {
        return seatCategory;
    }
    
    public void setSeatCategory(String seatCategory) {
        this.seatCategory = seatCategory;
    }
    
    public String getFeeCategory() {
        return feeCategory;
    }
    
    public void setFeeCategory(String feeCategory) {
        this.feeCategory = feeCategory;
    }
    
    public BigDecimal getPerOfSeatsPerCat() {
        return perOfSeatsPerCat;
    }
    
    public void setPerOfSeatsPerCat(BigDecimal perOfSeatsPerCat) {
        this.perOfSeatsPerCat = perOfSeatsPerCat;
    }
    
    public short getNumOfSemsPerCourse() {
        return numOfSemsPerCourse;
    }
    
    public void setNumOfSemsPerCourse(short numOfSemsPerCourse) {
        this.numOfSemsPerCourse = numOfSemsPerCourse;
    }
    
    public short getNumOfYears() {
        return numOfYears;
    }
    
    public void setNumOfYears(short numOfYears) {
        this.numOfYears = numOfYears;
    }
    
    public long getId() {
        return id;
    }
    
    public void setId(long id) {
        this.id = id;
    }
    
    public short getBranchCode() {
        return branchCode;
    }
    
    public void setBranchCode(short branchCode) {
        this.branchCode = branchCode;
    }
    
    public short getBranchName() {
        return branchName;
    }
    
    public void setBranchName(short branchName) {
        this.branchName = branchName;
    }
    
    @Override
    public String toString() {
        return "com.mylearning.CourseTab[ id=" + id + " ]";
    }
    
}
