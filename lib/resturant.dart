import 'Table.dart';
import 'table_order.dart';
import 'takeaway_order.dart';

class Resturant {
  static int resturantIncome = 0;

  List<TakeawayOrder> takeawayOrders = [];
  List<TableOrder> tableOrders = [];

  List<Table> tables = [];
//------------------------------------------------------------------------------
  void addTable({required int id, required int capacity}) {
    tables.add(Table(id: id, capacity: capacity));
  }

  void emptyTable({required int tableId}) {
    tables.firstWhere((table) => table.id == tableId).state = tableStates.empty;
  }

  void reserveTable({required int tableId}) {
    tables.firstWhere((table) => table.id == tableId).state =
        tableStates.reserved;
  }

  void cancelReservation({required int tableId}) {
    tables.firstWhere((table) => table.id == tableId).state = tableStates.empty;
  }

  void fullTable({required int tableId}) {
    tables.firstWhere((table) => table.id == tableId).state = tableStates.full;
  }

  List<String> tablesState() {
    List<String> tablesStat = [];
    for (Table table in tables) {
      tablesStat.add(table.toString());
    }
    print(tablesStat);
    return tablesStat;
  }

  void registerTakeawayOrder({required String timeOfDelivery}) {
    TakeawayOrder order = new TakeawayOrder(timeOfDelivery);
    takeawayOrders.add(order);
  }

  void registerTableOrder({required int tableId}) {
    if (tables.firstWhere((table) => table.id == tableId).state ==
        tableStates.empty) {
      TableOrder tableOrder = new TableOrder(tableId: tableId);
      tableOrders.add(tableOrder);
    }
  }
}
