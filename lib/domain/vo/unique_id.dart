import 'package:dartz/dartz.dart';
import 'package:domain_core_details/domain/vo/value_objects.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../failures.dart';

@immutable
class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(
        right(Uuid().v1())
    );
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    assert(uniqueId != null);
    return UniqueId._(
      right(uniqueId)
    );
  }

  const UniqueId._(this.value);
}
