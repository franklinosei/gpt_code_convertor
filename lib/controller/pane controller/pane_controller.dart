import 'package:code_convertor/services/make_request.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class PaneController extends GetxController {
  var sourceCode = 'print("Hello World!")'.obs;
  var targetCode = ''.obs;
  var fromLang = 'Python'.obs;
  var toLang = 'Javascript'.obs;
  RxBool isLoading = false.obs;

  Future makePrediction() async {
    // print((fromLang.value + '-' + toLang.value));
    try {
      isLoading(true);
      var response = await getTranslation(
        sourceCode.value,
        fromLang.value,
        toLang.value,
      );
      // print(response);
      targetCode(response.data['choices'][0]['text']);
      isLoading(false);
    } on DioError catch (error) {
      targetCode(error.response!.data['error']);
      // print(error);
    }
  }
}
