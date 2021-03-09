import 'package:mysql1/mysql1.dart';
import 'package:dart_avancado/models/estado_model.dart';
import 'package:dart_avancado/models/distrito_model.dart';

class MysqlConnection {
  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: 'root',
        db: 'desafio_dart');
    return await MySqlConnection.connect(settings);
  }

  Future<void> inserirRegistroEstado(EstadoModel estado) async {
    var connEstado = await getConnection();
    await connEstado.query('insert tb_estados(id, nome, sigla) values (?,?,?)',
        [estado.id, estado.nome, estado.sigla]);
    await connEstado.close();
  }

  Future<void> inserirRegistroDistrito(DistritoModel distrito) async {
    var conn = await getConnection();

    await conn.query('insert tb_distritos(id, nome, id_estado) values(?,?,?)',
        [distrito.id, distrito.nome, distrito.idEstado]);

    await conn.close();
  }
}
