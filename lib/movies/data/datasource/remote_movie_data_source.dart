import 'package:dio/dio.dart';
import 'package:movie_app_clean_architecture/core/error/exception.dart';
import 'package:movie_app_clean_architecture/core/utils/app_constance.dart';
import 'package:movie_app_clean_architecture/movies/data/datasource/base_movie_remote_data_source.dart';
import 'package:movie_app_clean_architecture/movies/data/models/movie_detail_model.dart';
import 'package:movie_app_clean_architecture/movies/data/models/recommendation_model.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_movie_detials_usecase.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_recommendation_usecase.dart';

import '../../../core/network/error_message_model.dart';
import '../models/movie_model.dart';

class RemoteMovieDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await Dio().get(AppConstance.kNowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.formJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovie() async {
    final response = await Dio().get(AppConstance.kPopularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.formJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovie() async {
    final response = await Dio().get(AppConstance.kTopRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.formJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetials(
      MovieDetailParameters parameters) async {
    final response =
        await Dio().get(AppConstance.kMovieDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.formJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters) async {
    final response =
        await Dio().get(AppConstance.kRecommendationPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.formJson(response.data),
      );
    }
  }
}
