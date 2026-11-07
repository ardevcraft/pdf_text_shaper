import 'dart:io';

import 'package:punjabi_pdf_fixer/punjabi_pdf_fixer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln(
      'Usage: dart run example/main.dart /path/to/NotoSansGurmukhi-Regular.ttf',
    );
    exitCode = 64;
    return;
  }

  final fontBytes = await File(args.first).readAsBytes();
  final font = ShapedFont.fromBytes(
    fontBytes,
    name: 'Punjabi (Gurmukhi) example',
  );

  try {
    final document = pw.Document();
    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            PunjabiHeader(
              'Punjabi (Gurmukhi) PDF shaping',
              font: font,
              fontSize: 24,
            ),
            pw.SizedBox(height: 16),
            PunjabiParagraph(
              'ਪੰਜਾਬੀ: ਮੈਂ ਪੰਜਾਬੀ ਵਿੱਚ ਲਿਖ ਰਿਹਾ ਹਾਂ।',
              font: font,
              fontSize: 16,
            ),
            pw.SizedBox(height: 12),
            PunjabiText(
              'ਸਿੱਖਿਆ ਵਿਦਿਆਰਥੀ ਪ੍ਰੀਖਿਆ ਸੂਚਨਾ ਜ਼ਿੰਮੇਵਾਰੀ ਪੰਜਾਬ',
              font: font,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );

    await File('punjabi_pdf_fixer_example.pdf')
        .writeAsBytes(await document.save());
  } finally {
    font.dispose();
  }
}
