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
    };

    Response response = await dio.post(
      url,
      data: json.encode(data),
      options: Options(
        headers: {
          //Paste API KEY here
          'Authorization': 'Bearer YOUR API_KEY',
        },
      ),
    );
    return response;
  } on DioError catch (e) {
    return e.response;
  }
}
