import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/firebase_service.dart';
import '../utils/logger.dart';

// Firebase initialization provider
final initializeFirebaseProvider = FutureProvider<void>((ref) async {
  final firebaseService = ref.watch(firebaseServiceProvider);
  
  try {
    await firebaseService.initialize();
    AppLogger.info('✅ Firebase initialized successfully');
  } catch (e) {
    AppLogger.error('❌ Firebase initialization failed', e);
    // Don't throw - app should work without notifications
  }
});
