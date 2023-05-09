part of 'book_cubit.dart';

typedef BookDataState = DataState<BookList>;

class BookState extends Equatable {
  const BookState({
    this.bookDataState = const DataState(),
    this.search = '',
  });

  final BookDataState bookDataState;
  final String search;

  BookState copyWith({
    BookDataState? bookDataState,
    String? search,
  }) {
    return BookState(
      bookDataState: bookDataState ?? this.bookDataState,
      search: search ?? this.search,
    );
  }

  BookState withBookDataState(
    UpdateFromPrevious<BookDataState> update,
  ) {
    return copyWith(bookDataState: update(bookDataState));
  }

  @override
  List<Object> get props => [bookDataState, search];
}

extension BookStateValues on BookState {
  List<Book> get books => bookDataState.data?.books ?? [];

  List<Book> get oldBooks => bookDataState.data?.oldBooks ?? [];

  List<Book> get newBooks => bookDataState.data?.newBooks ?? [];

  List<Book> get searchedBooks {
    if (search.isEmpty) return [];
    return books
        .where((book) => book.searchBy.contains(search.toLowerCase()))
        .toList();
  }

  bool get isEmpty => books.isEmpty;

  bool get isFailure => bookDataState.isFailure;

  bool get isLoading => bookDataState.isLoading;

  String? get error => bookDataState.errorMessage;
}
