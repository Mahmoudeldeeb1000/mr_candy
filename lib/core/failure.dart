abstract class Failure{
   final String errorMassege;

  Failure({required this.errorMassege});
}
class ApiFailure extends Failure{
  ApiFailure({required super.errorMassege});
}
class NoInternetFailure extends Failure{
  NoInternetFailure({required super.errorMassege});
}