import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import '../services/firebase_service.dart';
import '../utils/logger.dart';

// Firebase initialization provider
final initializeFirebaseProvider = FutureProvider.autoDispose<void>((ref) async {
  try {
    // Check if Firebase is already initialized
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
      AppLogger.info('✅ Firebase initialized in provider');
    } else {
      AppLogger.info('✅ Firebase already initialized');
    }
    
    // Initialize Firebase messaging service
    final firebaseService = ref.watch(firebaseServiceProvider);
    await firebaseService.initialize();
    
  } catch (e) {
    AppLogger.error('❌ Firebase initialization failed', e);
    // Don't throw - app should work without notifications
  }
});