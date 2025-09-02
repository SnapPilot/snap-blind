import 'package:injectable/injectable.dart';
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/core/network/call_adapter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
final class SupabaseAuthRepository {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<Result<AuthResponse>> login({
    required String idToken,
    required String accessToken,
  }) async {
    return SupabaseCallAdapter<AuthResponse>().adapt(
      () async => await Supabase.instance.client.auth.signInWithIdToken(
        provider: OAuthProvider.kakao,
        accessToken: accessToken,
        idToken: idToken,
      ),
    );
  }
}
