package com.surelution.wxmp.jx

class AwardingStatus {
    
    public static final String NEW = "new"
    public static final String DRAWN = "drawn"
    public static final String AWARDED = "awarded"
    public static final String REJECTED = "rejected"

    static constraints = {
        code unique:true
    }
    
    String code
    String title
}
