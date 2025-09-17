import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() => Dio();

  @lazySingleton
  SupabaseClient supabaseClient() => Supabase.instance.client;
}
