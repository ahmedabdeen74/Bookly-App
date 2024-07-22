import 'dart:math';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
class HomeReboImpl implements HomeRepo {
  ApiService apiService;
  HomeReboImpl(this.apiService);
  @override
  Future<Either<Failure,List<BookModel>>> fetchNewsetBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=newest');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) return left(ServerFailure.fromDioError(e));
    }
    return left(ServerFailure(errMessage: e.toString()));
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks()async {
   try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=subject:programming');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) return left(ServerFailure.fromDioError(e));
    }
    return left(ServerFailure(errMessage: e.toString()));
  }
  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=newest');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) return left(ServerFailure.fromDioError(e));
    }
    return left(ServerFailure(errMessage: e.toString()));
  }
}


