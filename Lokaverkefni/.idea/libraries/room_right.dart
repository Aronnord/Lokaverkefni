import 'dart:io';
import 'movement.dart';
import 'room_right_description.dart';

bool trapSolved = false; // Initially, the trap is unsolved
String code = '1234'; // The code to solve the puzzle
bool noteRead = false; // Track if the note has been read

void enterRightRoom() {
  print(getRightRoomDescription());

  // Lock the door behind you
  doorLockedRight = true;

  print('The door behind you locks automatically.');
  print('There is a mechanism in the room. You need to solve it to escape.');
  print('You see a table with a note and a mechanism with buttons and a display.');

  bool atTable = false;

  // Room puzzle
  while (!trapSolved) {
    if (!atTable) {
      print('You are in the room.');
      print('Where would you like to go?');
      print('1. Go to the table');
      print('2. Go back to the room');

      String userInput = stdin.readLineSync()?.trim() ?? '';

      switch (userInput) {
        case '1':
          atTable = true;
          break;
        case '2':
          print('You return to the room.');
          return;
        default:
          print('Invalid input. Choose a valid option.');
          break;
      }
    } else {
      print('You are at the table.');
      print('What would you like to do?');
      print('1. Examine the note');
      print('2. Try to solve the puzzle');
      print('3. Leave the table');

      String userInput = stdin.readLineSync()?.trim() ?? '';

      switch (userInput) {
        case '1':
          if (!noteRead) {
            readNote();
          } else {
            print('There is nothing else of interest on the table.');
          }
          break;
        case '2':
          solvePuzzle();
          break;
        case '3':
          atTable = false;
          break;
        default:
          print('Invalid input. Choose a valid option.');
          break;
      }
    }
  }
}

void readNote() {
  print('You read the note on the table:');
  print('The note contains a code: $code');
  print('It seems related to the mechansim.');
  noteRead = true;
}

void solvePuzzle() {
  print('You attempt to solve the puzzle...');
  print('Enter the code:');

  String userInput = stdin.readLineSync()?.trim() ?? '';

  if (userInput.toLowerCase() == 'exit') {
    print('Exiting the room...');
    return;
  } else if (userInput == code) {
    print('Congratulations! You solve the puzzle.');
    trapSolved = true;
    doorLockedRight = false; // Unlock the door
    print('You hear the door unlock.');
  } else {
    print('Inncorrect code. Try again or type "exit" to leave the puzzle.');
  }
}

void handleRoomRight() {
  if(inSecondRoom) {
    enterRightRoom();
  } else {
    print('There is no door here.');
  }
}