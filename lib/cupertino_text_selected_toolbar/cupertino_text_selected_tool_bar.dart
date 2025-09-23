import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CupertinoTextSelectedToolBar extends StatelessWidget {
  const CupertinoTextSelectedToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    final String textToCopy = "ده النص اللي هيتم نسخه عند الضغط الطويل";
    return Scaffold(
      appBar: AppBar(title: const Text('Toolbar Demo with Children')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "TextField Example:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              contextMenuBuilder: (context, EditableTextState state) {
                return CupertinoAdaptiveTextSelectionToolbar(
                  anchors: state.contextMenuAnchors,
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        state.copySelection(SelectionChangedCause.toolbar);
                      },
                      child: const Text("Copy"),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        state.cutSelection(SelectionChangedCause.toolbar);
                      },
                      child: const Text("Cut"),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        state.pasteText(SelectionChangedCause.toolbar);
                      },
                      child: const Text("Paste"),
                    ),
                  ],
                );
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type something...',
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "SelectableText Example:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SelectableText(
              "This is selectable text. Try selecting me!",
              contextMenuBuilder: (context, EditableTextState state) {
                return CupertinoAdaptiveTextSelectionToolbar(
                  anchors: state.contextMenuAnchors,
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        state.copySelection(SelectionChangedCause.toolbar);
                      },
                      child: const Text("Copy"),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 24),
            SelectableText(
              "انسخ النص ده بسهولة",
              textDirection: TextDirection.rtl,
              contextMenuBuilder: (context, EditableTextState state) {
                return CupertinoAdaptiveTextSelectionToolbar(
                  anchors: state.contextMenuAnchors,
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        state.copySelection(SelectionChangedCause.toolbar);
                      },
                      child: const Text("نسخ"),
                    ),
                  ],
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Clipboard.setData(
                  const ClipboardData(text: "النص اللي هيتنسخ"),
                );
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("تم نسخ النص!")));
              },
              child: const Text("نسخ النص"),
            ),
            GestureDetector(
              onLongPress: () {
                Clipboard.setData(ClipboardData(text: textToCopy));
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("تم نسخ النص!")));
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.blue.shade50,
                child: Text(textToCopy, style: const TextStyle(fontSize: 18)),
              ),
            ),
            CupertinoButton(onPressed: () {}, child: const Text("نسخ")),
          ],
        ),
      ),
    );
  }
}
