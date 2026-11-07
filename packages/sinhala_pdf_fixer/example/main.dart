import 'dart:io';

import 'package:sinhala_pdf_fixer/sinhala_pdf_fixer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln(
      'Usage: dart run example/main.dart /path/to/NotoSansSinhala-Regular.ttf',
    );
    exitCode = 64;
    return;
  }

  final fontBytes = await File(args.first).readAsBytes();
  final font = ShapedFont.fromBytes(fontBytes, name: 'Sinhala example');

  try {
    final document = pw.Document();
    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            SinhalaHeader('Sinhala PDF shaping', font: font, fontSize: 24),
            pw.SizedBox(height: 16),
            SinhalaParagraph(
              'සිංහල: මම සිංහලෙන් ලියනවා.',
              font: font,
              fontSize: 16,
            ),
            pw.SizedBox(height: 12),
            SinhalaText(
              'ආයුබෝවන් ලෝකය අධ්‍යාපනය ශිෂ්‍යයා විභාගය නිවේදනය',
              font: font,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );

    await File('sinhala_pdf_fixer_example.pdf')
        .writeAsBytes(await document.save());
  } finally {
    font.dispose();
  }
}
