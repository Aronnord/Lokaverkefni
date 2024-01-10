List<String> inventory = [];

void showInventory() {
  if (inventory. isEmpty) {
    print('Your inventiry is empty,');
  } else {
    print('Inventory:');
    for (String item in inventory) {
      print('- $item');
    }
  }
}

void addToInventory(String item) {
  inventory.add(item);
}

void useItemFromInventory(String item) {
  if (inventory.contains(item)) {
    print('You used $item.');
    inventory.remove(item);
  } else {
    print('You do not have $item in your inventory.');
  }
}