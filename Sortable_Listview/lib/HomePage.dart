import 'package:flutter/material.dart';
import 'package:sortable_listview/users.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final header = ['Name', 'Age'];
  List<User> users;
  int sortingColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sortable ListView')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: DataTable(
            columns: allColumns(header),
            rows: allRows(users),

            /// sorting
            sortColumnIndex: sortingColumnIndex,
            sortAscending: isAscending,
          ),
        ),
      ),
    );
  }

  List<DataColumn> allColumns(List<String> header) => header
      .map(
          (String column) => DataColumn(label: Text(column), onSort: onSorting))
      .toList();

  List<DataRow> allRows(List<User> users) => users.map((User user) {
        final cells = [user.userName, user.age];
        return DataRow(cells: rowCells(cells));
      }).toList();

  List<DataCell> rowCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSorting(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      users.sort((user1, user2) =>
          compareString(ascending, user1.userName, user2.userName));
    }else if (columnIndex == 1) {
      users.sort((user1, user2) =>
          compareString(ascending, '${user1.age}', '${user2.age}'));
    }
    setState(() {
      this.sortingColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

}
