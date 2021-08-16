import 'package:flutter/widgets.dart';

class AppConfig extends InheritedWidget {
  late String? buildType;
  final String? baseUrl;

  AppConfig({
    Key? key,
    required Widget child,
    this.buildType,
    this.baseUrl,
  }) : super(key: key, child: child);

  setBuildType(String type) => buildType = type;

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(AppConfig old) {
    return buildType != old.buildType;
  }
}
