import 'package:dart_avancado/models/distrito_model.dart';
import 'package:dart_avancado/models/estado_model.dart';
import 'package:dio/dio.dart';

class IbgeRepository {
  Future<List<EstadoModel>> getEstados() async {
    var url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
    var dio = Dio();
    var response = await dio.get<List>(url);
    if (response.statusCode == 200) {
      return response.data.map((e) => EstadoModel.fromMap(e)).toList();
    } else {
      return null;
    }
  }

  Future<List<DistritoModel>> getDistrito(idEstado) async {
    var url =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$idEstado/distritos';
    var dio = Dio();
    var response = await dio.get<List>(url);
    if (response.statusCode == 200) {
      return response.data.map((e) => DistritoModel.fromMap(e)).toList();
    }
  }
}
