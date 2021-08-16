import Cocoa
import FlutterMacOS

public class FlavourPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "com.vignesh.flavour", binaryMessenger: registrar.messenger)
    let instance = FlavourPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "BuildType":
      result(Bundle.main.infoDictionary?["BuildType"])
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
