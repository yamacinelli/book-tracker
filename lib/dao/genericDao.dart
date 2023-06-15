abstract class GenericDao<T> {

  Future<T> save(T model);

  Future<T> update(T model);

  delete(T model);

  Future<List<T>> findAll();

  Future<T> findById(int id);
}