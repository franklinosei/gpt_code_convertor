import 'package:code_convertor/controller/pane%20controller/pane_controller.dart';
import 'package:code_convertor/utilities/constants.dart';
import 'package:code_convertor/utilities/responsive.dart';
import 'package:code_convertor/view/leftpane/left_pane.dart';
import 'package:code_convertor/view/rightpane/right_pane.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = [
    'Python',
    'Dart',
    'Javascript',
    'Ruby',
    'Go',
    'C',
    'C++',
    'C#',
  ];

  PaneController paneController = Get.put(PaneController());

  String? fromLang = 'Python';
  String? toLang = 'Javascript';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPT Code Convertor'),
        elevation: 10,
        backgroundColor: Colors.transparent,
        actions: Responsive.isDesktop(context)
            ? [
                Row(
                  children: [
                    const Text('From: '),
                    const SizedBox(
                      width: 5,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: const Text(
                          'Select Language',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: fromLang,
                        onChanged: (value) {
                          paneController.fromLang(value as String);
                          paneController.sourceCode('');
                          // paneController.targetCode('');
                          setState(() {
                            fromLang = value;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.grey,
                        buttonHeight: 30,
                        buttonWidth: 160,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        buttonElevation: 0,
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: buttonBgColor,
                        ),
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownWidth: 200,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black45,
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(-20, 0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                Row(
                  children: [
                    const Text('To: '),
                    const SizedBox(
                      width: 5,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: const Text(
                          'Select Language',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: toLang,
                        onChanged: (value) {
                          paneController.toLang(value as String);
                          // paneController.sourceCode('');
                          paneController.targetCode('');
                          setState(() {
                            toLang = value;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.grey,
                        buttonHeight: 30,
                        buttonWidth: 160,
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: buttonBgColor,
                        ),
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        buttonElevation: 0,
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownWidth: 200,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black45,
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(-20, 0),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                )
              ]
            : [],
      ),
      body: Responsive.isDesktop(context)
          ? Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: LeftPane(
                        fromLang: paneController.fromLang.value,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: RightPane(
                        toLang: paneController.toLang.value,
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    // right: 20,
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          const Text('From: '),
                          const SizedBox(
                            width: 5,
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: const Text(
                                'Select Language',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            // fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              value: fromLang,
                              onChanged: (value) {
                                paneController.fromLang(value as String);
                                paneController.sourceCode('');
                                // paneController.targetCode('');
                                setState(() {
                                  fromLang = value;
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_drop_down,
                              ),
                              iconSize: 14,
                              iconEnabledColor: Colors.white,
                              iconDisabledColor: Colors.grey,
                              buttonHeight: 30,
                              buttonWidth: 110,
                              buttonPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              buttonElevation: 0,
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: buttonBgColor,
                              ),
                              itemHeight: 40,
                              itemPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              dropdownMaxHeight: 200,
                              dropdownWidth: 200,
                              dropdownPadding: null,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black45,
                              ),
                              dropdownElevation: 8,
                              scrollbarRadius: const Radius.circular(40),
                              scrollbarThickness: 6,
                              scrollbarAlwaysShow: true,
                              offset: const Offset(-20, 0),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Row(
                        children: [
                          const Text('To: '),
                          const SizedBox(
                            width: 5,
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: const Text(
                                'Select Language',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            // fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              value: toLang,
                              onChanged: (value) {
                                paneController.toLang(value as String);
                                // paneController.sourceCode('');
                                paneController.targetCode('');
                                setState(() {
                                  toLang = value;
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_drop_down,
                              ),
                              iconSize: 14,
                              iconEnabledColor: Colors.white,
                              iconDisabledColor: Colors.grey,
                              buttonHeight: 30,
                              buttonWidth: 110,
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: buttonBgColor,
                              ),
                              buttonPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              buttonElevation: 0,
                              itemHeight: 40,
                              itemPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              dropdownMaxHeight: 200,
                              dropdownWidth: 200,
                              dropdownPadding: null,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black45,
                              ),
                              dropdownElevation: 8,
                              scrollbarRadius: const Radius.circular(40),
                              scrollbarThickness: 6,
                              scrollbarAlwaysShow: true,
                              offset: const Offset(-20, 0),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: LeftPane(
                    fromLang: paneController.fromLang.value,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RightPane(
                    toLang: paneController.toLang.value,
                  ),
                ),
              ],
            ),
    );
  }
}
