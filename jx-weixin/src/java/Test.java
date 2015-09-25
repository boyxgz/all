import com.surelution.whistle.core.Auth2Util;
import com.surelution.whistle.core.Auth2Util.AuthScope;


/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
public class Test {

	public static void main(String[] args) {
		System.out.println(Auth2Util.buildRedirectUrl("http://jx.sh-hansi.com/vehicle/violate", null, AuthScope.BASE));
	}
}
