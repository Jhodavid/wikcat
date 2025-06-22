import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class BrowserIntentUtil {

  late MethodChannel _channel;

  BrowserIntentUtil() {
    _channel = const MethodChannel('com.johcode.wikcat');
  }

  void startBrowserIntent(String url) async {
    const method = '/startBrowserIntent';

    try {
      await _channel.invokeMethod(method, url);
    } on PlatformException catch(e) {
      if(kDebugMode) print(e);
    }
  }
}