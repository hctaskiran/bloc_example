import 'package:bloc_pattern_flutter_ornek/init/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

List contactIcons = [
  const Icon(Icons.person),
  const Icon(Icons.phone),
  const Icon(Icons.chevron_right),
  const Icon(Icons.add),
  Icon(
    Icons.account_circle_sharp,
    size: 150,
    color: ColorConst().amber,
  ),
];

List appBarIcons = [
  Icon(Icons.language_rounded, color: ColorConst().white),
];

class ColorConst {
  final amber = Colors.amber;
  final white = Colors.white;
  final black = Colors.black;
  final blue = Colors.blue;
  final green700 = Colors.green[700];
  final red800 = Colors.red[800];
}

class Translations {
  final contacts = LocaleKeys.contacts_contactsTitle.tr();
  final addContact = LocaleKeys.contacts_addContact.tr();
  final inputName = LocaleKeys.inputs_enterName.tr();
  final inputPhone = LocaleKeys.inputs_enterPhone.tr();
  final name = LocaleKeys.details_name.tr();
  final phone = LocaleKeys.details_phone.tr();
  final detail = LocaleKeys.details_detailsTitle.tr();
  final containLetter = LocaleKeys.errors_nameError.tr();
  final containNumber = LocaleKeys.errors_phoneError.tr();
  final failed = LocaleKeys.errors_failed.tr();
  final success = LocaleKeys.errors_success.tr();
}

class PaddingConst {
  final all5 = const EdgeInsets.all(5);
  final right10 = const EdgeInsets.only(right: 10);
}

class DurationConst {
  final sec1 = const Duration(seconds: 1);
  final ms120 = const Duration(milliseconds: 120);
}
