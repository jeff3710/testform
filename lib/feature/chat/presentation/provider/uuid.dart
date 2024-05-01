import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'uuid.g.dart';

@Riverpod(keepAlive: true)
class Conversationuuid extends _$Conversationuuid {
  @override
  String build() {
    return '';
  }

  void setCurrentConversationUuid(String uuid) {
    state = uuid;
  }
}
