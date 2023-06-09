import 'package:movie_app_clean_architecture/movies/data/models/movie_detail_model.dart';
import 'package:movie_app_clean_architecture/movies/data/models/recommendation_model.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_movie_detials_usecase.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_recommendation_usecase.dart';

import '../models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();
  Future<List<MovieModel>> getPopularMovie();
  Future<List<MovieModel>> getTopRatedMovie();
  Future<MovieDetailModel> getMovieDetials(MovieDetailParameters parameters);
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters);
}
