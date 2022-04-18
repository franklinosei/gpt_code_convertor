import 'dart:convert';

import 'package:dio/dio.dart';

var dio = Dio();

String getUrl(String engineId) {
  String url = 'https://api.openai.com/v1/engines/$engineId/completions';

  return url;
}

Future getTranslation(String code, String fromLang, String toLang) async {
  try {
    String url = getUrl("text-davinci-002");
    dynamic data = {
      "prompt": "#$fromLang to $toLang\n$fromLang$code",

      "temperature": 0.01,
      "max_tokens": 1000,
      "top_p": 1,
      "frequency_penalty": 0,
      "presence_penalty": 0,

      // "prompt":
      //     "Convert from Python to Javascript\nPython: def handle_request():\n                     name = \"Hello\"\n                     class = \"first\"\n                      return name + class\nJavaScript:\n\nfunction handle_request() {\n name = \"Hello\"\n class = \"first\"\n return name + class;\n }",
      // "temperature": 0.28,
      // "max_tokens": 256,
      // "top_p": 1,
      // "frequency_penalty": 0,
      // "presence_penalty": 0
    };

    // FormData formData = FormData.fromMap(data);

    Response response = await dio.post(
      url,
      data: json.encode(data),
      options: Options(
        headers: {
          'Authorization':
              'Bearer YOUR API_KEY',
          // 'Content-Type': 'application/json',
        },
      ),
    );
    return response;
  } on DioError catch (e) {
    return e.response;
  }
}
