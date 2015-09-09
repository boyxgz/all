package com.surelution.wxmp.jx

class PrizeAwarding {

    static constraints = {
        awardedAt nullable:true
        awardedBy nullable:true
        token unique : true
        prize nullable:true
    }
    
    static mapping = {
        token column:'c_token'
    }

    Prize prize
    Subscriber subscriber
    String awardedBy
    Date createdAt
    Date awardedAt
    AwardingStatus status
    String token
    int wheelIndex
    String verifyCode
    boolean finished
    PictureUploading picture
}
