import 'package:floor/floor.dart';

import 'dao/person_dao.dart';
import 'model/person.dart';
part 'database.g.dart';
@Database(version: 1, entities: [Person])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
}