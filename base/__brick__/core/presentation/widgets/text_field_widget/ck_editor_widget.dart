import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class CkEditorWidget extends StatelessWidget {
  const CkEditorWidget({
    super.key,
    required this.controller,
    this.hintText,
    this.enabled = true,
    this.initialText,
    this.inputType = HtmlInputType.text,
    this.height = 200,
  });
  final HtmlEditorController controller;
  final String? hintText;
  final bool enabled;
  final String? initialText;
  final HtmlInputType inputType;
  final double height;

  @override
  Widget build(BuildContext context) {
    return HtmlEditor(
      controller: controller,
      htmlEditorOptions: HtmlEditorOptions(
        disabled: !enabled,
        hint: hintText,
        initialText: initialText,
        inputType: inputType,
      ),
      otherOptions: OtherOptions(
        height: height,
      ),
    );
  }
}
