import 'package:todo_task/data/source/source.dart';

class Repository<T> implements DataSource {
  final DataSource<T> localDataSource;

  Repository(this.localDataSource);

  @override
  Future<T> createOrUpdate(data) {
    return localDataSource.createOrUpdate(data);
  }

  @override
  Future<void> delete(data) {
    return localDataSource.delete(data);
  }

  @override
  Future<void> deleteAll() {
    return localDataSource.deleteAll();
  }

  @override
  Future<void> deleteById(id) {
    return localDataSource.deleteById(id);
  }

  @override
  Future<T> findById(id) {
    return localDataSource.findById(id);
  }

  @override
  Future<List<T>> getAll({String searchKeyWord = ''}) {
    return localDataSource.getAll(searchKeyWord: searchKeyWord);
  }
}
