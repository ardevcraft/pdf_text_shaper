import 'dart:io';

import 'package:persian_pdf_fixer/persian_pdf_fixer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln(
      'Usage: dart run example/main.dart /path/to/a/Persian-capable-font.ttf',
    );
    exitCode = 64;
    return;
  }

  final fontBytes = await File(args.first).readAsBytes();
  final font = ShapedFont.fromBytes(fontBytes, name: 'Persian example');

  try {
    final document = pw.Document();
    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            PersianHeader('Persian PDF shaping', font: font, fontSize: 24),
            pw.SizedBox(height: 16),
            PersianParagraph(
              'فارسی: من به زبان فارسی می‌نویسم. شماره پیگیری: ۱۲۳۴۵۶۷۸۹۰',
              font: font,
              fontSize: 16,
            ),
            pw.SizedBox(height: 12),
            PersianText(
              'مبلغ: ۱۲۳٬۴۵۶٫۷۸ ریال | English reference: INV-2026-12345',
              font: font,
              fontSize: 18,
            ),
            pw.SizedBox(height: 12),
            PersianText(
              'تاریخ: ۱۴۰۵/۰۲/۱۵ — اعداد مستقل: ۱۲۳۴۵',
              font: font,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );

    await File('persian_pdf_fixer_example.pdf')
        .writeAsBytes(await document.save());
  } finally {
    font.dispose();
  }
}
