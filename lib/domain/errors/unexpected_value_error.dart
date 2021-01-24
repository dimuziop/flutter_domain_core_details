

import '../failures.dart';

class UnexpectedValueError extends Error {

  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const reason = 'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$reason Failure was: $valueFailure');
  }
}