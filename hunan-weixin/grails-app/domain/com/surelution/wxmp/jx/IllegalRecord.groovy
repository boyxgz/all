package com.surelution.wxmp.jx

class IllegalRecord {

    static constraints = {
    }
    
    static mapping = {
        status column:'c_status'
    }
    
    Date illegalAt
    String address
    String illegalAction
    String status
    String policeOffice
    
}
