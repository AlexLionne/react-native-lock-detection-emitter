package com.reactlibrary;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.modules.core.DeviceEventManagerModule;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.bridge.Arguments;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.app.KeyguardManager;

public class RNLockDetectionModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNLockDetectionModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
    registerBroadcastReceiver();
  }

  @Override
  public String getName() {
    return "RNLockDetection";
  }

  private void registerBroadcastReceiver() {
    final IntentFilter filter = new IntentFilter();
    /** System Defined Broadcast */
    filter.addAction(Intent.ACTION_SCREEN_ON);
    filter.addAction(Intent.ACTION_SCREEN_OFF);

    BroadcastReceiver screenOnOffReceiver = new BroadcastReceiver() {
      @Override
      public void onReceive(Context context, Intent intent) {
        String strAction = intent.getAction();

        if (strAction.equals(Intent.ACTION_SCREEN_OFF)) sendEvent("LOCKED");
        if (strAction.equals(Intent.ACTION_SCREEN_ON)) sendEvent("UNLOCKED");

      }
    };
    reactContext.registerReceiver(screenOnOffReceiver, filter);
  }

  private void sendEvent(String eventName) {
    WritableMap payload = Arguments.createMap();
    payload.putString("phoneStatus", eventName);
    this.reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("LockStatusChange", payload);
  }

}