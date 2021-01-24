import 'package:dartz/dartz.dart';
import 'package:domain_core_details/domain/errors/unexpected_value_error.dart';
import 'package:meta/meta.dart';

import '../failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  bool isValid() => value.isRight();

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id is identity function = (r) => r
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
