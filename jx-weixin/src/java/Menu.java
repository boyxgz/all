

import java.io.BufferedReader;
import java.io.InputStreamReader;

import com.surelution.whistle.push.Pusher;


public class Menu {

    public static void main(String[] args) throws Exception {
        String cmd = "";
        InputStreamReader isr = new InputStreamReader(Menu.class.getResourceAsStream("menu.txt"), "utf8");
        BufferedReader br = new BufferedReader(isr);
        String line = br.readLine();
        while(line != null) {
            cmd += line;
            cmd += "\n";
            line = br.readLine();
        }
        br.close();
        Pusher p = new Pusher();
        p.setApiUrl("https://api.weixin.qq.com/cgi-bin/menu/create?"); 
        System.out.println(p.push(cmd));
    }
}
