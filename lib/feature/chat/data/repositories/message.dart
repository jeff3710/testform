import 'package:dart_openai/dart_openai.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:hive/hive.dart';

import '../if.dart';
import '../llm.dart';
import 'conversation.dart';

class MessageRepository {
  final box = Hive.box('settings');
  static final MessageRepository _instance = MessageRepository._internal();
  factory MessageRepository() {
    return _instance;
  }
  MessageRepository._internal() {
    init();
  }
  void postMessage(Message message, ValueChanged<Message> onResponse,
      ValueChanged<Message> onError, ValueChanged<Message> onSuccess) async {
    List<Message> messages = await ConversationRepository()
        .getMessagesByConversationUUid(message.conversationId);
    _getResponseFromGpt(messages, onResponse, onError, onSuccess);
  }

  void init() {
    OpenAI.apiKey = box.get('apiKey', defaultValue: 'sk-xx');
    OpenAI.baseUrl = box.get('openAiBaseUrl',
        defaultValue: 'https://api.chatanywhere.tech/');
  }

  void _getResponseFromGpt(
      List<Message> messages,
      ValueChanged<Message> onResponse,
      ValueChanged<Message> errorCallback,
      ValueChanged<Message> onSuccess) async {
    String llm = box.get('llm', defaultValue: 'openai');

    switch (llm.toUpperCase()) {
      case "OPENAI":
        ChatGpt().getResponse(messages, onResponse, errorCallback, onSuccess);
        break;
      // case "YOU":
      //   YouAi().getResponse(messages, onResponse, errorCallback, onSuccess);
      //   break;
      case "IF":
        ChatIF().getResponse(messages, onResponse, errorCallback, onSuccess);
        break;
      default:
        ChatGpt().getResponse(messages, onResponse, errorCallback, onSuccess);
    }
  }

  deleteMessage(int messageId) {
    ConversationRepository().deleteMessage(messageId);
  }
}
