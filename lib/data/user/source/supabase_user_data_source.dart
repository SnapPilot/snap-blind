import 'package:injectable/injectable.dart';
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/core/network/call_adapter.dart';
import 'package:snap_blind/core/utils/typedef.dart';
import 'package:snap_blind/data/user/dto/user_profile_update_req_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
final class SupabaseUserDataSource {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<Result<List<Json>>> fetchUserProfile() async {
    return SupabaseCallAdapter<List<Json>>().adapt(() async {
      return await _supabase.rpc<List<Json>>('get_my_profile');
    });
  }

  Future<Result<Json>> updateUserProfile(UserProfileUpdateReqDto dto) async {
    final Map<String, dynamic> params = {};

    if (dto.nickName != null) params['nickname'] = dto.nickName;
    if (dto.intro != null) params['intro'] = dto.intro;
    if (dto.gender != null) params['gender'] = dto.gender;
    if (dto.photoUrl != null) params['photo_url'] = dto.photoUrl;
    if (dto.birthDate != null) {
      params['birth_date'] = dto.birthDate!.toIso8601String();
    }

    return SupabaseCallAdapter<Json>().adapt(() async {
      return await _supabase
          .from('profiles')
          .update(params)
          .eq('user_id', dto.uid)
          .select()
          .single();
    });
  }
}
