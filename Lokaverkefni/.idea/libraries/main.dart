import 'room_description.dart';
import 'User interface.dart';
import 'dart:io';


void main() {
  String roomDescription = getRoomDescription();
  print(roomDescription);

  while (true) {
    String userInput = getPlayerInput();

    if (userInput.toLowerCase() == 'exit') {
      print('Exiting the game...');
      break;
    }

    bool commandFound = executeCommand(userInput);

    if (!commandFound) {
      print('Invalid command. Please try again.');
    }
  }
}
