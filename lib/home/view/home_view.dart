part of 'view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const _SearchField(),
      ),
      body: const _BookListView(),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return CustomSearchField<Book>(
      hintText: 'Search for something',
      onChanged: context.read<BookCubit>().searchBooks,
      options: () => context.read<BookCubit>().state.searchedBooks,
      optionViewBuilder: (_, __, i, option) => _SearchBookTile(option),
    );
  }
}

class _BookListView extends StatelessWidget {
  const _BookListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      buildWhen: (previous, current) =>
          previous.bookDataState != current.bookDataState,
      builder: (context, state) {
        if (state.isLoading) {
          return const CustomProgress();
        } else if (state.isEmpty || state.isFailure) {
          return CustomError(
            isFailure: state.isFailure,
            message: state.error,
            emptyMessage: 'No books available',
            onRetry: context.read<BookCubit>().getBooks,
          );
        }

        final newBooks = state.newBooks;
        return CustomListView(
          headerBuilder: (_) => _ContinueBookListView(state.oldBooks),
          section: const CustomSection(text: 'New'),
          itemCount: newBooks.length,
          itemBuilder: (_, index) => _NewBookTile(newBooks[index]),
        );
      },
    );
  }
}

class _ContinueBookListView extends StatelessWidget {
  const _ContinueBookListView(this.list);

  final List<Book> list;

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) return const SizedBox.shrink();

    return CustomHorizontalListView(
      section: const CustomSection(text: 'Continue'),
      itemCount: list.length,
      itemBuilder: (_, index) => _ContinueBookTile(list[index]),
    );
  }
}

class _ContinueBookTile extends StatelessWidget {
  const _ContinueBookTile(this.data);

  final Book data;

  @override
  Widget build(BuildContext context) {
    return BookGridTile(
      title: data.title,
      author: data.author,
      cover: data.cover,
      onTap: () => context.unfocus(),
    );
  }
}

class _NewBookTile extends StatelessWidget {
  const _NewBookTile(this.data);

  final Book data;

  @override
  Widget build(BuildContext context) {
    return BookListTile(
      title: data.title,
      author: data.author,
      date: data.date,
      leading: BookCover.large(
        image: data.cover,
      ),
      trailing: const CustomIconButton(
        icon: AssetIcon(AssetIcons.bell),
      ),
      onTap: () => context.unfocus(),
    );
  }
}

class _SearchBookTile extends StatelessWidget {
  const _SearchBookTile(this.data);

  final Book data;

  @override
  Widget build(BuildContext context) {
    return BookListTile(
      title: data.title,
      author: data.author,
      leading: BookCover.small(
        image: data.cover,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      leadingPadding: const EdgeInsetsDirectional.only(end: 20),
      onTap: () {
        // Not implemented
      },
    );
  }
}
