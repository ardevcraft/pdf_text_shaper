import 'dart:io';

import 'package:malayalam_pdf_fixer/malayalam_pdf_fixer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln(
      'Usage: dart run example/main.dart /path/to/NotoSansMalayalam-Regular.ttf',
    );
    exitCode = 64;
    return;
  }

  final fontBytes = await File(args.first).readAsBytes();
  final font = ShapedFont.fromBytes(fontBytes, name: 'Malayalam example');

  try {
    final document = pw.Document();
    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            MalayalamHeader('Malayalam PDF shaping', font: font, fontSize: 24),
            pw.SizedBox(height: 16),
            MalayalamParagraph(
              'മലയാളം: ഞാൻ മലയാളത്തിൽ എഴുതുന്നു.',
              font: font,
              fontSize: 16,
            ),
            pw.SizedBox(height: 12),
            MalayalamText(
              'വിദ്യാഭ്യാസം വിദ്യാർത്ഥി പരീക്ഷ അറിയിപ്പ് ഉത്തരവാദിത്വം കേരളം',
              font: font,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );

    await File('malayalam_pdf_fixer_example.pdf')
        .writeAsBytes(await document.save());
  } finally {
    font.dispose();
  }
}
