import 'package:dart_code_metrics/src/models/context_message.dart';
import 'package:dart_code_metrics/src/models/entity_type.dart';
import 'package:dart_code_metrics/src/models/file_report.dart';
import 'package:dart_code_metrics/src/models/issue.dart';
import 'package:dart_code_metrics/src/models/metric_documentation.dart';
import 'package:dart_code_metrics/src/models/metric_value.dart';
import 'package:dart_code_metrics/src/models/metric_value_level.dart';
import 'package:dart_code_metrics/src/models/report.dart';
import 'package:dart_code_metrics/src/models/severity.dart';
import 'package:source_span/source_span.dart';

const src1Path = 'test/resources/abstract_class.dart';
const src2Path = 'test/resources/class_with_factory_constructors.dart';

final _class1Report = Report(
  location: SourceSpan(SourceLocation(0), SourceLocation(10), 'class body'),
  metrics: const [
    MetricValue<int>(
      metricsId: 'id',
      documentation: MetricDocumentation(
        name: 'metric1',
        shortName: 'MTR1',
        brief: '',
        measuredType: EntityType.classEntity,
        examples: [],
      ),
      value: 0,
      level: MetricValueLevel.none,
      comment: 'metric comment',
    ),
  ],
);

final _function1Report = Report(
  location:
      SourceSpan(SourceLocation(0), SourceLocation(16), 'constructor body'),
  metrics: const [
    MetricValue<int>(
      metricsId: 'id',
      documentation: MetricDocumentation(
        name: 'metric2',
        shortName: 'MTR2',
        brief: '',
        measuredType: EntityType.methodEntity,
        examples: [],
      ),
      value: 10,
      level: MetricValueLevel.alarm,
      comment: 'metric comment',
      recommendation: 'refactoring',
    ),
  ],
);

final _function2Report = Report(
  location: SourceSpan(SourceLocation(0), SourceLocation(11), 'method body'),
  metrics: [
    MetricValue<int>(
      metricsId: 'id2',
      documentation: const MetricDocumentation(
        name: 'metric3',
        shortName: 'MTR3',
        brief: '',
        measuredType: EntityType.methodEntity,
        examples: [],
      ),
      value: 1,
      level: MetricValueLevel.none,
      comment: 'metric comment',
      context: [
        ContextMessage(
          message: 'begin of method',
          location: SourceSpan(SourceLocation(0), SourceLocation(6), 'method'),
        ),
      ],
    ),
  ],
);

final _function3Report = Report(
  location:
      SourceSpan(SourceLocation(0), SourceLocation(20), 'simple function body'),
  metrics: const [
    MetricValue<int>(
      metricsId: 'id',
      documentation: MetricDocumentation(
        name: 'metric4',
        shortName: 'MTR4',
        brief: '',
        measuredType: EntityType.methodEntity,
        examples: [],
      ),
      value: 5,
      level: MetricValueLevel.warning,
      comment: 'metric comment',
    ),
  ],
);

final _issueReport = Issue(
  ruleId: 'id',
  documentation: Uri.parse('https://documentation.com'),
  location:
      SourceSpan(SourceLocation(0), SourceLocation(20), 'simple function body'),
  severity: Severity.warning,
  message: 'simple message',
  verboseMessage: 'verbose message',
);

final Iterable<FileReport> testReport = [
  FileReport(
    path: src1Path,
    relativePath: src1Path,
    classes: {'class': _class1Report},
    functions: {
      'class.constructor': _function1Report,
      'class.method': _function2Report,
    },
    issues: const [],
    antiPatternCases: const [],
  ),
  FileReport(
    path: src2Path,
    relativePath: src2Path,
    classes: const {},
    functions: {'function': _function3Report},
    issues: [_issueReport],
    antiPatternCases: const [],
  ),
];
