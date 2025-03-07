abstract class ChatStates {}

class ChatInitialState extends ChatStates {}

class GetUsersLoadingState extends ChatStates {}

class GetUsersSuccessState extends ChatStates {
  GetUsersSuccessState();
}

class GetUsersErrorState extends ChatStates {
  final String errorMessage;
  GetUsersErrorState(this.errorMessage);
}

class SendMessageSuccessState extends ChatStates {}

class SendMessageErrorState extends ChatStates {}

class RecieveMessageSuccessState extends ChatStates {}

class RecieveMessageErrorState extends ChatStates {}

class GetMessagesSuccessState extends ChatStates {}
class SignOutLoadingState extends ChatStates {}
class SignOutSuccessState extends ChatStates {}
class SignOutErrorState extends ChatStates {}
