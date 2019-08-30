package com.toly1994.flutter_journey;

import android.content.Context;
import android.widget.Toast;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** AoVersionPlugin */
public class AoVersionPlugin implements MethodCallHandler {
  private Context context;

  private AoVersionPlugin(Context context){
    this.context = context;

  }

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "ao_version");
    channel.setMethodCallHandler(new AoVersionPlugin(registrar.context()));
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } if (call.method.equals("toast")){
        Toast.makeText(context,"捷特来信：我和巫缨在Flutter世界，一切安好,勿念。",Toast.LENGTH_LONG).show();
    } else{
      result.notImplemented();
    }
  }
}
