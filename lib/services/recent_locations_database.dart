import 'package:sky_view/models/recent_location.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String fileName = 'recent_locations_database.db';

const String idType = 'TEXT PRIMARY KEY';

class RecentLocationsDatabase {
  static final RecentLocationsDatabase instance = RecentLocationsDatabase._init();

  static Database? _database;

  RecentLocationsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB(fileName);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        $cityField $idType
        )
      ''');
  }

  Future<void> close() async {
    final Database db = await instance.database;
    db.close();
  }

  Future<RecentLocation> create(RecentLocation recentLocation) async {
    final Database db = await instance.database;

    await db.insert(tableName, recentLocation.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);

    return recentLocation;
  }

  Future<List<RecentLocation>> readAllRecentLocations() async {
    final Database db = await instance.database;

    final listRecentLocationsmap = await db.query(tableName);

    if (listRecentLocationsmap.isNotEmpty) {
      return listRecentLocationsmap.map((map) => RecentLocation.fromMap(map)).toList();
    } else {
      return [];
    }
  }

  Future<RecentLocation> delete(RecentLocation recentLocation) async {
    final Database db = await instance.database;

    await db.delete(
      tableName,
      where: '$cityField = ?',
      whereArgs: [recentLocation.city],
    );

    return recentLocation;
  }
}
