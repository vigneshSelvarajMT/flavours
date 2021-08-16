import 'package:flavour/flavour.dart';
import 'package:flutter/material.dart';

import 'AppConfig.dart';

void main() async {
  runApp(
    await Flavour.buildSetup(
      debug: BuildType(
        appConfig: AppConfig(
          child: MyApp(),
          baseUrl: "debug-url",
        ),
        buildName: 'debug',
      ),
      release: BuildType(
        appConfig: AppConfig(
          child: MyApp(),
          baseUrl: "release-url",
        ),
        buildName: 'release',
      ),
      otherBuildType: [
        BuildType(
          appConfig: AppConfig(
            child: MyApp(),
            baseUrl: "adhoc-url",
          ),
          buildName: 'adhoc',
        ),
        BuildType(
          appConfig: AppConfig(
            child: MyApp(),
            baseUrl: "staging-url",
          ),
          buildName: 'staging',
        ),
      ],
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flavour setup example",
        ),
      ),
      body: Center(
        child: Text(
          (AppConfig.of(context)?.buildType) ?? "unknown",
        ),
      ),
    );
  }
}
