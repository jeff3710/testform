import 'package:dart_openai/dart_openai.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:hive/hive.dart';

import '../../../core/utils/bing_search.dart';
import 'repositories/conversation.dart';

abstract class LLM {
  getResponse(List<Message> messages, ValueChanged<Message> onResponse,
      ValueChanged<Message> errorCallback, ValueChanged<Message> onSuccess);
}

class ChatGpt extends LLM {
  final _box = Hive.box('settings');

  @override
  getResponse(
      List<Message> messages,
      ValueChanged<Message> onResponse,
      ValueChanged<Message> errorCallback,
      ValueChanged<Message> onSuccess) async {
    List<OpenAIChatCompletionChoiceMessageModel> openAIMessages = [];

    messages = messages.reversed.toList();
    String content = '';
    String currentModel = _box.get('gptModel', defaultValue: 'gpt-3.5-turbo');
    int maxTokenLength = 1800;
    switch (currentModel) {
      case 'gpt-3.5-turbo':
        maxTokenLength = 4096;
        break;
      case 'gpt-4':
        maxTokenLength = 8192;
        break;
      case 'gpt-4-32k':
        maxTokenLength = 32768;
        break;
      case 'gpt-4-32k-0314':
        maxTokenLength = 32768;
        break;
    }
    final bool useWebSearch = _box.get('useWebSearch', defaultValue: false);
    if (useWebSearch) {
      messages.first.text = await fetchAndParse(messages.first.text);
    }
    for (Message message in messages) {
      content = content + message.text;
      if (content.length < maxTokenLength || openAIMessages.isEmpty) {
        openAIMessages.insert(
          0,
          OpenAIChatCompletionChoiceMessageModel(
            role: message.role.asOpenAIChatMessageRole,
            content: [
              OpenAIChatCompletionChoiceMessageContentItemModel.text(
                  message.text)
            ],
          ),
        );
      }
    }
    var message = Message(
        conversationId: messages.first.conversationId,
        text: '',
        role: Role.assistant);
    final bool useStream = _box.get('useStream', defaultValue: true);
    if (useStream) {
      Stream<OpenAIStreamChatCompletionModel> chatStream = OpenAI.instance.chat
          .createStream(model: currentModel, messages: openAIMessages);
      chatStream.listen((chatStreamEvent) async {
        if (chatStreamEvent.choices.first.delta.content?.first?.text != null) {
          message.text = message.text +
              chatStreamEvent.choices.first.delta.content!.first!.text!;
          onResponse(message);
        }
      }, onError: (error) {
        message.text = error.message;
        errorCallback(message);
      }, onDone: () {
        onSuccess(message);
      });
    } else {
      try {
        var response = await OpenAI.instance.chat
            .create(model: currentModel, messages: openAIMessages);
        message.text = response.choices.first.message.content.toString();
        onSuccess(message);
      } catch (e) {
        message.text = e.toString();
        errorCallback(message);
      }
    }
  }
}
