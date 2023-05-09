import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tapped_test_project/common/utils/utils.dart';
import 'package:tapped_test_project/home/home.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit({required this.bookRepository}) : super(const BookState()) {
    getBooks();
  }

  final BookRepository bookRepository;

  Future<void> getBooks() async {
    emit(
      state.withBookDataState((previous) => previous.toLoading()),
    );
    try {
      final data = await bookRepository.getBooks();
      emit(
        state.withBookDataState((previous) => previous.toLoaded(data: data)),
      );
    } catch (error) {
      emit(
        state.withBookDataState((previous) => previous.toFailure(error: error)),
      );
    }
  }

  void searchBooks(String query) {
    emit(
      state.copyWith(search: query),
    );
  }
}
