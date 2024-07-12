import 'package:design_system/design_system.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

const testDevices = [
  Device.iphone11,
  Device.tabletLandscape,
];

Future<DeviceBuilder> deviceBuilder() async {
  await loadAppFonts();
  return DeviceBuilder()..overrideDevicesForAllScenarios(devices: testDevices);
}

WidgetWrapper appWrapper() => materialAppWrapper(theme: AppTheme.light);
