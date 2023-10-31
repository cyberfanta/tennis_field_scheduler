import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let documentsDirectory = paths[0]
    let url = URL(fileURLWithPath: documentsDirectory)
    do {
        var resourceValues = URLResourceValues()
        resourceValues.isExcludedFromBackup = true
        try url.setResourceValues(resourceValues)
    } catch {
        print("Failed to set resource value: \(error)")
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
