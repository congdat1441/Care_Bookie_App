
import 'dart:math';
import 'package:crypto/crypto.dart';

String generateRandomString() {
  var random = Random.secure();
  const chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  var bytes = List.generate(20, (_) => random.nextInt(256));
  var digest = sha256.convert(bytes);
  return digest.toString().substring(0, 20);
}