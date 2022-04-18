import 'package:flutter/material.dart';

const Color editorBackgroundColor = Colors.black54;

const Color buttonBgColor = Colors.black12;

var newTheme = {
  'root': TextStyle(
      color: const Color.fromARGB(255, 255, 255, 255),
      backgroundColor: editorBackgroundColor.withOpacity(0.0)),
  'comment':
      const TextStyle(color: Color(0xff999988), fontStyle: FontStyle.italic),
  'quote':
      const TextStyle(color: Color(0xff999988), fontStyle: FontStyle.italic),
  'keyword': const TextStyle(
      color: Color.fromARGB(255, 255, 65, 65), fontWeight: FontWeight.bold),
  'selector-tag':
      const TextStyle(color: Color(0xff333333), fontWeight: FontWeight.bold),
  'subst':
      const TextStyle(color: Color(0xff333333), fontWeight: FontWeight.normal),
  'number': const TextStyle(color: Color(0xff008080)),
  'literal': const TextStyle(color: Color(0xff008080)),
  'variable': const TextStyle(color: Color(0xff008080)),
  'template-variable': const TextStyle(color: Color(0xff008080)),
  'string': const TextStyle(color: Color(0xffdd1144)),
  'doctag': const TextStyle(color: Color(0xffdd1144)),
  'title':
      const TextStyle(color: Color(0xff990000), fontWeight: FontWeight.bold),
  'section':
      const TextStyle(color: Color(0xff990000), fontWeight: FontWeight.bold),
  'selector-id':
      const TextStyle(color: Color(0xff990000), fontWeight: FontWeight.bold),
  'type':
      const TextStyle(color: Color(0xff445588), fontWeight: FontWeight.bold),
  'tag':
      const TextStyle(color: Color(0xff000080), fontWeight: FontWeight.normal),
  'name':
      const TextStyle(color: Color(0xff000080), fontWeight: FontWeight.normal),
  'attribute':
      const TextStyle(color: Color(0xff000080), fontWeight: FontWeight.normal),
  'regexp': const TextStyle(color: Color(0xff009926)),
  'link': const TextStyle(color: Color(0xff009926)),
  'symbol': const TextStyle(color: Color(0xff990073)),
  'bullet': const TextStyle(color: Color(0xff990073)),
  'built_in': const TextStyle(color: Color(0xff0086b3)),
  'builtin-name': const TextStyle(color: Color(0xff0086b3)),
  'meta':
      const TextStyle(color: Color(0xff999999), fontWeight: FontWeight.bold),
  'deletion': const TextStyle(backgroundColor: Color(0xffffdddd)),
  'addition': const TextStyle(backgroundColor: Color(0xffddffdd)),
  'emphasis': const TextStyle(fontStyle: FontStyle.italic),
  'strong': const TextStyle(fontWeight: FontWeight.bold),
};
