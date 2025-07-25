import 'dart:convert';

import 'package:shared/shared.dart';

import '../../models/response/session_model.dart';

const String _kSession = 'session';

class AuthLocal {
  late final ILocalStorage _localStorage;

  AuthLocal(this._localStorage);

  AsyncResult<SessionModel> saveSession(SessionModel session) async {
    try {
      _localStorage.setString(_kSession, jsonEncode(session.toJson()));
      return Success(session);
    } catch (e) {
      return Failure(Exception('Failed to save session'));
    }
  }

  AsyncResult<SessionModel> getSession() async {
    try {
      final rawSession = await _localStorage.getString(_kSession);

      if (rawSession == null || rawSession.isEmpty) {
        return Failure(Exception('No session found'));
      }

      final sessionJson = jsonDecode(rawSession);
      final session = SessionModel.fromJson(sessionJson);
      return Success(session);
    } catch (e) {
      return Failure(Exception('Failed to retrieve session: $e'));
    }
  }

  AsyncResult<String> getAccessToken() async {
    try {
      final rawSession = await _localStorage.getString(_kSession);

      if (rawSession == null || rawSession.isEmpty) {
        return Failure(Exception('No access token found'));
      }

      final sessionJson = jsonDecode(rawSession);
      final session = SessionModel.fromJson(sessionJson);
      return Success(session.accessToken);
    } catch (e) {
      return Failure(Exception('Failed to retrieve access token: $e'));
    }
  }

  AsyncResult<Unit> clear() async {
    try {
      await _localStorage.setString(_kSession, '');
      return Success(unit);
    } catch (e) {
      return Failure(Exception('Failed to clear session: $e'));
    }
  }
}
