import 'package:code_convertor/controller/pane%20controller/pane_controller.dart';
import 'package:code_convertor/utilities/code_editor/code_editor_widget.dart';
import 'package:code_convertor/utilities/constants.dart';
import 'package:code_convertor/utilities/responsive.dart';
import 'package:code_editor/code_editor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeftPane extends StatelessWidget {
  final String? fromLang;
  LeftPane({
    Key? key,
    required this.fromLang,
  }) : super(key: key);

  final PaneController paneController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<FileEditor> files = [
      FileEditor(
        name: "Source",
        language: fromLang,
        code: paneController.sourceCode.value, // [code] needs a string
      ),
    ];

    // The model used by the CodeEditor widget, you need it in order to control it.
    // But, since 1.0.0, the model is not required inside the CodeEditor Widget.
    EditorModel model = EditorModel(
      files: files, // the files created above
      // you can customize the editor as you want
      styleOptions: EditorModelStyleOptions(
        editButtonBackgroundColor: Colors.blueAccent,
        editButtonTextColor: Colors.white,
        heightOfContainer: Responsive.isDesktop(context)
            ? MediaQuery.of(context).size.height * 0.75
            : MediaQuery.of(context).size.height * 0.35,
        fontSize: 13,
        theme: newTheme,
        editorColor: editorBackgroundColor,
        textStyleOfTextField: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
        toolbarOptions: const ToolbarOptions(copy: true),
        editorFilenameColor: Colors.white,
      ),
    );

    // A custom TextEditingController.
    final myController = TextEditingController(text: 'hello!');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          // color: Colors.black54,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          // /!\ important because of the telephone keypad which causes a "RenderFlex overflowed by x pixels on the bottom" error
          // display the CodeEditor widget
          child: CodeEditorWidget(
            model: model, // the model created above, not required since 1.0.0
            // edit: false, // can edit the files ? by default true
            disableNavigationbar:
                false, // hide the navigation bar ? by default false
            onSubmit: (String? language, String? value) async {
              paneController.sourceCode(value);
              await paneController.makePrediction();

              // print(language);
              // print(value);
            }, // when the user confirms changes in one of the files
            textEditingController:
                myController, // Provide an optional, custom TextEditingController.
          ),
        ),
        // ),
      ),
    );
  }
}
