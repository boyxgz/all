package com.surelution.wxmp.jx

import java.util.Date;

class Sanyayou {

    static constraints = {
        awardedAt nullable:true
    }
    
    Subscriber subscriber
    Date createdAt
    Date awardedAt
    AwardingStatus status
    String verifyCode
    boolean finished
    PictureUploading picture
}
