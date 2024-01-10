import 'dart:io';

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
    inMiddleOfRoom= true;
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
    }
  } else {
    print('There is no door to the right here.');
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
    }
  } else {
    print('There is no door to the left here.');
  }
}

void askToTryOpenDoor(String direction) {
  stdout.write('Do you want to try opening the door to the $direction? (yes/no)');
  String answer = stdin.readLineSync()?.toLowerCase() ?? '';

  if (answer == 'yes') {
    print('You try to open the door...');
    if (direction == 'front') {
      doorLockedInFront = false;
      print('The door in front is now unlocked.');
      inMiddleOfRoom = false;
      inFourthRoom = true;
    }
  } else if (answer == 'no') {
    print('You choose not to try opening the door.');
  } else {
    print('Invalid input.');
  }
}

void showMovementOptions() {
  print('Movement options:');
  print('1. Move forward');
  print('2. Move backward');
  print('3. Move right');
  print('4. Move left');
  print('5. Go back');

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
      print('Returning to the main menu.');
      break;
    default:
      print('Invalid movement command.');
      break;
  }
}

