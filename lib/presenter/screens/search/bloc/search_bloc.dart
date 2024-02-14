import 'package:bloc/bloc.dart';import 'package:meta/meta.dart';import '../../../../data/models/book_data.dart';import '../../../../domain/repository/app_repository.dart';import '../../../../domain/repository/impl/app_repository_impl.dart';part 'search_event.dart';part 'search_state.dart';class SearchBloc extends Bloc<SearchEvent, SearchState> {  final AppRepository _repository = AppRepositoryImpl();  SearchBloc() : super(SearchInitial()) {    on<BookSearchByTitleEvent>((event, emit) async {      try {        List<BookData> books = await _repository.searchBooksByName(event.title);        emit(BookSearchByTitleState(books));      } catch (e) {        print(e.toString());      }    });    on<BookToPlayEvent>((event, emit) {      emit(BookToPlayState(event.id));    });  }}