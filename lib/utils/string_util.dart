import 'package:get/get_utils/src/get_utils/get_utils.dart';

extension StringExtensions on String? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  bool get isNotNullOrEmpty {
    return this != null && this!.isNotEmpty;
  }

  String? get transformedUrl {
    if (this == null) return null;
    var url = this!.trim().replaceAll("(", "%28");
    url = url.trim().replaceAll(")", "%29");
    url = url.trim().replaceAll(" ", "%20");
    return url;
  }

  bool get isValidUrl {
    if (this == null) return false;
    var url = this!.transformedUrl!;
    return GetUtils.isURL(url);
  }

  // Modified to use StringBuffer for faster execution
  String? toTitleCase() => isNullOrEmpty ? this : this!.toTitleCase();

  /// If input is JITENDRA SINGH, [return] Jitendra Singh,
  /// If input is JITENDRA SI, [return] Jitendra SI
  String get toNameTitleCase {
    if (this == null) return "";
    var name = this!.trim();

    if (name.isEmpty) return "";
    name = name.replaceAll("\\s{2,}", " ").trim();
    return name.length <= 2
        ? name.toUpperCase()
        : name.split(' ').map(
            (s) {
              s = s.trim();
              if (s.isEmpty) return "";
              if (s.length <= 2) return s;
              return '${s[0].toUpperCase()}${s.substring(1).toLowerCase()}';
            },
          ).join(' ');
  }

  bool get isDigitsOnly {
    if (isNullOrEmpty) return false;
    return RegExp(r'^[0-9]+$').hasMatch(this!);
  }

  int toInt() {
    if (isNullOrEmpty || !isDigitsOnly) return 0;
    return int.parse(this!);
  }

  String get initialChar =>
      isNotNullOrEmpty ? this!.substring(0, 1).toUpperCase() : '';

  String get firstName {
    if (isNotNullOrEmpty) {
      final arr = this!.split(" ");
      if (arr[0].trim().length > 2) {
        return arr[0].trim();
      }
    }
    return this ?? "";
  }

  /// Usage
  /// string is
  /// 'Today is %1s and tomorrow is %2s'
  ///
  String _interpolate(String string, List<String> params) {
    String result = string;
    for (int i = 1; i < params.length + 1; i++) {
      result = result.replaceAll('%${i}s', params[i - 1]);
    }
    return result;
  }

  String format(List<String> params) => _interpolate(this!, params);

  bool contain(String value, {bool ignoreCase = true}) {
    if (!ignoreCase) {
      return this?.contains(value) == true;
    }
    return this?.toLowerCase().contains(value.toLowerCase()) == true;
  }

  static bool isNumericWithColon(String? s) {
    return s == null ? false : RegExp(r'^[0-9:]+$').hasMatch(s);
  }
}
