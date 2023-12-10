import 'dart:io';

List<Map<String, dynamic>> commands = [3
  {'number': '1', 'description': 'Open the door', 'action': 'You open the door and find a corridor.'},
  {'number': '2', 'description': 'Pick up item', 'action': 'You pick up an item.'},
  {'number': '3', 'description': 'Use item', 'action': 'You used the item.'},
];

String getPlayerInput() {
  print('What would you like to do?');
  commands.forEach((command) {
    print('${command['number']}. ${command['description']}');
  });

  return stdin.readLineSync() ?? '';
}

bool executeCommand(String userInput) {
  bool commandFound = false;
  commands.forEach((command) {
    if (userInput == command['number']) {
      print(command['action']);
      commandFound = true;
    }
  });

  if (!commandFound) {
    print('Invalid input. Please enter a number between 1 and ${commands.length}.');
  }
  return commandFound;
}