import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class EbookReaderScreen extends StatefulWidget {
  final File pdfFile;

  EbookReaderScreen({required this.pdfFile});

  @override
  _EbookReaderScreenState createState() => _EbookReaderScreenState();
}

class _EbookReaderScreenState extends State<EbookReaderScreen> {
  int currentPage = 1;
  int totalPages = 0;
  bool pdfReady = true;
  PDFViewController? _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ebook Reader')),
      body: pdfReady
          ? PDFView(
              filePath: widget.pdfFile.path,
              onViewCreated: (PDFViewController pdfViewController) {
                setState(() {
                  _pdfViewController = pdfViewController;
                });
              },
              onPageChanged: (int page, int total) {
                setState(() {
                  currentPage = page;
                  totalPages = total;
                });
              },
            )
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _pdfViewController?.previousPage(
                duration: Duration(milliseconds: 250),
                curve: Curves.easeInOut,
              );
            },
            child: Icon(Icons.arrow_back),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              _pdfViewController?.nextPage(
                duration: Duration(milliseconds: 250),
                curve: Curves.easeInOut,
              );
            },
            child: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}

class SomeScreen extends StatefulWidget {
  @override
  _SomeScreenState createState() => _SomeScreenState();
}

class _SomeScreenState extends State<SomeScreen> {
  Future<void> _pickAndOpenPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EbookReaderScreen(pdfFile: file),
        ),
      );
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Some Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: _pickAndOpenPdf,
          child: Text('Open PDF from Local Storage'),
        ),
      ),
    );
  }
}
