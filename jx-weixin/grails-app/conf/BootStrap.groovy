import com.surelution.locator.BaiduLocator
import com.surelution.locator.Location
import com.surelution.wxmp.jx.GasStation
import com.surelution.wxmp.jx.User

class BootStrap {

    def init = { servletContext ->
		//pos client reader
		servletContext.posLoginQrMap = [:]
		servletContext.clientScanMap = [:]
		
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
    }
    def destroy = {
    }
}
