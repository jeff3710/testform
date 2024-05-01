import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/conversation.dart';

part 'conversation.g.dart';

@riverpod
class ConversationController extends _$ConversationController {
  @override
  FutureOr<List<Conversation>?> build() async {
    state = AsyncData(await ConversationRepository().getConversations());
    return state.value;
  }

  // var currentConversationUuid = '';
  // void setCurrentConversationUuid(String uuid) async {
  //   currentConversationUuid = uuid;
  // }

  void deleteConversation(int index) async {
    Conversation conversation = state.value![index];
    await ConversationRepository().deleteConversation(conversation.uuid);
    state = AsyncData(await ConversationRepository().getConversations());
  }

  void renameConversation(Conversation conversation) async {
    await ConversationRepository().updateConversation(conversation);
    state = AsyncData(await ConversationRepository().getConversations());
  }

  void addConversation(Conversation conversation) async {
    await ConversationRepository().addConversation(conversation);
    state = AsyncData(await ConversationRepository().getConversations());
  }
}
