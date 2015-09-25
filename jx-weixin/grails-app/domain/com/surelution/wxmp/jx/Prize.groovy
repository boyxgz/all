package com.surelution.wxmp.jx

class Prize {

    static constraints = {
        description blank:true 
        description nullable:true 
    }
    
    static mapping = {
        description length:1024
        empty column:'c_empty'
    }
    
    String name
    String description
    Float price
    int amount
    boolean empty
}
