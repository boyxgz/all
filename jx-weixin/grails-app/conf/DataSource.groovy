dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    username = "root"
    password = "root4zj"
    dbCreate = "update"
    url = "jdbc:mysql://localhost/jiaxing_mp?createDatabaseIfNotExist=true&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true"
	
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
		    username = "root"
		    password = ""
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost/jx_mp2?useUnicode=true&characterEncoding=utf8"
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
            url = "jdbc:mysql://localhost/tour?useUnicode=true&characterEncoding=utf8"
        }
    }
    production {
        dataSource {
			username = "jx_mp"
			password = "root4jx"
			dbCreate = "update"
			url = "jdbc:mysql://rdsjv3ujzbriy7j.mysql.rds.aliyuncs.com/jx_mp?createDatabaseIfNotExist=true&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true"
			
//		    username = "root"
//		    password = ""
//            dbCreate = "update" // one of 'create', 'create-drop','update'
//            url = "jdbc:mysql://localhost/jiaxing_mp2?useUnicode=true&characterEncoding=utf8"
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
}
