extension StringExtension on String {
  String get obscureEmail {
    final parts = split('@');

    final username = parts[0];
    final domain = parts[1];
    final obscuredUsername = username.length > 2
        ? '${username[0]}*****${username.substring(username.length - 3)}'
        : '*****';
    return '$obscuredUsername@$domain';
  }
}