import 'package:dartz/dartz.dart';


abstract class UseCase<Type> {
  Future<Either<Exception, List<Type>>>? call();
}
