import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/conversation.dart';
import '../../data/repositories/message.dart';

part 'message.g.dart';

@Riverpod(keepAlive: true)
class MessageController extends _$MessageController {
  @override
  FutureOr<List<Message>> build() async {
    return [];
  }

  Future<void> loadAllMessages(String conversationUUid) async {
    state = AsyncData(await ref
        .read(conversationRepositoryProvider)
        .getMessagesByConversationUUid(conversationUUid));
  }

  Future<void> addMessage(Message message) async {
    await ConversationRepository().addMessage(message);
    final messages = await ConversationRepository()
        .getMessagesByConversationUUid(message.conversationId);
    state = AsyncData(messages);
    final completer = Completer();
    try {
      MessageRepository().postMessage(message, (Message message) {
        state = AsyncData([...messages, message]);
      }, (Message message) {
        state = AsyncData([...messages, message]);
      }, (Message message) async {
        ConversationRepository().addMessage(message);
        final messages = await ConversationRepository()
            .getMessagesByConversationUUid(message.conversationId);
        state = AsyncData(messages);
        completer.complete();
      });
    } catch (e) {
      state = AsyncValue.error([
        ...messages,
        Message(
            conversationId: message.conversationId,
            text: e.toString(),
            role: Role.assistant)
      ], StackTrace.current);
      completer.complete();
    }
    await completer.future;
  }
}
