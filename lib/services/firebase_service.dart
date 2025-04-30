import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory/models/user.dart';
import 'package:inventory/models/material.dart';
import 'package:inventory/models/material_usage.dart';

class FirebaseService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // User operations
  Future<auth.UserCredential> signUp(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception('Error during signup: $e');
    }
  }

  Future<auth.UserCredential> signIn(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Error during logout: $e');
    }
  }

  Future<void> saveUserData(User user) async {
    try {
      await _firestore.collection('users').doc(user.id).set(user.toMap());
    } catch (e) {
      throw Exception('Error saving user data: $e');
    }
  }

  Future<User?> getUserData(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        return User.fromMap(doc.data()!);
      }
      return null;
    } catch (e) {
      throw Exception('Error getting user data: $e');
    }
  }

  // Material operations
  Future<void> addMaterial(Material material) async {
    try {
      await _firestore.collection('materials').doc(material.id).set(material.toMap());
    } catch (e) {
      throw Exception('Error adding material: $e');
    }
  }

  Future<List<Material>> getAllMaterials() async {
    try {
      final snapshot = await _firestore.collection('materials').get();
      return snapshot.docs.map((doc) => Material.fromMap(doc.data())).toList();
    } catch (e) {
      throw Exception('Error getting materials: $e');
    }
  }

  Future<Material?> getMaterialById(String id) async {
    try {
      final doc = await _firestore.collection('materials').doc(id).get();
      if (doc.exists) {
        return Material.fromMap(doc.data()!);
      }
      return null;
    } catch (e) {
      throw Exception('Error getting material: $e');
    }
  }

  Future<void> updateMaterial(Material material) async {
    try {
      await _firestore.collection('materials').doc(material.id).update(material.toMap());
    } catch (e) {
      throw Exception('Error updating material: $e');
    }
  }

  Future<void> deleteMaterial(String id) async {
    try {
      await _firestore.collection('materials').doc(id).delete();
    } catch (e) {
      throw Exception('Error deleting material: $e');
    }
  }

  // Material usage operations
  Future<void> addMaterialUsage(MaterialUsage usage) async {
    try {
      await _firestore.collection('material_usage').doc(usage.id).set(usage.toMap());
    } catch (e) {
      throw Exception('Error adding material usage: $e');
    }
  }

  Future<List<MaterialUsage>> getUnsyncedMaterialUsage() async {
    try {
      final snapshot = await _firestore
          .collection('material_usage')
          .where('synced', isEqualTo: false)
          .get();
      return snapshot.docs.map((doc) => MaterialUsage.fromMap(doc.data())).toList();
    } catch (e) {
      throw Exception('Error getting unsynced material usage: $e');
    }
  }

  Future<void> markMaterialUsageAsSynced(String id) async {
    try {
      await _firestore.collection('material_usage').doc(id).update({'synced': true});
    } catch (e) {
      throw Exception('Error marking material usage as synced: $e');
    }
  }

  // Streams for real-time updates
  Stream<List<Material>> getMaterialsStream() {
    return _firestore
        .collection('materials')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Material.fromMap(doc.data()))
            .toList());
  }

  Stream<List<MaterialUsage>> getMaterialUsageStream() {
    return _firestore
        .collection('material_usage')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => MaterialUsage.fromMap(doc.data()))
            .toList());
  }
} 