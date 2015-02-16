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
@Table(name = "hostel_room")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "HostelRoom.findAll", query = "SELECT h FROM HostelRoom h"),
    @NamedQuery(name = "HostelRoom.findByRoomNum", query = "SELECT h FROM HostelRoom h WHERE h.roomNum = :roomNum"),
    @NamedQuery(name = "HostelRoom.findByRoomCapacity", query = "SELECT h FROM HostelRoom h WHERE h.roomCapacity = :roomCapacity"),
    @NamedQuery(name = "HostelRoom.findById", query = "SELECT h FROM HostelRoom h WHERE h.id = :id")})
public class HostelRoom implements Serializable {
    private static final long serialVersionUID = 1L;
    @Column(name = "room_num")
    private String roomNum;
    @Column(name = "room_capacity")
    private Integer roomCapacity;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @JoinColumn(name = "hostel_code", referencedColumnName = "hostel_code")
    @ManyToOne
    private HostelTab hostelCode;

    public HostelRoom() {
    }

    public HostelRoom(Long id) {
        this.id = id;
    }

    public String getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(String roomNum) {
        this.roomNum = roomNum;
    }

    public Integer getRoomCapacity() {
        return roomCapacity;
    }

    public void setRoomCapacity(Integer roomCapacity) {
        this.roomCapacity = roomCapacity;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public HostelTab getHostelCode() {
        return hostelCode;
    }

    public void setHostelCode(HostelTab hostelCode) {
        this.hostelCode = hostelCode;
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
        if (!(object instanceof HostelRoom)) {
            return false;
        }
        HostelRoom other = (HostelRoom) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mylearning.HostelRoom[ id=" + id + " ]";
    }
    
}
