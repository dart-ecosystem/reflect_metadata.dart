import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:reflect_metadata/reflect_metadata.dart';

class LookupBenchMark extends BenchmarkBase {
  LookupBenchMark() : super("Loopup");

  static void main() {
    LookupBenchMark().report();
  }

  @override
  void setup() {
    for (int i = 0; i < 1000000; i++) {
      ReflectMetadata.defineMetadata(
        "metaKey${i % 10}",
        "metaValue${i}",
        LookupBenchMark,
        "propertyKey${i % 20}",
      );
    }
  }

  @override
  void teardown() {
    for (int i = 0; i < 1000000; i++) {
      ReflectMetadata.deleteMetadata(
        "metaKey${i % 10}",
        LookupBenchMark,
        "propertyKey${i % 20}",
      );
    }
  }

  @override
  void run() {
    for (int i = 0; i < 1000000; i++) {
      ReflectMetadata.getMetadata(
        "metaKey${i % 10}",
        LookupBenchMark,
        "propertyKey${i % 20}",
      );
    }
  }
}
