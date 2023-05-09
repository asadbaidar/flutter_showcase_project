part of 'repository.dart';

class BookRepositoryImpl implements BookRepository {
  BookRepositoryImpl({
    required this.client,
  });

  final BookDataClient client;

  @override
  Future<BookList> getBooks() async {
    return client.getBooks().then(BookList.fromEntities);
  }
}
