import 'dart:io';
import 'package:PDF_in_Flutter/Viewer.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pdf = pw.Document();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PDF'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'PDF',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.save_outlined),
            onPressed: () async {
              writeOnPdf();
              await savePdf();
              Directory documentDirectory =
                  await getApplicationDocumentsDirectory();

              String documentPath = documentDirectory.path;
              String fullPath = '$documentPath/Example.pdf';
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PdfViewer(path: fullPath)));
            }));
  }

  writeOnPdf() {
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(10),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Header(level: 0, child: pw.Text('First heading')),
            pw.Paragraph(text: 'First heading & Paragraph 1'),
            pw.Paragraph(text: 'First heading & Paragraph 2'),
            pw.Header(level: 1, child: pw.Text('Second heading')),
            pw.Paragraph(text: 'Second heading & Paragraph 1'),
            pw.Paragraph(text: 'Second heading & Paragraph 2'),
            pw.Paragraph(text: 'Second heading & Paragraph 3'),
          ];
        }));
  }

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File('$documentPath/Example.pdf');
    file.writeAsBytesSync(pdf.save());
  }
}
