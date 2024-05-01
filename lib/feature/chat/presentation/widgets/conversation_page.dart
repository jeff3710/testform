import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:testform/feature/chat/presentation/provider/conversation.dart';
import 'package:testform/feature/chat/presentation/provider/message.dart';
import 'package:testform/feature/chat/presentation/provider/uuid.dart';

import '../../data/repositories/conversation.dart';

class ConversationPage extends ConsumerWidget {
  const ConversationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(conversationControllerProvider);
    return Container(
      decoration: BoxDecoration(
          color: FluentTheme.of(context).micaBackgroundColor,
          border: const Border(right: BorderSide(width: .1))),
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          asyncValue.when(
            data: (value) {
              return value == null
                  ? const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'No conversation tips',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile.selectable(
                              onPressed: () {
                                ref
                                    .read(messageControllerProvider.notifier)
                                    .loadAllMessages(value[index].uuid);
                                context.go('/test/test3');
                              },
                              selected: ref.read(conversationuuidProvider) ==
                                  value[index].uuid,
                              leading: Icon(
                                FluentIcons.chat,
                                color: FluentTheme.of(context).accentColor,
                              ),
                              title: Text(
                                value[index].name,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  // color: FluentTheme.of(context).accentColor,
                                ),
                              ),
                              trailing: Builder(builder: (context) {
                                return Row(
                                  children: [
                                    IconButton(
                                        icon: Icon(
                                          FluentIcons.delete,
                                          color: FluentTheme.of(context)
                                              .accentColor,
                                        ),
                                        onPressed: () {
                                          ref
                                              .read(
                                                  conversationControllerProvider
                                                      .notifier)
                                              .deleteConversation(index);
                                        }),
                                    const SizedBox(width: 15),
                                    IconButton(
                                        icon: Icon(
                                          FluentIcons.edit,
                                          color: FluentTheme.of(context)
                                              .accentColor,
                                        ),
                                        onPressed: () {
                                          _renameConversation(
                                              context, index, value, ref);
                                        }),
                                  ],
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const Center(child: ProgressBar()),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  void _renameConversation(BuildContext context, int index,
      List<Conversation> value, WidgetRef ref) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          final TextEditingController controller = TextEditingController();
          controller.text = value[index].name;
          return ContentDialog(
            title: const Text('rename conversation'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormBox(
                  controller: controller,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  placeholder: 'enter new name',
                  autovalidateMode: AutovalidateMode.always,
                  maxLines: null,
                )
              ],
            ),
            actions: [
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              FilledButton(
                child: const Text('OK'),
                onPressed: () {
                  ref
                      .read(conversationControllerProvider.notifier)
                      .renameConversation(Conversation(
                          name: controller.text,
                          description: '',
                          uuid: value[index].uuid));
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
