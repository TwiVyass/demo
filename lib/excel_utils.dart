import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:excel/excel.dart' as excelPackage; // Using a prefix
// Uncomment this if you also need flutter_excel
// import 'package:flutter_excel/excel.dart';

class ExcelUtils {
  static Future<void> exportToExcel(String organization, String name, String age, String weight) async {
    var excel = excelPackage.Excel.createExcel(); // Use the prefix
    excelPackage.Sheet sheet = excel['Sheet1']; // Use the prefix for Sheet too

    // Add data to the Excel sheet
    sheet.appendRow(['Organization', organization]);
    sheet.appendRow(['Name', name]);
    sheet.appendRow(['Age', age]);
    sheet.appendRow(['Weight', weight]);

    // Get the Excel file bytes
    List<int>? fileBytes = excel.encode(); // Get bytes from the Excel document

    if (fileBytes != null) {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$organization.xlsx';
      final file = File(filePath);

      await file.writeAsBytes(fileBytes);
      print('Excel file created at $filePath');
    } else {
      print('Error: fileBytes is null, cannot create Excel file');
    }
  }
}
