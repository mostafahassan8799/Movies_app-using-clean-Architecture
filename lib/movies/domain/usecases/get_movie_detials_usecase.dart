import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/core/error/failure.dart';
import 'package:movie_app_clean_architecture/core/usecase/base_usecase.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie_details.dart';

class GetMovieDetialsUsecase extends BaseUseCase<MovieDetail> {
  @override
  Future<Either<Failure, MovieDetail>> call() {
    throw UnimplementedError();
  }
}
