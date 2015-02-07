package org.edu.uams.pojo;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public abstract class PersonEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private long userId;

	@Column(name = "first_name", unique = true, nullable = false, length = 100)
	private String firstName;

	@Column(name = "last_name", nullable = false, length = 100)
	private String lastName;
	
	@Basic(optional = false)
    @Column(name = "address_line1", nullable = false,length = 100)
    private String addressLine1;
    
    @Basic(optional = true)
    @Column(name = "address_line2", nullable = true,length = 100)
    private String addressLine2;
    
    @Basic(optional = true)
    @Column(name = "address_line3", nullable = true,length = 100)
    private String addressLine3;
    
    @Basic(optional = true)
    @Column(name = "address_line4", nullable = true,length = 100)
    private String addressLine4;
    
    @Basic(optional = false)
    @Column(name = "city", nullable = false)
    private String city;

	@Column(name = "gender", nullable = true, length = 8)
	private String gender;

	@Column(name = "birth_date", nullable = false)
	private Date birthDate ;

}
