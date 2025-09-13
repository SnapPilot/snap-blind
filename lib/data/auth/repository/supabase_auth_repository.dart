import 'package:injectable/injectable.dart';
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/core/network/call_adapter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
final class SupabaseAuthRepository {
  final GoTrueClient _supabase = Supabase.instance.client.auth;

  Future<Result<AuthResponse>> login({
    required String idToken,
    required String accessToken,
  }) async {
    return SupabaseCallAdapter<AuthResponse>().adapt(
      () async => await _supabase.signInWithIdToken(
        provider: OAuthProvider.kakao,
        accessToken: accessToken,
        idToken: idToken,
      ),
    );
  }

  Future<Result<AuthResponse>> loginWithEmail({
    required String email,
    required String password,
  }) async {
    return SupabaseCallAdapter<AuthResponse>().adapt(
      () async =>
          await _supabase.signInWithPassword(email: email, password: password),
    );
  }
}
