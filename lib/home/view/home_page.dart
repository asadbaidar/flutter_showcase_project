part of 'view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BookDataClient>(
          create: (context) => BookLocalClient(),
        ),
        RepositoryProvider<BookRepository>(
          create: (context) => BookRepositoryImpl(
            client: context.read<BookDataClient>(),
          ),
        ),
      ],
      child: BlocProvider(
        create: (context) => BookCubit(
          bookRepository: context.read<BookRepository>(),
        ),
        child: const HomeView(),
      ),
    );
  }
}
