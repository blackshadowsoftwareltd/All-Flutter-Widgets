import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

class PdfViewer extends StatefulWidget {
  final String path;

  PdfViewer({this.path});

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(path: widget.path);
  }
}
