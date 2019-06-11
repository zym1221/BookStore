package zym;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyTools {
	/**
	 * @鍔熻兘 灏唅nt鍨嬫暟鎹浆鎹负String鍨嬫暟鎹�
	 * @鍙傛暟 num涓鸿杞崲鐨刬nt鍨嬫暟鎹�
	 * @杩斿洖鍊� String绫诲瀷
	 */
	public static String intToStr(int num){
		return String.valueOf(num);
	}
	/** 
	 * @鍔熻兘 姣旇緝鏃堕棿銆�
	 * @鍙傛暟 today褰撳墠鏃堕棿锛宼emp涓轰笂娆℃姇绁ㄦ椂闂淬�傝繖涓や釜鍙傛暟閮芥槸浠ユ绉掓樉绀虹殑鏃堕棿
	 * @杩斿洖鍊� String绫诲瀷 
	 */
	public static String compareTime(long today,long temp){
		int limitTime=0;								//璁剧疆闄愬埗鏃堕棿涓�60鍒嗛挓	
		long count=today-temp;							//璁＄畻褰撳墠鏃堕棿涓庝笂娆℃姇绁ㄦ椂闂寸浉宸殑姣鏁�(璇ョ粨鏋滀竴瀹氭槸澶т簬绛変簬0)
		if(count<=limitTime*60*1000)					//濡傛灉鐩稿樊灏忎簬绛変簬60鍒嗛挓(1鍒�=60绉掞紝1绉�=1000姣)
			return "no";
		else											//濡傛灉鐩稿樊澶т簬60鍒嗛挓
			return "yes";
	}
	/**
	 * @鍔熻兘 鏍煎紡鍖栨椂闂翠负鎸囧畾鏍煎紡銆傞鍏堥�氳繃Date绫荤殑鏋勯�犳柟娉曟牴鎹粰鍑虹殑姣鏁拌幏鍙栦竴涓椂闂达紝鐒跺悗灏嗚鏃堕棿杞崲涓烘寚瀹氭牸寮忥紝濡�"骞�-鏈�-鏃� 鏃�:鍒�:绉�"
	 * @鍙傛暟 ms涓烘绉掓暟
	 * @杩斿洖鍊� String绫诲瀷
	 */
	public static String formatDate(long ms){
		Date date=new Date(ms);
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strDate=format.format(date);
		return strDate;
	}
	public static int strToint(String str) { //灏哠tring鍨嬫暟鎹浆鎹负int鍨嬫暟鎹殑鏂规硶
		if(str==null||str.equals(""))
			str="0";
		int i=0;
		try{
			i=Integer.parseInt(str);
		}catch(NumberFormatException e){
			i=0;
			e.printStackTrace();
		}
		return i;
	}
	public static String toChinese(String str) {  //杩涜杞爜鎿嶄綔鐨勬柟娉�
		if(str==null)
			str="";
		try{
			str=new String(str.getBytes("ISO-8859-1"),"gb2312");
		}catch(UnsupportedEncodingException e){
			str="";
			e.printStackTrace();
		}
		return str;
	}
}
