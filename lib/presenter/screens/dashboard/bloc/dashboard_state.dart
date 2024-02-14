part of 'dashboard_bloc.dart';@immutableabstract class DashboardState {}class DashboardInitial extends DashboardState {}class BooksLoadedState extends DashboardState {  final List<BookData> books;  BooksLoadedState(this.books);}class BooksLoadingState extends DashboardState {}class BooksLoadFailureState extends DashboardState {  final String msg;  BooksLoadFailureState(this.msg);}class BookImageLoadedState extends DashboardState {  final String url;  BookImageLoadedState(this.url);}class BookByCategoryState extends DashboardState {  final String category;  BookByCategoryState(this.category);}class BookToPlayState extends DashboardState {  final String id;  BookToPlayState(this.id);}