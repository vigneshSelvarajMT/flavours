import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class BuildType {
  final String buildName;
  final InheritedWidget appConfig;

  BuildType({
    required this.buildName,
    required this.appConfig,
  });
}

enum DefualtConfig {
  DEBUG,
  RELEASE,
}

class Flavour {
  static const MethodChannel _channel = const MethodChannel(
    'com.vignesh.flavour',
  );
  static late InheritedWidget _currentAppConfiguration;

  static InheritedWidget get currentConfiguration => _currentAppConfiguration;

  static Future<String?> get _getBuildTypeFromPlatform async =>
      await _channel.invokeMethod(
        'BuildType',
      );

  static InheritedWidget get instance => _currentAppConfiguration;

  static Future<InheritedWidget> buildSetup({
    required BuildType debug,
    required BuildType release,
    DefualtConfig defualtConfig = DefualtConfig.DEBUG,
    List<BuildType>? otherBuildType,
  }) async {
    var buildType = await _getBuildTypeFromPlatform;
    late InheritedWidget config;
    if (buildType == debug.buildName) config = debug.appConfig;
    if (buildType == release.buildName) config = release.appConfig;
    final currentBuild = otherBuildType?.firstWhere(
      (element) => element.buildName == buildType,
      orElse: () {
        return debug;
      },
    );
    if (config == null) {
      config = currentBuild?.appConfig ??
          (defualtConfig == DefualtConfig.DEBUG
              ? debug.appConfig
              : release.appConfig);
    }

    _currentAppConfiguration = config;

    return config;
  }
}
