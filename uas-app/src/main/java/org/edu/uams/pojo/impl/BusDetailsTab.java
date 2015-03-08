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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "bus_details_tab")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BusDetailsTab.findAll", query = "SELECT b FROM BusDetailsTab b"),
    @NamedQuery(name = "BusDetailsTab.findByBusNum", query = "SELECT b FROM BusDetailsTab b WHERE b.busNum = :busNum"),
    @NamedQuery(name = "BusDetailsTab.findByNumOfSeats", query = "SELECT b FROM BusDetailsTab b WHERE b.numOfSeats = :numOfSeats"),
    @NamedQuery(name = "BusDetailsTab.findByDriverName", query = "SELECT b FROM BusDetailsTab b WHERE b.driverName = :driverName"),
    @NamedQuery(name = "BusDetailsTab.findByDriverMob", query = "SELECT b FROM BusDetailsTab b WHERE b.driverMob = :driverMob"),
    @NamedQuery(name = "BusDetailsTab.findByFacultyName", query = "SELECT b FROM BusDetailsTab b WHERE b.facultyName = :facultyName"),
    @NamedQuery(name = "BusDetailsTab.findByFacultyMob", query = "SELECT b FROM BusDetailsTab b WHERE b.facultyMob = :facultyMob"),
    @NamedQuery(name = "BusDetailsTab.findByCoordinatorName", query = "SELECT b FROM BusDetailsTab b WHERE b.coordinatorName = :coordinatorName"),
    @NamedQuery(name = "BusDetailsTab.findByCoordinatorMob", query = "SELECT b FROM BusDetailsTab b WHERE b.coordinatorMob = :coordinatorMob"),
    @NamedQuery(name = "BusDetailsTab.findByInchargeName", query = "SELECT b FROM BusDetailsTab b WHERE b.inchargeName = :inchargeName"),
    @NamedQuery(name = "BusDetailsTab.findByInchargeMob", query = "SELECT b FROM BusDetailsTab b WHERE b.inchargeMob = :inchargeMob")})
public class BusDetailsTab implements Serializable {
    private static final long serialVersionUID = 1L;
    
     @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private long id;
    
    @Basic(optional = false)
    @Column(name = "bus_num")
    private Integer busNum;
    
    @Basic(optional = false)
    @Column(name = "num_of_seats")
    private int numOfSeats;
    
    @Basic(optional = false)
    @Column(name = "driver_name")
    private String driverName;
    
    @Basic(optional = false)
    @Column(name = "driver_mob")
    private long driverMob;
    
    @Basic(optional = false)
    @Column(name = "faculty_name")
    private String facultyName;
    
    @Basic(optional = false)
    @Column(name = "faculty_mob")
    private long facultyMob;
    
    @Basic(optional = false)
    @Column(name = "coordinator_name")
    private String coordinatorName;
    
    @Basic(optional = false)
    @Column(name = "coordinator_mob")
    private long coordinatorMob;
    
    @Basic(optional = false)
    @Column(name = "incharge_name")
    private String inchargeName;
    
    @Basic(optional = false)
    @Column(name = "incharge_mob")
    private long inchargeMob;
    
    @JoinColumn(name = "layout_name", referencedColumnName = "layout_name")
    @ManyToOne(optional = false)
    private LayoutTab layoutName;

    public BusDetailsTab() {
    }

    public BusDetailsTab(Integer busNum) {
        this.busNum = busNum;
    }

    public BusDetailsTab(Integer busNum, int numOfSeats, String driverName, long driverMob, String facultyName, long facultyMob, String coordinatorName, long coordinatorMob, String inchargeName, long inchargeMob) {
        this.busNum = busNum;
        this.numOfSeats = numOfSeats;
        this.driverName = driverName;
        this.driverMob = driverMob;
        this.facultyName = facultyName;
        this.facultyMob = facultyMob;
        this.coordinatorName = coordinatorName;
        this.coordinatorMob = coordinatorMob;
        this.inchargeName = inchargeName;
        this.inchargeMob = inchargeMob;
    }

    public Integer getBusNum() {
        return busNum;
    }

    public void setBusNum(Integer busNum) {
        this.busNum = busNum;
    }

    public int getNumOfSeats() {
        return numOfSeats;
    }

    public void setNumOfSeats(int numOfSeats) {
        this.numOfSeats = numOfSeats;
    }

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public long getDriverMob() {
        return driverMob;
    }

    public void setDriverMob(long driverMob) {
        this.driverMob = driverMob;
    }

    public String getFacultyName() {
        return facultyName;
    }

    public void setFacultyName(String facultyName) {
        this.facultyName = facultyName;
    }

    public long getFacultyMob() {
        return facultyMob;
    }

    public void setFacultyMob(long facultyMob) {
        this.facultyMob = facultyMob;
    }

    public String getCoordinatorName() {
        return coordinatorName;
    }

    public void setCoordinatorName(String coordinatorName) {
        this.coordinatorName = coordinatorName;
    }

    public long getCoordinatorMob() {
        return coordinatorMob;
    }

    public void setCoordinatorMob(long coordinatorMob) {
        this.coordinatorMob = coordinatorMob;
    }

    public String getInchargeName() {
        return inchargeName;
    }

    public void setInchargeName(String inchargeName) {
        this.inchargeName = inchargeName;
    }

    public long getInchargeMob() {
        return inchargeMob;
    }

    public void setInchargeMob(long inchargeMob) {
        this.inchargeMob = inchargeMob;
    }

    public LayoutTab getLayoutName() {
        return layoutName;
    }

    public void setLayoutName(LayoutTab layoutName) {
        this.layoutName = layoutName;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (busNum != null ? busNum.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BusDetailsTab)) {
            return false;
        }
        BusDetailsTab other = (BusDetailsTab) object;
        if ((this.busNum == null && other.busNum != null) || (this.busNum != null && !this.busNum.equals(other.busNum))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mylearning.BusDetailsTab[ busNum=" + busNum + " ]";
    }
    
}
