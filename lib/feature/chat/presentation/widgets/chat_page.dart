import 'package:fluent_ui/fluent_ui.dart';
import 'package:testform/feature/chat/data/repositories/conversation.dart';
import 'package:testform/feature/chat/presentation/provider/conversation.dart';
import 'package:testform/feature/chat/presentation/provider/message.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/uuid.dart';
import 'markdown.dart';

var uuid = const Uuid();

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(messageControllerProvider);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
              child: Center(
            child: asyncValue.when(
                data: (value) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _scrollToNewMessage();
                  });
                  return ListView.builder(
                      controller: _scrollController,
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return _buildMessageCard(value[index]);
                      });
                },
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const ProgressBar()),
          )),
          const SizedBox(height: 16),
          Form(
            key: _formKey,
            child: KeyboardListener(
                focusNode: FocusNode(),
                // onKeyEvent: _handleKeyEvent,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormBox(
                        style: const TextStyle(fontSize: 13),
                        controller: _controller,
                        keyboardType: TextInputType.multiline,
                        autovalidateMode: AutovalidateMode.always,
                        textInputAction: TextInputAction.done,
                        maxLines: null,
                        onFieldSubmitted: (_) {
                          _sendMessage();
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                      height: 48,
                      child: FilledButton(
                          child: const Text('Send'),
                          onPressed: () {
                            _sendMessage();
                          }),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }

  Conversation _newConversation(String name, String description) {
    var conversation = Conversation(
      uuid: uuid.v4(),
      name: name,
      description: description,
    );
    return conversation;
  }

  void _sendMessage() {
    final message = _controller.text.trim();
    // final messageList = ref.read(messageControllerProvider.notifier).addMessage(message);

    if (message.isNotEmpty) {
      var conversationUuid = ref.read(conversationuuidProvider);
      if (conversationUuid.isEmpty) {
        var conversation = _newConversation(
            message.substring(0, message.length > 20 ? 20 : message.length),
            message);
        conversationUuid = conversation.uuid;
        ref
            .read(conversationuuidProvider.notifier)
            .setCurrentConversationUuid(conversationUuid);
        ref
            .read(conversationControllerProvider.notifier)
            .addConversation(conversation);
      }
      final newMessage = Message(
          conversationId: conversationUuid, role: Role.user, text: message);
      ref.read(messageControllerProvider.notifier).addMessage(newMessage);
      _formKey.currentState!.reset();
    }
  }

  Widget _buildMessageCard(Message message) {
    if (message.role == Role.user) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(FluentIcons.people),
              SizedBox(
                width: 5,
              ),
              Text('User'),
              SizedBox(
                width: 10,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                  child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SelectableText(message.text),
                  ),
                ),
              ))
            ],
          )
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(FluentIcons.robot),
              const SizedBox(
                width: 5,
              ),
              Text(message.role == Role.system ? 'System' : 'Assistant'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Card(
                margin: const EdgeInsets.all(8),
                child: Markdown(text: message.text),
              ))
            ],
          )
        ],
      );
    }
  }

  // void _handleKeyEvent(KeyEvent value) {
  //   if (value.logicalKey == LogicalKeyboardKey.enter &&
  //       value.logicalKey != LogicalKeyboardKey.control &&
  //       value.logicalKey != LogicalKeyboardKey.shift) {
  //     _sendMessage();
  //   }
  // }

  void _scrollToNewMessage() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}
