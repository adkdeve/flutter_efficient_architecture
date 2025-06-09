extension StringExtensions on String {
  // Validation Methods
  bool get isEmail =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);

  bool get isPhone => RegExp(r'^\+?[0-9]{7,15}$').hasMatch(this);

  bool get isUrl => RegExp(
          r'^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-zA-Z0-9]+([\-\.]{1}[a-zA-Z0-9]+)*\.[a-zA-Z]{2,5}(:[0-9]{1,5})?(\/.*)?$')
      .hasMatch(this);

  bool get isNumeric => RegExp(r'^-?[0-9]+\.?[0-9]*$').hasMatch(this);

  bool get isAlpha => RegExp(r'^[a-zA-Z]+$').hasMatch(this);

  bool get isAlphanumeric => RegExp(r'^[a-zA-Z0-9]+$').hasMatch(this);

  bool get hasSpecialCharacters =>
      RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(this);

  bool get isStrongPassword => RegExp(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
      .hasMatch(this);

  // Text Manipulation
  String capitalize() =>
      isEmpty ? '' : '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  String capitalizeEachWord() => split(' ')
      .map((word) => word.isEmpty
          ? ''
          : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}')
      .join(' ');

  String get camelCase => capitalizeEachWord().replaceAll(' ', '');

  String get snakeCase => replaceAll(' ', '_').toLowerCase().replaceAllMapped(
      RegExp(r'[A-Z]'), (match) => '_${match.group(0)?.toLowerCase()}');

  String get kebabCase => replaceAll(' ', '-').toLowerCase().replaceAllMapped(
      RegExp(r'[A-Z]'), (match) => '-${match.group(0)?.toLowerCase()}');

  // Text Formatting
  String get removeSpecialCharacters => replaceAll(RegExp(r'[^\w\s]+'), '');

  String get removeExtraSpaces => trim().replaceAll(RegExp(r'\s+'), ' ');

  String truncate(int maxLength, {String suffix = '...'}) =>
      length <= maxLength ? this : '${substring(0, maxLength)}$suffix';

  String padZero(int width) => padLeft(width, '0');

  // Masking and Security
  String maskEmail() {
    if (!isEmail) return this;
    final parts = split('@');
    if (parts.length != 2) return this;
    final username = parts[0];
    final domain = parts[1];
    final maskedUsername = username.length > 2
        ? '${username.substring(0, 2)}${'*' * (username.length - 2)}'
        : username;
    return '$maskedUsername@$domain';
  }

  String maskPhone() {
    if (!isPhone) return this;
    final cleaned = replaceAll(RegExp(r'[^\d]'), '');
    final length = cleaned.length;
    if (length < 4) return this;
    return '${'*' * (length - 4)}${cleaned.substring(length - 4)}';
  }

  String maskCreditCard() {
    final cleaned = replaceAll(RegExp(r'[^\d]'), '');
    if (cleaned.length < 4) return this;
    return '${'*' * (cleaned.length - 4)}${cleaned.substring(cleaned.length - 4)}';
  }

  // Utility Methods
  bool containsIgnoreCase(String other) =>
      toLowerCase().contains(other.toLowerCase());

  bool equalsIgnoreCase(String other) => toLowerCase() == other.toLowerCase();

  bool get isNullOrEmpty => isEmpty;

  bool get isNotNullOrEmpty => isNotEmpty;

  String? get nullIfEmpty => isEmpty ? null : this;

  String get reverse => split('').reversed.join();

  int get wordCount => trim().split(RegExp(r'\s+')).length;

  List<String> get words => trim().split(RegExp(r'\s+'));

  String get initials => isNotEmpty
      ? split(' ')
          .where((word) => word.isNotEmpty)
          .map((word) => word[0].toUpperCase())
          .join()
      : '';
}
