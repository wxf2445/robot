import android.content.res.AssetFileDescriptor; 
import android.content.res.AssetManager;  
import android.media.MediaPlayer; 
import android.app.Activity;   

import org.json.JSONArray;
import org.json.JSONException;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;

import android.content.Context;
import android.content.Intent;

public class ExtraInfo extends CordovaPlugin {

    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) 
            throws JSONException {
        Activity activity = this.cordova.getActivity();
        if (action.equals("getExtra")) {
			MediaPlayer m2 = null; 
	        AssetManager am = this.cordova.getActivity().getAssets(); 
	        try{  
	            AssetFileDescriptor afd = am.openFd("www\\music\\yf.mp3");  
	            m2 = new MediaPlayer();  
	            m2.setDataSource(afd.getFileDescriptor());  
	            m2.prepare();
				m2.start();
	            Intent i = activity.getIntent();
	            if (i.hasExtra(Intent.EXTRA_TEXT)) {
	                callbackContext.success(i.getStringExtra(Intent.EXTRA_TEXT));
	            } else {
	                callbackContext.error("error");
	            }
	        }catch(Exception e)   {
	            Intent i = activity.getIntent();
	            if (i.hasExtra(Intent.EXTRA_TEXT)) {
	                callbackContext.success(i.getStringExtra(Intent.EXTRA_TEXT));
	            } else {
	                callbackContext.error("error");
	            }
	        }
            return true;
        }
        return false;
    }
}