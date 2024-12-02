import 'dart:developer';
import 'package:global_expert/export.dart';

late SupabaseClient supabase;
List<String> cities = [];
RxList<PropertyModel> properties = <PropertyModel>[].obs;

Future<void> supabaseInit() async {
  try {
    await Supabase.initialize(
        url: 'https://arzimhljgmajusycogos.supabase.co',
        anonKey:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFyemltaGxqZ21hanVzeWNvZ29zIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE2OTQ0NDQsImV4cCI6MjA0NzI3MDQ0NH0.R8AM7_b8mAensga79PxwHnWoZwz5YfbcLFG-HOzdHfU');
    supabase = Supabase.instance.client;
    log(supabase.toString());
    log('supabase initialized');
  } catch (e) {
    Get.snackbar(
      'Error',
      'Failed to initialize Supabase: $e',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
