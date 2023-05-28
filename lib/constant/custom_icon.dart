import 'package:flutter/widgets.dart';

class IconCustom {
  IconCustom._();

  static const _kFontFam = 'Icons';
  static const String? _kFontPkg = null;

  static const IconData user_outline =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData heart_empty =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData menu =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData search =
      IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData cart =
      IconData(0xe82e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

class SearchIcon {
  SearchIcon._();

  static const _kFontFam = 'Icons_search';
  static const String? _kFontPkg = null;

  static const IconData search =
      IconData(0xf3c3, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

class Location {
  Location._();

  static const _kFontFam = 'Icons_locations';
  static const String? _kFontPkg = null;

  static const IconData location =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
