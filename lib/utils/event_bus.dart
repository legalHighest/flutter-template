import 'dart:async';

import 'package:event_bus/event_bus.dart';

class EventBusUtil {
  // 工厂模式
  factory EventBusUtil() => _getInstance();
  static EventBusUtil get instance => _getInstance();
  static EventBusUtil? _instance;
  static EventBus? _eventBus;

  EventBusUtil._internal() {
    // 创建EventBus实例
    _eventBus = EventBus();
  }

  static EventBusUtil _getInstance() {
    _instance ??= EventBusUtil._internal();
    return _instance!;
  }

  // 发送事件
  static void fireEvent(Object event) {
    _eventBus!.fire(event);
  }

  // 订阅事件
  static StreamSubscription<T> addListener<T>(void Function(T event) onData) {
    return _eventBus!.on<T>().listen((event) {
      onData(event);
    });
  }

  // 取消订阅
  static void removeListener(StreamSubscription subscription) {
    subscription.cancel();
  }
}

class CustomEvent {
  String? msg;
  CustomEvent(this.msg);
}
