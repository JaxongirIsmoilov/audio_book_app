import 'package:bloc/bloc.dart';import 'package:meta/meta.dart';import '../../../../data/models/book_data.dart';import '../../../../domain/repository/app_repository.dart';import '../../../../domain/repository/impl/app_repository_impl.dart';part 'dashboard_event.dart';part 'dashboard_state.dart';class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {  final AppRepository _repository = AppRepositoryImpl();  DashboardBloc() : super(DashboardInitial()) {    on<BooksLoadEvent>((event, emit) async {      emit(BooksLoadingState());      try {        List<BookData> books = await _repository.getAllBooks();        emit(BooksLoadedState(books));      } catch (e) {        emit(BooksLoadFailureState(e.toString()));      }    });    on<BookImageLoadEvent>((event, emit) async {      emit(BooksLoadingState());      try {        String downloadUrl = await _repository.getDownloadURL(event.url);        emit(BookImageLoadedState(downloadUrl));      } catch (e) {        emit(BooksLoadFailureState(e.toString()));      }    });    on<BooksByCategoryEvent>((event, emit) async {      emit(BooksLoadingState());      try {        emit(BookByCategoryState(event.category));      } catch (e) {        emit(BooksLoadFailureState(e.toString()));      }    });    on<BookToPlayEvent>((event, emit) {      emit(BookToPlayState(event.id));    });  }}