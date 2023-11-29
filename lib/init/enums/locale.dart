import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum LocaleEnums {
  en(Locale('en','US')),
  tr(Locale('tr','TR')),
  ru(Locale('ru','RU'));

  final Locale _item;
  const LocaleEnums(Locale item) : _item = item;

  void updateLanguage (BuildContext context) {
    context.setLocale(_item);
  }
}