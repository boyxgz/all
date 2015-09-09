import grails.plugin.springsecurity.SecurityConfigType;

// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.app.context = "/"
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'


grails.databinding.dateFormats = ['yyyy-MM-dd', "yyyy-MM-dd HH:mm:ss.S"]

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
        app.file.upload.path = "/Users/syujohnny/picture_upload/"
		app.web.path = "surelution.sh-hansi.com"
		app.fall2015.file.upload.path = "/Users/johnny/tmp4hunan/"
    }
    production {
        grails.logging.jul.usebridge = false
        app.file.upload.path = "/home/jx_wx_dir/"
		app.web.path = "hunan.sh-hansi.com"
		app.fall2015.file.upload.path = "E:\\weixin-pictures\\2015fall\\"
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.surelution.wxmp.jx.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.surelution.wxmp.jx.UserRole'
grails.plugin.springsecurity.authority.className = 'com.surelution.wxmp.jx.Role'
grails.plugin.springsecurity.requestMap.className = 'com.surelution.wxmp.jx.Requestmap'
grails.plugin.springsecurity.securityConfigType = SecurityConfigType.Requestmap
grails.plugin.springsecurity.logout.postOnly = false

//grails.plugin.springsecurity.securityConfigType = SecurityConfigType.InterceptUrlMap
//grails.plugin.springsecurity.interceptUrlMap = [
//	'/**':               ['IS_AUTHENTICATED_ANONYMOUSLY']
//]

ckeditor {
	config = "/js/myckconfig.js"
	skipAllowedItemsCheck = false
	defaultFileBrowser = "ofm"
	upload {
		basedir = "/uploads/"
		overwrite = false
		
		link {
			browser = true
			upload = false
			allowed = []
			denied = ['html', 'htm', 'php', 'php2', 'php3', 'php4', 'php5',
					  'phtml', 'pwml', 'inc', 'asp', 'aspx', 'ascx', 'jsp',
					  'cfm', 'cfc', 'pl', 'bat', 'exe', 'com', 'dll', 'vbs', 'js', 'reg',
					  'cgi', 'htaccess', 'asis', 'sh', 'shtml', 'shtm', 'phtm']
		}
		image {
			browser = true
			upload = true
			allowed = ['jpg', 'gif', 'jpeg', 'png']
			denied = []
		}
		flash {
			browser = false
			upload = false
			allowed = ['swf']
			denied = []
		}
	}
}