import 'package:testreport/testreport.dart';
import 'package:flutter_junit/src/impl/report.dart';

abstract class JUnitReport {
  factory JUnitReport({String base = '', String package = ''}) =>
      XmlReport(base, package);

  String toXml(Report report);
}
