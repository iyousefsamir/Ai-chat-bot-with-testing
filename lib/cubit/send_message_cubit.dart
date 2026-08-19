import 'package:bloc/bloc.dart';

import '../models/chat_message_model.dart';
import '../repositories/send_message_repository.dart';
import 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit({required SendMessageRepository repository})
    : _repository = repository,
      super(SendMessageInitial());

  final SendMessageRepository _repository;

  Future<void> sendMessages(List<ChatMessageModel> messages) async {
    emit(SendMessageLoading());

    try {
      final message = await _repository.sendMessages(messages);
      emit(SendMessageSuccess(message));
    } catch (error) {
      print('ERROR: $error');
      emit(SendMessageFailure(error.toString()));
    }
  }
}
