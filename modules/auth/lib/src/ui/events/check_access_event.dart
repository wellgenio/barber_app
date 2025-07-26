import 'dart:async';

final class CheckAccessEvent {
  final String userId;
  final String resource;
  final Future<void> Function(bool) onCheckAccess;

  CheckAccessEvent({
    required this.userId,
    required this.resource,
    required this.onCheckAccess,
  });
}
