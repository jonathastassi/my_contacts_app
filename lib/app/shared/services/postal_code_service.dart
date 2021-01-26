import 'package:dio/dio.dart';
import 'package:my_contacts_app/app/shared/models/postal_code_model.dart';

class PostalCodeService {
  final Dio dio;

  PostalCodeService(this.dio);

  Future<PostalCodeModel> find(String postalCode) async {
    var response = await this.dio.get(
        "https://viacep.com.br/ws/${postalCode.replaceAll("-", "")}/json/");

    return PostalCodeModel.fromJson(response.data);
  }
}
