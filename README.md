# Relatório JUnit

Esta aplicação converte os resultados dos testes Dart em relatórios XML no formato JUnit. Esses relatórios XML podem ser usados por outras ferramentas, como o GitHub Actions CI.

## Uso

Para gerar um relatório XML JUnit a partir dos resultados dos testes Dart, siga os seguintes passos:

1. Execute os testes Dart com o reporter JSON e salve a saída:
    ```sh
    dart test simple_test.dart --reporter json > exemplo.jsonl
    ```

2. Converta os resultados do teste JSON para o formato XML JUnit:
    ```sh
    dart pub global run flutter_junit:generate --input exemplo.jsonl --output TEST-relatorio.xml
    ```

### Exemplo

Dado o seguinte arquivo de teste Dart `simple_test.dart`:

```dart
import 'package:test/test.dart';

void main() {
  test('simple', () {
    expect(true, true);
  });
}

Executando os comandos acima, será gerado um arquivo 'TEST-report.xml' contendo:

```XML
<testsuites>
  <testsuite errors="0" failures="0" tests="1" skipped="0" name="simple" timestamp="2016-05-22T21:20:08">
    <properties>
      <property name="platform" value="vm" />
    </properties>
    <testcase classname="simple" name="simple" time="0.026" />
  </testsuite>
</testsuites>
```

Para testes Flutter, utilize --machine ao invés de --reporter json:

## Installation

Adicione flutter_junit como uma dependência no seu arquivo pubspec.yaml:

```yml
dev_dependencies:
  flutter_junit:
    git:
      url: https://github.com/avenuesec/flutter_junit.git
      ref: dev
```
## Uso Simplificado

Após a instalação, você pode simplificar os comandos:

Para testes Dart:

```Shell
dart test simple_test.dart --reporter json | generate
```

Para executar todos os testes Flutter:

```Shell
flutter test --machine | generate
```
