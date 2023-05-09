import 'package:tapped_test_project/common/utils/utils.dart';
import 'package:tapped_test_project/home/home.dart';

export 'entities/entities.dart';

part 'book_local_data.dart';

abstract class BookDataClient {
  Future<List<BookEntity>> getBooks();
}
