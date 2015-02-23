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
@Table(name = "building_tab")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BuildingTab.findAll", query = "SELECT b FROM BuildingTab b"),
    @NamedQuery(name = "BuildingTab.findByRoomNum", query = "SELECT b FROM BuildingTab b WHERE b.roomNum = :roomNum"),
    @NamedQuery(name = "BuildingTab.findByBlockName", query = "SELECT b FROM BuildingTab b WHERE b.blockName = :blockName"),
    @NamedQuery(name = "BuildingTab.findByBranchName", query = "SELECT b FROM BuildingTab b WHERE b.branchName = :branchName"),
    @NamedQuery(name = "BuildingTab.findBySem", query = "SELECT b FROM BuildingTab b WHERE b.sem = :sem"),
    @NamedQuery(name = "BuildingTab.findByAllotedStatus", query = "SELECT b FROM BuildingTab b WHERE b.allotedStatus = :allotedStatus"),
    @NamedQuery(name = "BuildingTab.findById", query = "SELECT b FROM BuildingTab b WHERE b.id = :id")})
public class BuildingTab implements Serializable {
    private static final long serialVersionUID = 1L;
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private long id;
    
    @Basic(optional = false)
    @Column(name = "room_num")
    private String roomNum;
    
    @Basic(optional = false)
    @Column(name = "block_name")
    private String blockName;
    
    @Column(name = "branch_name")
    private String branchName;
    
    @Column(name = "sem")
    private Short sem;
    
    @Basic(optional = false)
    @Column(name = "alloted_status")
    private String allotedStatus;
    

    public BuildingTab() {
    }

    public BuildingTab(long id) {
        this.id = id;
    }

    public BuildingTab(Long id, String roomNum, String blockName, String allotedStatus) {
        this.id = id;
        this.roomNum = roomNum;
        this.blockName = blockName;
        this.allotedStatus = allotedStatus;
    }

    public String getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(String roomNum) {
        this.roomNum = roomNum;
    }

    public String getBlockName() {
        return blockName;
    }

    public void setBlockName(String blockName) {
        this.blockName = blockName;
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

    public String getAllotedStatus() {
        return allotedStatus;
    }

    public void setAllotedStatus(String allotedStatus) {
        this.allotedStatus = allotedStatus;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "com.mylearning.BuildingTab[ id=" + id + " ]";
    }
    
}
