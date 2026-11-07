import 'dart:io';
import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:persian_pdf_fixer/persian_pdf_fixer.dart';
import 'package:printing/printing.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PersianPdfTestApp());
}

class PersianPdfTestApp extends StatelessWidget {
  const PersianPdfTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persian PDF Test',
      theme: ThemeData(colorSchemeSeed: const Color(0xFF2457A7)),
      home: const PersianPdfTestScreen(),
    );
  }
}

class PersianPdfTestScreen extends StatefulWidget {
  const PersianPdfTestScreen({super.key});

  @override
  State<PersianPdfTestScreen> createState() => _PersianPdfTestScreenState();
}

class _PersianPdfTestScreenState extends State<PersianPdfTestScreen> {
  XFile? _fontFile;
  Uint8List? _pdfBytes;
  String? _savedPdfPath;
  String? _status;
  bool _isBusy = false;

  Future<void> _chooseFont() async {
    final file = await openFile(
      acceptedTypeGroups: const <XTypeGroup>[
        XTypeGroup(label: 'Font files', extensions: <String>['ttf', 'otf']),
      ],
    );
    if (!mounted || file == null) return;

    setState(() {
      _fontFile = file;
      _pdfBytes = null;
      _savedPdfPath = null;
      _status = 'Selected ${file.name}';
    });
  }

  Future<void> _generatePdf() async {
    final fontFile = _fontFile;
    if (fontFile == null) {
      setState(
        () => _status = 'Choose a Persian-capable TTF or OTF font first.',
      );
      return;
    }

    setState(() {
      _isBusy = true;
      _status = 'Generating PDF…';
      _pdfBytes = null;
      _savedPdfPath = null;
    });

    ShapedFont? font;
    try {
      final fontBytes = await fontFile.readAsBytes();
      final shapedFont = ShapedFont.fromBytes(fontBytes, name: fontFile.name);
      font = shapedFont;

      final document = pw.Document();
      document.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (_) => pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              PersianHeader(
                'Persian PDF shaping',
                font: shapedFont,
                fontSize: 24,
              ),
              pw.SizedBox(height: 16),
              PersianParagraph(
                'فارسی: من به زبان فارسی می‌نویسم. شماره پیگیری: ۱۲۳۴۵۶۷۸۹۰',
                font: shapedFont,
                fontSize: 16,
              ),
              pw.SizedBox(height: 12),
              PersianText(
                'مبلغ: ۱۲۳٬۴۵۶٫۷۸ ریال | English reference: INV-2026-12345',
                font: shapedFont,
                fontSize: 18,
              ),
              pw.SizedBox(height: 12),
              PersianText(
                'تاریخ: ۱۴۰۵/۰۲/۱۵ — اعداد مستقل: ۱۲۳۴۵',
                font: shapedFont,
                fontSize: 16,
              ),
            ],
          ),
        ),
      );

      final bytes = await document.save();
      if (!mounted) return;
      setState(() {
        _pdfBytes = bytes;
        _status = 'PDF generated. Review the preview below.';
      });
    } catch (error) {
      if (mounted) setState(() => _status = 'Could not generate PDF: $error');
    } finally {
      font?.dispose();
      if (mounted) setState(() => _isBusy = false);
    }
  }

  Future<void> _saveAndOpenPdf() async {
    final bytes = _pdfBytes;
    if (bytes == null) return;

    final saveLocation = await getSaveLocation(
      suggestedName: 'persian_pdf_fixer_test.pdf',
      acceptedTypeGroups: const <XTypeGroup>[
        XTypeGroup(label: 'PDF document', extensions: <String>['pdf']),
      ],
    );
    if (!mounted || saveLocation == null) return;

    setState(() {
      _isBusy = true;
      _status = 'Saving PDF…';
    });

    try {
      final file = File(saveLocation.path);
      await file.writeAsBytes(bytes, flush: true);
      final opened = await launchUrl(Uri.file(file.absolute.path));
      if (!opened) {
        throw StateError('macOS could not open the saved PDF.');
      }
      if (mounted) {
        setState(() {
          _savedPdfPath = file.path;
          _status = 'Saved and opened in the default PDF viewer.';
        });
      }
    } catch (error) {
      if (mounted)
        setState(() => _status = 'Could not save or open PDF: $error');
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Persian PDF shaping test')),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  OutlinedButton.icon(
                    onPressed: _isBusy ? null : _chooseFont,
                    icon: const Icon(Icons.font_download_outlined),
                    label: Text(_fontFile?.name ?? 'Choose Persian font'),
                  ),
                  FilledButton.icon(
                    onPressed: _isBusy || _fontFile == null
                        ? null
                        : _generatePdf,
                    icon: const Icon(Icons.picture_as_pdf_outlined),
                    label: const Text('Generate preview'),
                  ),
                  OutlinedButton.icon(
                    onPressed: _isBusy || _pdfBytes == null
                        ? null
                        : _saveAndOpenPdf,
                    icon: const Icon(Icons.open_in_new),
                    label: const Text('Save and open PDF'),
                  ),
                ],
              ),
            ),
            if (_status != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: SelectableText(
                  _savedPdfPath == null ? _status! : '$_status\n$_savedPdfPath',
                  style: TextStyle(color: colors.onSurfaceVariant),
                  textAlign: TextAlign.center,
                ),
              ),
            Expanded(
              child: _pdfBytes == null
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          'Choose Estedad, Vazirmatn, or another font with Persian and Latin glyphs, then generate the sample PDF.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    )
                  : PdfPreview(
                      build: (_) async => _pdfBytes!,
                      initialPageFormat: PdfPageFormat.a4,
                      allowPrinting: false,
                      allowSharing: false,
                      canChangeOrientation: false,
                      canChangePageFormat: false,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
