import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

class MyCard extends StatelessWidget {
  final FluentThemeData theme;
  const MyCard({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 160,
        width: 200,
        child: GestureDetector(
          onTap: () {
            context.go('/settings');
          },
          child: Card(
            borderRadius: BorderRadius.circular(16.0),
            // backgroundColor: theme.cardColor.withOpacity(0.1),
            child: const Text(
              'data',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
