class NotAuthenticatedError extends Error {
  @override
  String toString() {
    const reason = 'User is not logged in';
    return Error.safeToString(reason);
  }
}
