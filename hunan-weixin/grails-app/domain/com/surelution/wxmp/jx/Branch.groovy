package com.surelution.wxmp.jx

import com.surelution.wxmp.jx.Branch;

class Branch {

    static constraints = {
		shortName nullable:true
    }
    
    static mapping = {
        parent nullable:true
		wxGroupId nullable:true
        description nullable:true, type:'text'
    }
	
	String name
	String address
    String pictureName
    String description
    Branch parent
	String shortName
	String uploadFilePath
	String wxGroupId
}
