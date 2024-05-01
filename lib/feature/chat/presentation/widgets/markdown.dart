import 'package:fluent_ui/fluent_ui.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:testform/feature/chat/presentation/widgets/latex.dart';
import 'code_wrapper.dart';

class Markdown extends StatelessWidget {
  final String text;

  const Markdown({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final isDark = FluentTheme.of(context).brightness == Brightness.dark;
    final config =
        isDark ? MarkdownConfig.darkConfig : MarkdownConfig.defaultConfig;
    codeWrapper(child, text, language) => CodeWrapperWidget(
          language,
          child: child,
          text: text,
        );
    return SelectionArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: MarkdownGenerator(
              inlineSyntaxList: [LatexSyntax()],
              generators: [latexGenerator],
            ).buildWidgets(
              text,
              config: config.copy(configs: [
                isDark
                    ? PreConfig.darkConfig.copy(wrapper: codeWrapper)
                    : const PreConfig().copy(wrapper: codeWrapper),
                TableConfig(
                    wrapper: (table) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: table,
                        )),
              ]),
            )),
      ),
    );
  }
}
