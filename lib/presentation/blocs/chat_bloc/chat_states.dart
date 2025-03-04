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
