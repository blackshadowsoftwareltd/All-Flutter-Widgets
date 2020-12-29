import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: _DataTable(),
      debugShowCheckedModeBanner: false,
    ));

class _DataTable extends StatefulWidget {
  @override
  _DataTableState createState() => _DataTableState();
}

class _DataTableState extends State<_DataTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Table'),
      ),
      body: Center(
        child: DataTable(
          headingRowHeight: 100,
          columnSpacing: 30,
          columns: [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Age')),
            DataColumn(label: Text('Roll')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Remon')),
              DataCell(Text('20')),
              DataCell(Text('253614')),
            ]),
            DataRow(cells: [
              DataCell(Text('Remon')),
              DataCell(Text('20')),
              DataCell(Text('253614')),
            ])
          ],
        ),
      ),
    );
  }
}
