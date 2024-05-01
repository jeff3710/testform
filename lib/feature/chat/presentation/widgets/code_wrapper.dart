import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeWrapperWidget extends ConsumerStatefulWidget {
  final Widget child;
  final String text;
  final String language;
  const CodeWrapperWidget(this.language,
      {required this.child, required this.text, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CodeWrapperWidgetState();
}

class _CodeWrapperWidgetState extends ConsumerState<CodeWrapperWidget> {
  late Widget _switchWidget;
  bool hasCopied = false;
  @override
  void initState() {
    super.initState();
    _switchWidget = Icon(FluentIcons.copy, key: UniqueKey());
  }

  @override
  Widget build(BuildContext context) {
    final isDark = FluentTheme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        widget.child,
        Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.language.isNotEmpty)
                  SelectionContainer.disabled(
                      child: Container(
                    margin: const EdgeInsets.only(right: 2),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            width: 0.5,
                            color: isDark ? Colors.white : Colors.black)),
                    child: Text(widget.language),
                  )),
                GestureDetector(
                  child: Card(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: _switchWidget,
                    ),
                  ),
                  onTap: () async {
                    if (hasCopied) return;
                    await Clipboard.setData(ClipboardData(text: widget.text));
                    _switchWidget = Icon(FluentIcons.accept_medium,
                        key: UniqueKey(), color: Colors.green);
                    refresh();
                    Future.delayed(const Duration(seconds: 2), () {
                      hasCopied = false;
                      _switchWidget = Icon(FluentIcons.copy, key: UniqueKey());
                      refresh();
                    });
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void refresh() {
    if (mounted) setState(() {});
  }
}
