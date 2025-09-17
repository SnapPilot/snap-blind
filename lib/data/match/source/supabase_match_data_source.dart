import 'package:injectable/injectable.dart';
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/core/network/call_adapter.dart';
import 'package:snap_blind/core/utils/typedef.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
final class SupabaseMatchDataSource {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<Result<List<Json>>> fetchTodayMatchPartner() async {
    return SupabaseCallAdapter<List<Json>>().adapt(() async {
      return await _supabase.rpc<List<Json>>('get_today_match');
    });
  }
}
