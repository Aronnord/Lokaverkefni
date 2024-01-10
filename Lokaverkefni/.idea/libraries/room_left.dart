import 'dart:io';
import 'movement.dart';
import 'inventory.dart';
import 'room_left_description.dart';

bool hasKey = false;

void enterLeftRoom() {
  //Get the description for this room.
  print(getLeftRoomDescription());

  print('There is atable in the room with a key on it.');

  bool atTable = false;

  while (!hasKey) {
    if(!atTable) {
      print('You are in a room.');
      print('Where would you like to go?');
      print('1. Go to the table');
      print('2. Go back.');

      String userInput = stdin.readLineSync()?.trim() ?? '';

      switch (userInput) {
        case '1':
          atTable = true;
          break;
        case '2':
          print('You return to the room.');
          return;
        default:
          print('Invalid input. Choose a valid option');
          break;
      }
    } else {
      print('You are at the table.');
      print('Whag would you like to do?');
      print('1. Pick up the key');
      print('2. Leave the table');

      String userInput = stdin.readLineSync()?.trim() ?? '';

      switch (userInput) {
        case '1':
          pickUpKey();
          break;
        case '2':
          atTable = false;
          break;
        default:
          print('Invalid input. Choose a vilid option.');
          break;
      }
    }
  }
}

void pickUpKey() {
  print('You picked up the key.');
  addToInventory('Key');
  hasKey = true;
}

void handleRoomLeft() {
  stdout.write('Do you want to enter the room? (yes/no)');
  String answer = stdin.readLineSync()?.toLowerCase() ?? '';

  if (answer == 'yes') {
    enterLeftRoom();
  } else if (answer == 'no') {
    print('You choose not to ebter the room.');
  } else {
    print('Invalid input.');
  }
}