import 'dart:io';

List<Map<String, dynamic>> commands = [
  {'number': '1', 'description': 'Move forward', 'action': 'You move forward.'},
  {'number': '2', 'description': 'Move backward', 'action': 'You move backward.'},
  {'number': '3', 'description': 'Move left', 'action': 'You move left.'},
  {'number': '4', 'description': 'Move right', 'action': 'You move right.'},
  {'number': '5', 'description': 'Open the door', 'action': 'You open the door and find a corridor.'},
  {'number': '6', 'description': 'Pick up item', 'action': 'You pick up an item.'},
  {'number': '7', 'description': 'Use item', 'action': 'You used the item.'},
];

List<String> inventory = [];

String getPlayerInput() {
  print('What would you like to do?');
  commands.forEach((command) {
    print('${command['number']}. ${command['description']}');
  });

  return stdin.readLineSync() ?? '';
}

bool executeCommand(String userInput) {
  bool commandFound = false;

  bool isValidInput = int.tryParse(userInput) != null &&
      int.parse(userInput) >= 1&&
      int.parse(userInput) <= commands.length;
  
  if (isValidInput) {
    commands.forEach((command) {
      if (userInput == command['number'].toString()) {
        print(command['action']);
        if (command.containsKey('acquiredItem')) {
          inventory.add(command['acquiredItem']);
          print('You acuquired ${command['acquierdItem']}!');
        }
        commandFound = true;
      }
    });
  } else {
    print('Invalid input. Please enter number between 1 and ${commands.length}.');
  }

  return commandFound;
}

void main() {
  bool gameRunning = true;

  while (gameRunning) {
    String userInput = getPlayerInput();
    bool commandExecuted = executeCommand(userInput);

    if (!commandExecuted && userInput.toLowerCase() == 'exit') {
      gameRunning = false;
    }
  }
}