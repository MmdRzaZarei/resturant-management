class Table {
  int id;
  int capacity;
  var state = tableStates.empty;
  Table({required this.id, required this.capacity});

  @override
  String toString() {
    return 'Table{id: $id, capacity: $capacity, state: $state}';
  }
}

enum tableStates { empty, full, reserved }
