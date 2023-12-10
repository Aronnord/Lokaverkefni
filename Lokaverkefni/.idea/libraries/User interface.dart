import 'dart:io';

void main() {
  print('Welcome to the room!');

  List<Map<String, dynamic>> commands = [
    {'number': '1', 'description': 'Look around', 'action': 'You look around and see a table and a chair.'},
    {'number': '2', 'description': 'Open the door', 'action': 'You open the door and find a corridor.'},
    {'number': '3', 'description': 'Sit down', 'action': 'You sit down and take a rest.'},
  ];

  while (true) {
    print('What would you like to do?');
    commands.forEach((command) {
      print('${command['number']}. ${command['description']}');
    });

    String? userInput = stdin.readLineSync();

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
  }
}