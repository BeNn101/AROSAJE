import 'package:mysql1/mysql1.dart';

class DatabaseHelper {
  final String host;
  final String dbName;
  final String username;
  final String password;

  late MySqlConnection _connection;

  DatabaseHelper({
    required this.host,
    required this.dbName,
    required this.username,
    required this.password,
  });

  Future<void> connect() async {
    _connection = await MySqlConnection.connect(ConnectionSettings(
      host: host,
      port: 3306,
      db: dbName,
      user: username,
      password: password,
    ));
  }

  Future<bool> loginUser(String email, String password) async {
    Results results = await _connection.query(
      'SELECT * FROM arosaje_db WHERE email = ? AND mot_de_passe = ?',
      [email, password],
    );

    return results.isNotEmpty;
  }

  Future<void> closeConnection() async {
    await _connection.close();
  }
}
