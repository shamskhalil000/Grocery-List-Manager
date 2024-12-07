import 'dart:io';

void main() {
  List<String> groceryList = [];
  Set<String> grocerySet = {};
  Map<String, int> groceryMap = {}; // Map to keep track of item counts

  while (true) {
    print('\nGrocery List Manager');
    print('1. Add Item');
    print('2. Remove Item');
    print('3. View List');
    print('4. Search for Item');
    print('5. View Unique Items (Set)');
    print('6. View Item Counts (Map)');
    print('7. Exit');
    stdout.write('Choose an option: ');

    int? choice = int.tryParse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        stdout.write('Enter the item to add: ');
        String item = stdin.readLineSync()!;
        addItem(groceryList, grocerySet, groceryMap, item);
        break;

      case 2:
        stdout.write('Enter the item to remove: ');
        String item = stdin.readLineSync()!;
        removeItem(groceryList, grocerySet, groceryMap, item);
        break;

      case 3:
        print('Your Grocery List:');
        displayList(groceryList, format: 'as-is');
        break;

      case 4:
        stdout.write('Enter the item to search for: ');
        String item = stdin.readLineSync()!;
        searchItem(groceryList, item);
        break;

      case 5:
        print('Unique Items in the Grocery List (Set):');
        displaySet(grocerySet);
        break;

      case 6:
        print('Item Counts (Map):');
        displayMap(groceryMap);
        break;

      case 7:
        print('Exiting Grocery List Manager. Goodbye!');
        return;

      default:
        print('Invalid choice. Please try again.');
    }
  }
}

/// Adds an item to the list, set, and map.
void addItem(
    List<String> list, Set<String> set, Map<String, int> map, String item) {
  list.add(item);
  set.add(item);
  map[item] = (map[item] ?? 0) + 1; // Increment item count
  print('Item "$item" added successfully.');
}

/// Removes an item from the list, set, and map.
void removeItem(
    List<String> list, Set<String> set, Map<String, int> map, String item) {
  if (list.contains(item)) {
    list.remove(item);
    map[item] = map[item]! - 1;

    if (map[item] == 0) {
      map.remove(item);
      set.remove(item);
    }
    print('Item "$item" removed successfully.');
  } else {
    print('Item "$item" not found.');
  }
}

/// Searches for an item in the list and displays its occurrences.
void searchItem(List<String> list, String item) {
  int count = list.where((e) => e == item).length;
  if (count > 0) {
    print('Item "$item" found $count time(s) in the list.');
  } else {
    print('Item "$item" not found in the list.');
  }
}

/// Displays the grocery list with an optional format for text.
void displayList(List<String> list, {String format = 'as-is'}) {
  if (list.isEmpty) {
    print('The grocery list is empty.');
    return;
  }
  for (var item in list) {
    switch (format) {
      case 'uppercase':
        print(item.toUpperCase());
        break;
      case 'lowercase':
        print(item.toLowerCase());
        break;
      default:
        print(item);
    }
  }
}

/// Displays the unique items in the grocery list (Set).
void displaySet(Set<String> set) {
  if (set.isEmpty) {
    print('The grocery list is empty.');
    return;
  }
  for (var item in set) {
    print(item);
  }
}

/// Displays the item counts (Map).
void displayMap(Map<String, int> map) {
  if (map.isEmpty) {
    print('The grocery list is empty.');
    return;
  }
  map.forEach((key, value) {
    print('$key: $value');
  });
}
