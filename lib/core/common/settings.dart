// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';
import '../../feature/tests/presentation/widgets/page.dart';

const List<String> accentColorNames = [
  'System',
  'Yellow',
  'Orange',
  'Red',
  'Magenta',
  'Purple',
  'Blue',
  'Teal',
  'Green',
];

bool get kIsWindowEffectsSupported {
  return !kIsWeb &&
      [
        TargetPlatform.windows,
        TargetPlatform.linux,
        TargetPlatform.macOS,
      ].contains(defaultTargetPlatform);
}

const _LinuxWindowEffects = [
  WindowEffect.disabled,
  WindowEffect.transparent,
];

const _WindowsWindowEffects = [
  WindowEffect.disabled,
  WindowEffect.solid,
  WindowEffect.transparent,
  WindowEffect.aero,
  WindowEffect.acrylic,
  WindowEffect.mica,
  WindowEffect.tabbed,
];

const _MacosWindowEffects = [
  WindowEffect.disabled,
  WindowEffect.titlebar,
  WindowEffect.selection,
  WindowEffect.menu,
  WindowEffect.popover,
  WindowEffect.sidebar,
  WindowEffect.headerView,
  WindowEffect.sheet,
  WindowEffect.windowBackground,
  WindowEffect.hudWindow,
  WindowEffect.fullScreenUI,
  WindowEffect.toolTip,
  WindowEffect.contentBackground,
  WindowEffect.underWindowBackground,
  WindowEffect.underPageBackground,
];

List<WindowEffect> get currentWindowEffects {
  if (kIsWeb) return [];

  if (defaultTargetPlatform == TargetPlatform.windows) {
    return _WindowsWindowEffects;
  } else if (defaultTargetPlatform == TargetPlatform.linux) {
    return _LinuxWindowEffects;
  } else if (defaultTargetPlatform == TargetPlatform.macOS) {
    return _MacosWindowEffects;
  }

  return [];
}

final _box = Hive.box('settings');

class Settings extends StatefulWidget {
  const Settings({super.key, this.controller});
  final ScrollController? controller;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with PageMixin {
  String _currentModel = 'gpt-3.5-turbo';
  bool _useWebSearch = false;
  bool _useStream = true;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    final appTheme = context.watch<AppTheme>();
    FluentTheme.of(context);
    const spacer = SizedBox(height: 10.0);
    const biggerSpacer = SizedBox(height: 40.0);
    final apiController = TextEditingController();
    // modify some settings

    const supportedLocales = FluentLocalizations.supportedLocales;
    final currentLocale =
        appTheme.locale ?? Localizations.maybeLocaleOf(context);
    return ScaffoldPage.scrollable(
      header: const PageHeader(title: Text('Settings')),
      children: [
        Text('Theme mode', style: FluentTheme.of(context).typography.subtitle),
        spacer,
        ...List.generate(ThemeMode.values.length, (index) {
          final mode = ThemeMode.values[index];
          return Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 8.0),
            child: RadioButton(
              checked: appTheme.mode == mode,
              onChanged: (value) {
                if (value) {
                  appTheme.mode = mode;

                  if (kIsWindowEffectsSupported) {
                    // some window effects require on [dark] to look good.
                    // appTheme.setEffect(WindowEffect.disabled, context);
                    appTheme.setEffect(appTheme.windowEffect, context);
                  }
                }
              },
              content: Text('$mode'.replaceAll('ThemeMode.', '')),
            ),
          );
        }),
        biggerSpacer,
        Text('ChatGPT Model',
            style: FluentTheme.of(context).typography.subtitle),
        spacer,
        Row(children: [
          ComboBox<String>(
            value: _currentModel,
            items: [
              'gpt-4-32k-0314',
              'gpt-4-32k',
              'gpt-3.5-turbo',
              'gpt-4',
              'gpt-4-turbo-preview'
            ].map((e) {
              return ComboBoxItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: (model) => setState(() {
              _currentModel = model!;
              _box.put('gptModel', _currentModel);
            }),
          ),
        ]),
        biggerSpacer,
        Text('Search Engine',
            style: FluentTheme.of(context).typography.subtitle),
        spacer,
        Row(children: [
          ToggleSwitch(
              checked: _useWebSearch,
              onChanged: (v) => setState(() {
                    _useWebSearch = v;
                    _box.put('useWebSearch', _useWebSearch);
                  })),
        ]),
        biggerSpacer,
        Text('Use Stream', style: FluentTheme.of(context).typography.subtitle),
        spacer,
        Row(children: [
          ToggleSwitch(
            checked: _useStream,
            onChanged: (v) => setState(() {
              _useStream = v;
              _box.put('useStream', _useStream);
            }),
          ),
        ]),
        biggerSpacer,
        Text('Api-Key', style: FluentTheme.of(context).typography.subtitle),
        spacer,
        Row(
          children: [
            SizedBox(
              width: 200,
              child: TextBox(
                controller: apiController,
                placeholder: 'Api-Key',
                style: FluentTheme.of(context).typography.body,
              ),
            ),
            FilledButton(
                child: const Text('Submit'),
                onPressed: () {
                  _box.put('apiKey', apiController.text);
                })
          ],
        ),
        biggerSpacer,
        Text(
          'Navigation Pane Display Mode',
          style: FluentTheme.of(context).typography.subtitle,
        ),
        spacer,
        ...List.generate(PaneDisplayMode.values.length, (index) {
          final mode = PaneDisplayMode.values[index];
          return Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 8.0),
            child: RadioButton(
              checked: appTheme.displayMode == mode,
              onChanged: (value) {
                if (value) appTheme.displayMode = mode;
              },
              content: Text(
                mode.toString().replaceAll('PaneDisplayMode.', ''),
              ),
            ),
          );
        }),
        biggerSpacer,
        Text('Navigation Indicator',
            style: FluentTheme.of(context).typography.subtitle),
        spacer,
        ...List.generate(NavigationIndicators.values.length, (index) {
          final mode = NavigationIndicators.values[index];
          return Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 8.0),
            child: RadioButton(
              checked: appTheme.indicator == mode,
              onChanged: (value) {
                if (value) appTheme.indicator = mode;
              },
              content: Text(
                mode.toString().replaceAll('NavigationIndicators.', ''),
              ),
            ),
          );
        }),
        biggerSpacer,
        Text('Accent Color',
            style: FluentTheme.of(context).typography.subtitle),
        spacer,
        Wrap(children: [
          Tooltip(
            message: accentColorNames[0],
            child: _buildColorBlock(appTheme, systemAccentColor),
          ),
          ...List.generate(Colors.accentColors.length, (index) {
            final color = Colors.accentColors[index];
            return Tooltip(
              message: accentColorNames[index + 1],
              child: _buildColorBlock(appTheme, color),
            );
          }),
        ]),
        if (kIsWindowEffectsSupported) ...[
          biggerSpacer,
          Text(
            'Window Transparency (${defaultTargetPlatform.toString().replaceAll('TargetPlatform.', '')})',
            style: FluentTheme.of(context).typography.subtitle,
          ),
          spacer,
          ...List.generate(currentWindowEffects.length, (index) {
            final mode = currentWindowEffects[index];
            return Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 8.0),
              child: RadioButton(
                checked: appTheme.windowEffect == mode,
                onChanged: (value) {
                  if (value) {
                    appTheme.windowEffect = mode;
                    appTheme.setEffect(mode, context);
                    // debugPrint('mode is $mode');
                    // debugPrint('window effect is ${appTheme.windowEffect}');
                  }
                },
                content: Text(
                  mode.toString().replaceAll('WindowEffect.', ''),
                ),
              ),
            );
          }),
        ],
        biggerSpacer,
        Text('Text Direction',
            style: FluentTheme.of(context).typography.subtitle),
        spacer,
        ...List.generate(TextDirection.values.length, (index) {
          final direction = TextDirection.values[index];
          return Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 8.0),
            child: RadioButton(
              checked: appTheme.textDirection == direction,
              onChanged: (value) {
                if (value) {
                  appTheme.textDirection = direction;
                }
              },
              content: Text(
                '$direction'
                    .replaceAll('TextDirection.', '')
                    .replaceAll('rtl', 'Right to left')
                    .replaceAll('ltr', 'Left to right'),
              ),
            ),
          );
        }).reversed,
        Text('Locale', style: FluentTheme.of(context).typography.subtitle),
        spacer,
        Wrap(
          spacing: 15.0,
          runSpacing: 10.0,
          children: List.generate(
            supportedLocales.length,
            (index) {
              final locale = supportedLocales[index];

              return Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 8.0),
                child: RadioButton(
                  checked: currentLocale == locale,
                  onChanged: (value) {
                    if (value) {
                      appTheme.locale = locale;
                    }
                  },
                  content: Text('$locale'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildColorBlock(AppTheme appTheme, AccentColor color) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Button(
        onPressed: () {
          appTheme.color = color;
        },
        style: ButtonStyle(
          padding: ButtonState.all(EdgeInsets.zero),
          backgroundColor: ButtonState.resolveWith((states) {
            if (states.isPressing) {
              return color.light;
            } else if (states.isHovering) {
              return color.lighter;
            }
            return color;
          }),
        ),
        child: Container(
          height: 40,
          width: 40,
          alignment: AlignmentDirectional.center,
          child: appTheme.color == color
              ? Icon(
                  FluentIcons.check_mark,
                  color: color.basedOnLuminance(),
                  size: 22.0,
                )
              : null,
        ),
      ),
    );
  }
}
