// ignore_for_file: prefer-trailing-comma
import 'anti_patterns/long_method.dart';
import 'anti_patterns/long_parameter_list.dart';
import 'anti_patterns/obsolete_pattern.dart';

final _implementedPatterns =
    <String, ObsoletePattern Function(Map<String, Object>)>{
  LongMethod.patternId: (config) => LongMethod(),
  LongParameterList.patternId: (config) => LongParameterList(),
};

Iterable<ObsoletePattern> get allPatterns =>
    _implementedPatterns.keys.map((id) => _implementedPatterns[id]!({}));

Iterable<ObsoletePattern> getPatternsById(Map<String, Object> patternsConfig) =>
    List.unmodifiable(_implementedPatterns.keys
        .where((id) => patternsConfig.keys.contains(id))
        .map<ObsoletePattern>((id) => _implementedPatterns[id]!(
            patternsConfig[id] as Map<String, Object>)));
