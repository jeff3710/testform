import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:testform/feature/tests/presentation/widgets/my_card.dart';
import 'package:testform/feature/tests/presentation/widgets/my_widget.dart';

import '../../feature/tests/presentation/widgets/page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with PageMixin {
  bool selected = true;
  String? comboboxValue;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasFluentTheme(context));
    final theme = FluentTheme.of(context);

    return ScaffoldPage.scrollable(
      header: const PageHeader(
        title: Text('Fluent UI for Flutter Showcase App'),
        commandBar: SizedBox(),
      ),
      children: [
        Card(
          child:
              Wrap(alignment: WrapAlignment.center, spacing: 10.0, children: [
            InfoLabel(
              label: 'Inputs',
              child: ToggleSwitch(
                checked: selected,
                onChanged: (v) => setState(() => selected = v),
              ),
            ),
            SizedBox(
              width: 80,
              child: InfoLabel(
                label: 'test route',
                child: FilledButton(
                  child: const Text('Jump'),
                  onPressed: () {
                    context.go('/settings');
                  },
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: InfoLabel(
                label: 'Forms',
                child: ComboBox<String>(
                  value: comboboxValue,
                  items: ['Item 1', 'Item 2']
                      .map((e) => ComboBoxItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  isExpanded: true,
                  onChanged: (v) => setState(() => comboboxValue = v),
                ),
              ),
            ),
            RepaintBoundary(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 4.0),
                child: InfoLabel(
                  label: 'Progress',
                  child: const SizedBox(
                    height: 30,
                    width: 30,
                    child: ProgressRing(),
                  ),
                ),
              ),
            ),
            InfoLabel(
              label: 'Surfaces & Materials',
              child: SizedBox(
                height: 40,
                width: 120,
                child: Stack(children: [
                  Container(
                    width: 120,
                    height: 50,
                    color: theme.accentColor.lightest,
                  ),
                  const Positioned.fill(child: Acrylic(luminosityAlpha: 0.5)),
                ]),
              ),
            ),
            InfoLabel(
              label: 'Icons',
              child: const Icon(FluentIcons.graph_symbol, size: 30.0),
            ),
            InfoLabel(
              label: 'Colors',
              child: SizedBox(
                width: 40,
                height: 30,
                child: Wrap(
                  children: <Color>[
                    ...Colors.accentColors,
                    Colors.successPrimaryColor,
                    Colors.warningPrimaryColor,
                    Colors.errorPrimaryColor,
                    Colors.grey,
                  ].map((color) {
                    return Container(
                      height: 10,
                      width: 10,
                      color: color,
                    );
                  }).toList(),
                ),
              ),
            ),
            InfoLabel(
              label: 'Typography',
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    colors: [
                      Colors.white,
                      ...Colors.accentColors,
                    ],
                  ).createShader(rect);
                },
                blendMode: BlendMode.srcATop,
                child: const Text(
                  'ABCDEFGH',
                  style: TextStyle(fontSize: 24, shadows: [
                    Shadow(offset: Offset(1, 1)),
                  ]),
                ),
              ),
            ),
          ]),
        ),
        const SizedBox(height: 22.0),
        Wrap(children: [
          MyCard(theme: theme),
          MyCard(theme: theme),
          MyCard(theme: theme),
          MyCard(theme: theme),
          MyCard(theme: theme),
        ]),
        const MyWidget(),
        const SizedBox(height: 22.0),
        Row(children: [
          Text('SPONSORS', style: theme.typography.bodyStrong),
          const SizedBox(width: 4.0),
          const Icon(FluentIcons.heart_fill, size: 16.0),
        ]),
        const SizedBox(height: 4.0)
      ],
    );
  }
}

class SponsorButton extends StatelessWidget {
  const SponsorButton({
    super.key,
    required this.imageUrl,
    required this.username,
  });

  final String imageUrl;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
          ),
          shape: BoxShape.circle,
        ),
      ),
      Text(username),
    ]);
  }
}
