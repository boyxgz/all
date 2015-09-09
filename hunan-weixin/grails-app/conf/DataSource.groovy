dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
	
	validationQuery="SELECT 1"
	testOnBorrow=true
	testOnReturn=true
	testWhileIdle=true
	
	timeBetweenEvictionRunsMillis=1000 * 60 * 30
	numTestsPerEvictionRun=3
	minEvictableIdleTimeMillis=1000 * 60 * 30

}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
		    username = "root"
		    password = ""
            url = "jdbc:mysql://localhost/hunan_mp_10?useUnicode=true&characterEncoding=utf8"
			loggingSql = true

			validationQuery="SELECT 1"
			testOnBorrow=true
			testOnReturn=true
			testWhileIdle=true
			
			timeBetweenEvictionRunsMillis=1000 * 60 * 30
			numTestsPerEvictionRun=3
			minEvictableIdleTimeMillis=1000 * 60 * 30
        }
    }
    test {
        dataSource {
            dbCreate = "update"
			username="test1"
			password="asdf1234"
//            url = "jdbc:mysql://localhost/tour?useUnicode=true&characterEncoding=utf8"
			url = "jdbc:mysql://10.208.155.75/hunan_mp??useUnicode=true&characterEncoding=utf8"
        }
    }
    production {
        dataSource {
//		    username = "root"
			username = "hunan_mp"
//		    password = "root4hn"
		    password = "root4hunanmp"
            dbCreate = "update"
//            url = "jdbc:mysql://rdsjv3ujzbriy7j.mysql.rds.aliyuncs.com/hunan_mp?createDatabaseIfNotExist=true&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true"
			url = "jdbc:mysql://10.208.155.75/hunan_mp??useUnicode=true&characterEncoding=utf8"
			
			validationQuery="SELECT 1"
			testOnBorrow=true
			testOnReturn=true
			testWhileIdle=true
			
			timeBetweenEvictionRunsMillis=1000 * 60 * 30
			numTestsPerEvictionRun=3
			minEvictableIdleTimeMillis=1000 * 60 * 30
        }
    }
}
