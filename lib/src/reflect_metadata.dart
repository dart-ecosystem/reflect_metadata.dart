import 'package:reflect_metadata/src/reflect_metadata_lookup.dart';

abstract class ReflectMetadata {
  static ReflectMetadataLookup _lookup = ReflectMetadataLookup();

  static void defineMetadata(
    String metadataKey,
    Object metadataValue,
    Object target, [
    String propertyKey,
  ]) {
    _lookup.set(target, propertyKey, metadataKey, metadataValue);
  }

  static bool hasMetadata(
    String metadataKey,
    Object target, [
    String propertyKey,
  ]) {
    return _lookup.has(target, propertyKey, metadataKey);
  }

  static Object getMetadata(
    String metadataKey,
    Object target, [
    String propertyKey,
  ]) {
    // IMPORTANT: NO PARENT SUPPORT
    return getOwnMetadata(metadataKey, target, propertyKey);
  }

  static Object getOwnMetadata(
    String metadataKey,
    Object target, [
    String propertyKey,
  ]) {
    return _lookup.get(target, propertyKey, metadataKey);
  }

  static List<Object> getMetadataKeys(
    Object target, [
    String propertyKey,
  ]) {
    // IMPORTANT: NO PARENT SUPPORT
    return getOwnMetadataKeys(target, propertyKey);
  }

  static List<Object> getOwnMetadataKeys(
    Object target, [
    String propertyKey,
  ]) {
    return _lookup.getKeys(target, propertyKey);
  }

  static bool deleteMetadata(
    String metadataKey,
    Object target, [
    String propertyKey,
  ]) {
    return _lookup.delete(target, propertyKey, metadataKey);
  }
}
