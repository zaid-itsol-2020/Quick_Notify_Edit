import 'package:flutter/services.dart';

import 'quick_notify_platform_interface.dart';

const MethodChannel _channel = const MethodChannel('quick_notify');

class MethodChannelQuickNotify extends QuickNotifyPlatform {
  @override
  Future<bool> hasPermission() async {
    bool result = await _channel.invokeMethod('hasPermission');
    return result;
  }

  @override
  Future<bool> requestPermission() async {
    bool result = await _channel.invokeMethod('requestPermission');
    return result;
  }

  @override
  void notify({
    required String title,
    int? content,
  }) {
    _channel.invokeMethod('notify', {
      'title': title,
      content: content,
    });
  }
}
