import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../widgets/chat_page.dart';
import '../widgets/conversation_page.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Row(
      children: [
        ConversationPage(),
        // Expanded(child: ChatPage()),
      ],
    );
  }
}
