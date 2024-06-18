import 'package:data_table_2/data_table_2.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class FareChartDataTable {
  List<List<dynamic>> data = []; // List to store excel data

  Future<List<List<String>>> readExcelFile() async {
    // Load the Excel file as bytes
    ByteData data = await rootBundle.load('assets/documents/fare_chart.xlsx');
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Decode the Excel file
    var excel = Excel.decodeBytes(bytes);

    // Assume the first sheet
    var sheet = excel.tables[excel.tables.keys.first];
    List<List<String>> excelData = [];

    // Read the rows of the sheet
    for (var row in sheet!.rows) {
      List<String> rowData =
          row.map((cell) => cell?.value?.toString() ?? '').toList();
      excelData.add(rowData);
    }

    return excelData;
  }

  Widget buildDataTable() {
    Future<List<List<String>>> excelData0 = readExcelFile();
    return FutureBuilder<List<List<String>>>(
      future: excelData0,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          var excelData = snapshot.data;
          var headers = excelData?.first;
          var rows = excelData?.skip(1).toList();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: DataTable2(
              fixedColumnsColor: Theme.of(context).primaryColor,
              headingRowColor: WidgetStateColor.resolveWith((states) {
                // Set background color for the heading row
                return Theme.of(context).primaryColor;
              }),
              columns: headers!.asMap().entries.map((entry) {
                String header = entry.value;

                return DataColumn(
                  label: Container(
                    alignment: Alignment.center,
                    child: Text(
                      header,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              }).toList(),
              rows: rows!.map((row) {
                return DataRow(
                  cells: row.asMap().entries.map((entry) {
                    int cellIndex = entry.key;
                    String cellValue = entry.value;
                    return DataCell(
                      Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          cellValue,
                          style: cellIndex == 0
                              ? const TextStyle(
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ),
                    );
                  }).toList(),
                );
              }).toList(),
              fixedLeftColumns: 1,
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 1500,
              border: TableBorder.all(
                width: 1,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
          );
        }
      },
    );
  }
}
