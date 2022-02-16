import 'package:flutter/material.dart';

class table extends StatelessWidget {

  List<List<String>> orders;
  table({
    required this.orders,
  }) ;

  TableRow buildRow(List<String> cells, {bool isHeader = false}) =>
      TableRow(
        children: cells.map((cell) {
          final style = TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            color: isHeader ? Colors.teal : Colors.black,
            fontSize: 20,
          );
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Center(child: Text(cell, style: style)),
          );
        }
        ).toList(),
      );

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const {
        0: FractionColumnWidth(0.5),
        1: FractionColumnWidth(0.20),
        2: FractionColumnWidth(0.30),
      },
      children: [
        buildRow(['Items', 'Qty', 'Price'], isHeader: true),
        for(int i=1;i<orders.length;i++)
          buildRow([orders[i][0], 'x'+orders[i][1], orders[i][2]]),
        buildRow(['Sub-Total', '-', getSum()]),
        buildRow(['Delivery', '-', '50']),
        buildRow(['Total', '-', (double.parse(getSum())+50).toString()]),
      ],
    );
  }
  String getSum(){
    double sum=0;
    for(int i=1;i<orders.length;i++) {
      sum+=double.parse(orders[i][2]);
    }
    return sum.toString();
  }
}