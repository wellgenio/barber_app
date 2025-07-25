import 'dart:async';

final class CheckAccessEvent {
  final String userId;
  final Future<void> Function(bool) onCheckAccess;

  CheckAccessEvent({required this.userId, required this.onCheckAccess});
}
