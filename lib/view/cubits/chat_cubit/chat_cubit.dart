import 'package:bloc/bloc.dart';
import 'package:chitchat/model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  List<MessageModel> messagesList = [];

  void sendMessage({required String message, required String email}) {
    try {
      messages.add(
          {'messages': message, 'created at:': DateTime.now(), 'id': email});
    } catch (e) {
      print(e);
    }
  }

  void getMessage() {
    messages
        .orderBy('created at:', descending: true)
        .snapshots()
        .listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(MessageModel.fromJson(doc));
      }
      emit(ChatSuccess(messages: messagesList));
    });
  }
}
