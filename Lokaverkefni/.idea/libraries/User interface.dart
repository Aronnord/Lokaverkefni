import 'dart:io';
import 'movement.dart';
import 'inventory.dart';

List<Map<String, dynamic>> commands = [
  {'number': '1', 'description': 'Move', 'action': 'Choose a movement direction.'},
  {'number': '2', 'description': 'Check the inventory', 'action': 'You check your inventory.'},
  {'number': '3', 'description': 'Pick up item', 'action': 'You pick up an item.'},
  {'number': '4', 'description': 'Use item', 'action': 'You used the item.'},
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
      int.parse(userInput) >= 1 &&
      int.parse(userInput) <= commands.length;

  if (isValidInput) {
    commands.forEach((command) {
      if (userInput == command['number'].toString()) {
        if (userInput == '1') {
          showMovementOptions();
        } else if (userInput == '2') {
          showInventory();
        } else {
          print(command['action']);
          if (command.containsKey('acquiredItem')) {
            addToInventory(command['acquiredItem']);
          }
        }
        commandFound = true;
      }
    });
  } else {
    print('Invalid input. Please enter a number between 1 and ${commands.length}.');
  }

  return commandFound;
}