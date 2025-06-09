import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ContextExtensions on BuildContext {
  // Theme Extensions
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  // Screen Metrics
  /// return screen size
  Size get size => MediaQuery.of(this).size;

  /// return screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// return screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// return screen devicePixelRatio
  double pixelRatio() => MediaQuery.of(this).devicePixelRatio;

  /// returns brightness
  Brightness platformBrightness() => MediaQuery.of(this).platformBrightness;

  /// Return the height of status bar
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  /// Return the height of navigation bar
  double get navigationBarHeight => MediaQuery.of(this).padding.bottom;

  // Additional Screen Metrics
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;
  EdgeInsets get padding => MediaQuery.of(this).padding;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  // State Management
  /// Returns Form.of(context)
  FormState? get formState => Form.of(this);

  /// Returns Scaffold.of(context)
  ScaffoldState get scaffoldState => Scaffold.of(this);

  /// Returns Overlay.of(context)
  OverlayState? get overlayState => Overlay.of(this);

  // Colors
  /// Returns primaryColor Color
  Color get primaryColor => theme.primaryColor;

  /// Returns secondaryColor Color
  Color get secondaryColor => theme.colorScheme.secondary;

  /// Returns scaffoldBackgroundColor Color
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  /// Returns cardColor Color
  Color get cardColor => theme.cardColor;

  /// Returns dividerColor Color
  Color get dividerColor => theme.dividerColor;

  /// Returns iconColor Color
  Color get iconColor => theme.iconTheme.color!;

  // Additional Colors
  Color get backgroundColor => theme.colorScheme.surface;
  Color get surfaceColor => theme.colorScheme.surface;
  Color get errorColor => theme.colorScheme.error;

  // Text Styles
  TextStyle? get displayLarge => textTheme.displayLarge;
  TextStyle? get displayMedium => textTheme.displayMedium;
  TextStyle? get displaySmall => textTheme.displaySmall;
  TextStyle? get headlineLarge => textTheme.headlineLarge;
  TextStyle? get headlineMedium => textTheme.headlineMedium;
  TextStyle? get headlineSmall => textTheme.headlineSmall;
  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get titleMedium => textTheme.titleMedium;
  TextStyle? get titleSmall => textTheme.titleSmall;
  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;

  // Focus Management
  /// Request focus to given FocusNode
  void requestFocus(FocusNode focus) => FocusScope.of(this).requestFocus(focus);

  /// Unfocus given FocusNode
  void unFocus(FocusNode focus) => focus.unfocus();

  /// Hide keyboard
  void hideKeyboard() => FocusScope.of(this).unfocus();

  // Enhanced Focus Management
  void nextFocus() => FocusScope.of(this).nextFocus();
  void previousFocus() => FocusScope.of(this).previousFocus();

  // Orientation
  Orientation get orientation => MediaQuery.of(this).orientation;
  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;

  // Navigation
  bool get canPop => Get.key.currentState!.canPop();
  void pop<T extends Object>([T? result]) => Get.back(result: result);
  void to(dynamic page) => Get.to(() => page);
  void toNamed(String routeName,
          {dynamic arguments, Map<String, String>? parameters}) =>
      Get.toNamed(routeName, arguments: arguments, parameters: parameters);
  void offNamed(String routeName,
          {dynamic arguments, Map<String, String>? parameters}) =>
      Get.offNamed(routeName, arguments: arguments, parameters: parameters);
  void offAllNamed(String routeName,
          {dynamic arguments, Map<String, String>? parameters}) =>
      Get.offAllNamed(routeName, arguments: arguments, parameters: parameters);
  void until(String routeName) =>
      Get.until((route) => Get.currentRoute == routeName);
  dynamic arguments() => Get.arguments;
  Map<String, String?> parameters() => Get.parameters;
  String get previousRoute => Get.previousRoute;
  String get currentRoute => Get.currentRoute;

  // Platform Detection
  TargetPlatform get platform => Theme.of(this).platform;
  bool get isAndroid => platform == TargetPlatform.android;
  bool get isIOS => platform == TargetPlatform.iOS;
  bool get isMacOS => platform == TargetPlatform.macOS;
  bool get isWindows => platform == TargetPlatform.windows;
  bool get isFuchsia => platform == TargetPlatform.fuchsia;
  bool get isLinux => platform == TargetPlatform.linux;
  bool get isMobile => isAndroid || isIOS;
  bool get isDesktopPlatform => isWindows || isMacOS || isLinux;

  // Responsive Design
  bool get isPhone => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 900;
  bool get isDesktop => screenWidth >= 900;

  // Relative Dimensions
  double get width10 => screenWidth * 0.1;
  double get width20 => screenWidth * 0.2;
  double get width30 => screenWidth * 0.3;
  double get width40 => screenWidth * 0.4;
  double get width50 => screenWidth * 0.5;
  double get width60 => screenWidth * 0.6;
  double get width70 => screenWidth * 0.7;
  double get width80 => screenWidth * 0.8;
  double get width90 => screenWidth * 0.9;

  double heightPercentage(double percentage) =>
      screenHeight * (percentage / 100);
  double widthPercentage(double percentage) => screenWidth * (percentage / 100);

  // Scaffold Features
  void openDrawer() => Scaffold.of(this).openDrawer();
  void openEndDrawer() => Scaffold.of(this).openEndDrawer();
  void closeDrawer() => scaffoldState.closeDrawer();
  void closeEndDrawer() => scaffoldState.closeEndDrawer();
  void showSnackBar(SnackBar snackBar) =>
      ScaffoldMessenger.of(this).showSnackBar(snackBar);

  // Theme Mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;

  // Utility Methods
  void showBottomSheet(Widget Function(BuildContext) builder) =>
      showModalBottomSheet(context: this, builder: builder);

  Future<bool?> showConfirmationDialog({
    String? title,
    required String message,
    String? confirmText,
    String? cancelText,
  }) async {
    return showDialog<bool>(
      context: this,
      builder: (context) => AlertDialog(
        title: title != null ? Text(title) : null,
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(cancelText ?? 'Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(confirmText ?? 'Confirm'),
          ),
        ],
      ),
    );
  }

  void showLoadingDialog() {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
