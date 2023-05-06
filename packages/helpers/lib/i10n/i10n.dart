import 'package:flutter/widgets.dart';
import 'package:i18next/i18next.dart';

class L10n {
  late I18NextLocalizationDelegate delegate;
  late List<Locale> _locales;

  L10n({
    required List<Locale> locales,
    required bundlePath,
  }) {
    _locales = locales;
    delegate = I18NextLocalizationDelegate(
      locales: locales,
      dataSource: AssetBundleLocalizationDataSource(
        bundlePath: bundlePath,
      ),
      options: I18NextOptions(formats: formatters()),
    );
  }

  get locales => _locales;
  get defaultLocale => _locales.first;

  Map<String, ValueFormatter> formatters() => {
        'uppercase': (value, format, locale, options) =>
            value?.toString().toUpperCase(),
        'lowercase': (value, format, locale, options) =>
            value?.toString().toLowerCase(),
      };
}

extension BuildContextExt on BuildContext {
  String t(
    String key, {
    Locale? locale,
    String? context,
    int? count,
    Map<String, dynamic>? variables,
    I18NextOptions? options,
    String Function(String)? orElse,
  }) =>
      I18Next.of(this)!.t(
        key,
        locale: locale,
        context: context,
        count: count,
        variables: variables,
        options: options,
        orElse: orElse,
      );
}
