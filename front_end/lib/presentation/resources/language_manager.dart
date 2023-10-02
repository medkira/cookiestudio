// ignore_for_file: constant_identifier_names

enum LanguageType { ENGLISH, ARABIC }

const String ARABIC = "ar";
const String ENGLISH = "en";

extension LanguageTypeExtention on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ARABIC;
      case LanguageType.ARABIC:
        return ARABIC;
    }
  }
}
