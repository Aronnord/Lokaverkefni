import 'room_description.dart';
import 'User interface.dart';
import 'dart:io';
import 'movement.dart';

void main() {
  //get the desription for the room.
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
      bool movementCommandFound = executeMovementCommand(userInput);
      if (!movementCommandFound) {
        print('Invalid command. Please try again.');
      }
    }
  }
}
