import 'dart:io';
import 'room_right.dart';
import 'room_left.dart';
import 'inventory.dart';

bool doorLockedInFront = true;
bool doorLockedLeft = false;
bool doorLockedRight = false;

bool inMiddleOfRoom = true;
bool inSecondRoom = false;
bool inThirdRoom = false;
bool inFourthRoom = false;

void moveForward() {
  if (inMiddleOfRoom) {
    print('You move forward to the door.');

    if (doorLockedInFront) {
      askToTryOpenDoor('front');
    } else {
      print('The door is unlocked.');
      inMiddleOfRoom = false;
      inFourthRoom = true;
    }
  } else {
    print('There is no door here.');
  }
}

void moveBackward() {
  if (inSecondRoom || inThirdRoom || inFourthRoom) {
    print('You move back.');
    inMiddleOfRoom = true;
    inSecondRoom = inThirdRoom = inFourthRoom = false;
  } else {
    print('You move back to the middle of the room');
    inMiddleOfRoom = true;
  }
}

void moveRight() {
  if (inMiddleOfRoom) {
    print('You move right to the door.');

    if (doorLockedRight) {
      print('The door is locked.');
      askToTryOpenDoor('right');
    } else {
      print('The door is unlocked.');
      inMiddleOfRoom = false;
      inSecondRoom = true;
      askToEnterRoom();
    }
  } else {
    print('There is no door to the right here.');
  }
}

void askToEnterRoom() {
  stdout.write('Do you want to enter the room on the right? (yes/no)');
  String answer = stdin.readLineSync()?.toLowerCase() ?? '';

  if (answer == 'yes') {
    enterRightRoom();
  } else if (answer == 'no') {
    print('You choose not to enter the room.');
  } else {
    print('Invalid input.');
  }
}

void handleRoomRight() {
  if (inSecondRoom) {
    enterRightRoom();
  } else {
    print('There is no door here.');
  }
}

void moveLeft() {
  if (inMiddleOfRoom) {
    print('You move left to the door.');

    if (doorLockedLeft) {
      print('The door is locked.');
      askToTryOpenDoor('left');
    } else {
      print('The door is unlocked.');
      inMiddleOfRoom = false;
      inThirdRoom = true;
      handleRoomLeft();
    }
  } else {
    print('There is no door to the left here.');
  }
}

void askToTryOpenDoor(String direction) {
  stdout.write('Do you want to try opening the door to the $direction? (yes/no)');
  String answer = stdin.readLineSync()?.toLowerCase() ?? '';

  if (answer == 'yes') {
    if (direction == 'front') {
      unlockFrontDoor();
    } else {
      print('You try to open the door...');
      doorLockedInFront = false;  // Assuming other doors do not require a key
      print('The door is now unlocked.');
      inMiddleOfRoom = false;
      inFourthRoom = true;
    }
  } else if (answer == 'no') {
    print('You choose not to try opening the door.');
  } else {
    print('Invalid input.');
  }
}

void unlockFrontDoor() {
  if (inventory.contains('Key')) {
    print('You use the key to unlock the door.');
    doorLockedInFront = false;
    print('The door in front is now unlocked.');
    inMiddleOfRoom = false;
    inFourthRoom = true;
    askToEnterFrontRoom();
  } else {
    print('You do not have the key to unlock the door.');
  }
}

void askToEnterFrontRoom() {
  stdout.write('Do you want to enter the front door? (yes/no)');
  String answer = stdin.readLineSync()?.toLowerCase() ?? '';

  if (answer == 'yes') {
    enterFrontRoom();
  } else if (answer == 'no') {
    print('You choose not to enter the front door.');
  } else {
    print('Invalid input.');
  }
}

void enterFrontRoom() {
  print('You enter the front door.');
  print(getFrontRoomDescription());  // Display description of the front room
  print('Congratulations! You completed the game.');
  // You can add more actions or end the game as needed.
}

String getFrontRoomDescription() {
  // Customize this function to return the description of the front room.
  return 'You are in a mysterious room with a treasure chest. Well done!';
}

void showMovementOptions() {
  print('Movement options:');
  print('1. Move forward');
  print('2. Move backward');
  print('3. Move right');
  print('4. Move left');
  print('5. Use key to unlock the front door');  // Added option

  String movementInput = stdin.readLineSync()?.trim() ?? '';

  bool executedCommand = false;

  switch (movementInput) {
    case '1':
      moveForward();
      executedCommand = true;
      break;
    case '2':
      moveBackward();
      executedCommand = true;
      break;
    case '3':
      moveRight();
      executedCommand = true;
      break;
    case '4':
      moveLeft();
      executedCommand = true;
      break;
    case '5':
      unlockFrontDoor();  // Added case to use key
      executedCommand = true;
      break;
    default:
      print('Invalid movement command.');
      break;
  }
}

bool executeMovementCommand(String userInput) {
  switch (userInput) {
    case '1':
      moveForward();
      return true;
    case '2':
      moveBackward();
      return true;
    case '3':
      moveRight();
      return true;
    case '4':
      moveLeft();
      return true;
    default:
      print('Invalid movement command.');
      return false;
  }
}