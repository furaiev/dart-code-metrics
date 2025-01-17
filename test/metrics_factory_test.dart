@TestOn('vm')
import 'package:dart_code_metrics/src/metrics/maximum_nesting_level/maximum_nesting_level_metric.dart';
import 'package:dart_code_metrics/src/metrics_factory.dart';
import 'package:dart_code_metrics/src/models/entity_type.dart';
import 'package:test/test.dart';

void main() {
  group('MetricsFactory', () {
    test('metrics constructs all metrics initialized by passed config', () {
      expect(metrics(config: {}), isNotEmpty);
      expect(
        metrics(config: {})
            .where((metric) => metric.id == MaximumNestingLevelMetric.metricId)
            .single
            .threshold,
        equals(5),
      );
      expect(
        metrics(config: {MaximumNestingLevelMetric.metricId: '10'})
            .where((metric) => metric.id == MaximumNestingLevelMetric.metricId)
            .single
            .threshold,
        equals(10),
      );
    });

    test('metrics constructs only required type of metrics', () {
      final classMetrics =
          metrics(config: {}, measuredType: EntityType.classEntity);

      final methodMetrics =
          metrics(config: {}, measuredType: EntityType.methodEntity);

      expect(classMetrics, isNotEmpty);
      expect(methodMetrics, isNotEmpty);

      expect(classMetrics, isNot(equals(methodMetrics)));
    });
  });
}
