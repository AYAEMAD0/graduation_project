import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/python.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class CodeEditor extends StatefulWidget {
  const CodeEditor({super.key});

  @override
  State<CodeEditor> createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  late CodeController _codeController;
  final Color backgroundColor = const Color(0xFF0E141E);

  @override
  void initState() {
    super.initState();
    _codeController = CodeController(
      text:"# write the code here\ndef solve():\n    print('Hello World')",
      language: python,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          _buildToolbar(),
          Expanded(
            child: CodeTheme(
              data: CodeThemeData(styles: monokaiSublimeTheme),
              child: Container(
                decoration: BoxDecoration(color: backgroundColor),
                child: SingleChildScrollView(
                  child: CodeField(
                    controller: _codeController,
                    textStyle: GoogleFonts.firaCode(fontSize: 14, height: 1.5),
                    gutterStyle: GutterStyle(
                      background: backgroundColor,
                      textStyle: const TextStyle(color: Color(0xFF455A64)),
                      showLineNumbers: true,
                      margin: 12,
                    ),
                    background: backgroundColor,
                  ),
                ),
              ),
            ),
          ),

          _buildConsoleFooter(),
        ],
      ),
    );
  }

  Widget _buildToolbar() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: const Color(0xFF1C2333),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.settings_outlined, color: Colors.white54, size: 18),
          const SizedBox(width: 10),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: 'Python',
              dropdownColor: const Color(0xFF1C2333),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white54,
                size: 16,
              ),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (newLang) {},
              items: const ['Python'].map((String lang) {
                return DropdownMenuItem<String>(value: lang, child: Text(lang));
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConsoleFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xFF0E141E),
        border: Border(top: BorderSide(color: Colors.white10)),
      ),
      child: Row(
        children: [
          const Icon(Icons.keyboard_arrow_up, color: Colors.white54, size: 18),
          const SizedBox(width: 8),
          const Text(
            "Console",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2ECC71),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              "Run Code",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }
}
