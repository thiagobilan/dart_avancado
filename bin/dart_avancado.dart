import 'package:dart_avancado/repository/ibge_repository.dart';
import 'package:dart_avancado/repository/mysql_connection.dart';

void main(List<String> arguments) async {
  var estados = await IbgeRepository().getEstados();
  for (var estado in estados) {
    await MysqlConnection().inserirRegistroEstado(estado);
    print(estado.id);
    var distritos = await IbgeRepository().getDistrito(estado.id);

    for (var distrito in distritos) {
      distrito.idEstado = estado.id;
      await MysqlConnection().inserirRegistroDistrito(distrito);
    }
    ;
  }
}
