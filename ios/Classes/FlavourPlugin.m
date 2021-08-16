#import "FlavourPlugin.h"
#if __has_include(<flavour/flavour-Swift.h>)
#import <flavour/flavour-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flavour-Swift.h"
#endif

@implementation FlavourPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlavourPlugin registerWithRegistrar:registrar];
}
@end
