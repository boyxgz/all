class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"registerPrize", action:"showAwarding")
		"/admin"(view:'/index')
		"500"(view:'/error')
	}
}
