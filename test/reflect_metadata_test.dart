import 'package:reflect_metadata/reflect_metadata.dart';
import 'package:test/test.dart';

class A {
  b() {}
}

class A2 extends A {}

void main() {
  group('ReflectMetadata Test', () {
    test('defineMetadata()', () {
      ReflectMetadata.defineMetadata("test_key1", "test_value1", A2);
      ReflectMetadata.defineMetadata("test_key2", "test_value2", A2, "b");
    });

    test('hasMetadata()', () {
      expect(ReflectMetadata.hasMetadata("test_key1", A2), true);
      expect(ReflectMetadata.hasMetadata("test_key2", A2, "b"), true);
    });

    test('getMetadata()', () {
      expect(ReflectMetadata.getMetadata("test_key1", A2), "test_value1");
      expect(ReflectMetadata.getMetadata("test_key2", A2, "b"), "test_value2");
    });

    test('getOwnMetadata()', () {
      expect(ReflectMetadata.getOwnMetadata("test_key1", A2), "test_value1");
      expect(
          ReflectMetadata.getOwnMetadata("test_key2", A2, "b"), "test_value2");
    });

    test('getMetadataKeys()', () {});

    test('getOwnMetadataKeys()', () {
      expect(ReflectMetadata.getOwnMetadataKeys(A2), [
        "test_key1",
      ]);
      expect(ReflectMetadata.getOwnMetadataKeys(A2, "b"), [
        "test_key2",
      ]);
    });

    test('deleteMetadata()', () {
      ReflectMetadata.deleteMetadata("test_key1", A2);
      ReflectMetadata.deleteMetadata("test_key2", A2, "b");
      expect(ReflectMetadata.hasMetadata("test_key1", A2), false);
      expect(ReflectMetadata.hasMetadata("test_key2", A2, "b"), false);
      expect(ReflectMetadata.getOwnMetadata("test_key1", A2), null);
      expect(ReflectMetadata.getOwnMetadata("test_key2", A2, "b"), null);
    });
  });
}
