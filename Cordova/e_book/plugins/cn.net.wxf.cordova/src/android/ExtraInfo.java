import android.content.res.AssetFileDescriptor; 
import android.content.res.AssetManager;  
import android.media.MediaPlayer;  

public class ExtraInfo extends CordovaPlugin {

    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) 
            throws JSONException {
		MediaPlayer m2 = null; 
        AssetManager am = getAssets(); 
        final Button start = (Button)findViewById(R.id.playerBtn);  
        try{  
            AssetFileDescriptor afd = am.openFd("www/music/yf.mp3");  
            m2 = new MediaPlayer();  
            m2.setDataSource(afd.getFileDescriptor());  
            m2.prepare();
			m2.play();
        }catch(Exception e){
        }  
        Activity activity = this.cordova.getActivity();
        if (action.equals("getExtra")) {
            Intent i = activity.getIntent();
            if (i.hasExtra(Intent.EXTRA_TEXT)) {
                callbackContext.success(i.getStringExtra(Intent.EXTRA_TEXT));
            } else {
                callbackContext.error("");
            }
            return true;
        }
        return false;
    }
}