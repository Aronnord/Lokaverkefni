import 'room_description.dart';
import 'User interface.dart';
import 'dart:io';

void main() {

  String roomDescription = getRoomDescription();
  print(roomDescription);

  while (true) {
    String userInput = getPlayerInput();
    bool commandFound = executeCommand(userInput);

    if (!commandFound) {
      continue;
    }
  }
}
