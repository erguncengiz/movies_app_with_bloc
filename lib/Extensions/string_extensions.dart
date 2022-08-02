import 'package:my_app/Resources/constants.dart';

// ignore: camel_case_extensions
extension xEndPoint on String {
  String addEndPoint() {
    return Constants.api.baseUrl + this;
  }

  String addImageEndPoint() {
    return Constants.api.imageBaseUrl + this;
  }
}
