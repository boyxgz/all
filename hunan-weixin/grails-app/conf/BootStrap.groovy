import com.surelution.locator.BaiduLocator
import com.surelution.locator.Location
import com.surelution.wxmp.jx.GasStation
import com.surelution.wxmp.jx.KeyedMessage
import com.surelution.wxmp.jx.Role
import com.surelution.wxmp.jx.User

class BootStrap {

    def init = { servletContext ->
		def stations = GasStation.createCriteria().list {
			eq('active', true)
		}
		def locations = stations.collect {station ->
			new Location((int)station.id, (float)station.longitude, (float)station.latitude)
		}
		BaiduLocator.instance.feed(locations)
		
		User admin = User.findByUsername("admin")
		if(!admin) {
			admin = new User(username:"admin", password:"admin", 
				enabled: true, accountExpired: false, accountLocked: false)
			admin.save(flush:true)
		}
		
		Role roleAdmin = Role.findByAuthority("ROLE_ADMIN")
		if(!roleAdmin) {
			roleAdmin = new Role()
			roleAdmin.authority = "ROLE_ADMIN"
			roleAdmin.save(flush:true)
		}
		
		Role roleBranch = Role.findByAuthority("ROLE_BRANCH")
		if(!roleBranch) {
			roleBranch = new Role()
			roleBranch.authority = "ROLE_BRANCH"
			roleBranch.save(flush:true)
		}
		
		Role roleGasStation = Role.findByAuthority("ROLE_STATION")
		if(!roleGasStation) {
			roleGasStation = new Role()
			roleGasStation.authority = "ROLE_STATION"
			roleGasStation.save(flush:true)
		}
		
		Role roleHeadquarter = Role.findByAuthority("ROLE_HEADQUARTER")
		if(!roleHeadquarter) {
			roleHeadquarter = new Role()
			roleHeadquarter.authority = "ROLE_HEADQUARTER"
			roleHeadquarter.save(flush:true)
		}
		
		KeyedMessage km1 = KeyedMessage.findByKey("CardPrecontractingStatus-INIT")
		if(!km1) {
			km1 = new KeyedMessage()
			km1.key = "CardPrecontractingStatus-INIT"
			km1.message = "初始"
			km1.description = "初始"
			km1.save(flush:true)
		}
		
		KeyedMessage km2 = KeyedMessage.findByKey("CardPrecontractingStatus-VALID")
		if(!km2) {
			km2 = new KeyedMessage()
			km2.key = "CardPrecontractingStatus-VALID"
			km2.message = "有效"
			km2.description = "有效"
			km2.save(flush:true)
		}
		
		KeyedMessage km3 = KeyedMessage.findByKey("CardPrecontractingStatus-INVALID")
		if(!km3) {
			km3 = new KeyedMessage()
			km3.key = "CardPrecontractingStatus-INVALID"
			km3.message = "无效"
			km3.description = "无效"
			km3.save(flush:true)
		}
    }

    def destroy = {
    }
}
