import 'dart:io';

void moveForward() {
  print('You move forward.');
}

void moveBackward() {
  print('You move backward.');
}

void moveLeft() {
  print('You move left.');
}

void moveRight() {
  print('You move right.');
}

void showMovementOptions() {
  bool showMenu = true;

  while (showMenu) {
    print('Movement options');
    print('1. Move forward');
    print('2. Move backward');
    print('3. Move left');
    print('4. Move right');
    print('5. Back');

    String movementInput = stdin.readLineSync() ?? '';
    if (movementInput == '5') {
      print('Returning to main menu.');
      break;
    }

    bool movementCommandExecuted = executeMovementCommand(movementInput);
    if (!movementCommandExecuted){
      print('Invalid movement command.');
    }
  }
}

bool executeMovementCommand(String userInput) {
  bool commandFound = false;

  bool isValidInput = int.tryParse(userInput) != null &&
      int.parse(userInput) >= 1 &&
      int.parse(userInput) <= 5;

  if (isValidInput) {
    switch (userInput) {
      case '1':
        moveForward();
        commandFound = true;
        break;
      case '2':
        moveBackward();
        commandFound = true;
        break;
      case '3':
        moveLeft();
        commandFound = true;
        break;
      case '4':
        moveRight();
        commandFound = true;
        break;
      case '5':
        commandFound = true;
        break;
      default:
        print('Invalid movement command.');
    }
  } else {
    print('Invalid input. Please enter a number between 1 and 5.');
  }

  return commandFound;
}