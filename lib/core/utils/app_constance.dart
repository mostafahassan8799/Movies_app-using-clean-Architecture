class AppConstance {
  static const kBaseUrl = 'https://api.themoviedb.org/3';
  static const kApiKey = '06daef9c493325ac5b03726f450aeb00';

  static const kNowPlayingMoviesPath =
      '$kBaseUrl/movie/now_playing?api_key=$kApiKey';
  static const kPopularMoviesPath = '$kBaseUrl/movie/popular?api_key=$kApiKey';
  static const kTopRatedMoviesPath =
      '$kBaseUrl/movie/top_rated?api_key=$kApiKey';
  static String kMovieDetailsPath(int movieId) =>
      '$kBaseUrl/movie/$movieId?api_key=$kApiKey';
  static String kRecommendationPath(int movieId) =>
      '$kBaseUrl/movie/$movieId/recommendations?api_key=$kApiKey';
  static const baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl$path';
}
