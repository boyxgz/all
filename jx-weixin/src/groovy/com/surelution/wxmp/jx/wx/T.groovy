package com.surelution.wxmp.jx.wx

class T {

    public static void main(String[] args) {
        def f = new File("/Users/syujohnny/Desktop/v.txt")
        int i = 0;
        f.eachLine {
            def line = it.trim()
            if(line) {
                println "insert into vehicle_type (c_value, title) values('${++i}','${line.substring(line.indexOf('>') + 1, line.indexOf('</option>'))}');"
//                println "${line.substring(line.indexOf('>') + 1, line.indexOf('</option>'))}:${++i}"
            }
        }
    }
}
