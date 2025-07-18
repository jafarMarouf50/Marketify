part of '../index.dart';

class SupabaseInitializer {
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: AppConstants.supabaseUrl!,
      anonKey: AppConstants.supabaseApiKey!,
    );
  }
}
