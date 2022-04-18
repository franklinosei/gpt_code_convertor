import 'package:code_convertor/controller/pane%20controller/pane_controller.dart';
import 'package:code_convertor/utilities/constants.dart';
import 'package:code_convertor/utilities/responsive.dart';
import 'package:code_editor/code_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RightPane extends StatelessWidget {
  final String? toLang;
  const RightPane({
    Key? key,
    required this.toLang,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController(text: 'hello!');

    final PaneController paneController = Get.find();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          // color: Colors.black54,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Obx(
          () => SingleChildScrollView(
            // /!\ important because of the telephone keypad which causes a "RenderFlex overflowed by x pixels on the bottom" error
            // display the CodeEditor widget
            child: Stack(
              children: [
                CodeEditor(
                  model: EditorModel(
                    files: [
                      FileEditor(
                        name: "Target",
                        language: toLang,
                        code: paneController
                            .targetCode.value, // [code] needs a string
                      ),
                    ], // the files created above
                    // you can customize the editor as you want
                    styleOptions: EditorModelStyleOptions(
                      heightOfContainer: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.height * 0.75
                          : MediaQuery.of(context).size.height * 0.37,
                      fontSize: 13,
                      theme: newTheme,
                      editorColor: editorBackgroundColor.withOpacity(0.4),
                      textStyleOfTextField: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                      toolbarOptions: const ToolbarOptions(copy: true),
                      editorFilenameColor: Colors.white,
                    ),
                  ), // the model created above, not required since 1.0.0
                  edit: false, // can edit the files ? by default true
                  disableNavigationbar:
                      false, // hide the navigation bar ? by default false
                  // onSubmit: (String? language, String? value) {
                  //   print(language);
                  //   print(value);
                  // }, // when the user confirms changes in one of the files
                  textEditingController:
                      myController, // Provide an optional, custom TextEditingController.
                ),
                Positioned(
                  top: 10,
                  left: Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width * 0.45
                      : MediaQuery.of(context).size.width * 0.8,
                  child: IconButton(
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(
                          text: paneController.targetCode.value,
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.copy,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ),
                ),
                paneController.isLoading.value
                    ? Positioned(
                        top: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.height * 0.4
                            : MediaQuery.of(context).size.height * 0.2,
                        left: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width * 0.24
                            : MediaQuery.of(context).size.height * 0.20,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
