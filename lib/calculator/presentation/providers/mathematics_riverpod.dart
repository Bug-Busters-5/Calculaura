import 'dart:math' as math;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalculatorState {
  final String expression;
  final String result;

  CalculatorState({
    this.expression = '',
    this.result = '',
  });

  CalculatorState copyWith({
    String? expression,
    String? result,
  }) {
    return CalculatorState(
      expression: expression ?? this.expression,
      result: result ?? this.result,
    );
  }
}

class CalculatorNotifier extends StateNotifier<CalculatorState> {
  CalculatorNotifier() : super(CalculatorState());

  void appendValue(String value) {
    final newExpression = state.expression + value;

    state = state.copyWith(expression: newExpression);
  }

  void clearAll() {
    state = CalculatorState();
  }

  void clearLast() {
    if (state.expression.isNotEmpty) {
      final newExpression =
          state.expression.substring(0, state.expression.length - 1);
      state = state.copyWith(expression: newExpression);
    }
  }

  void calculateResult() {
    final result = _evaluate(state.expression);
    print('here here $result');
    state = state.copyWith(result: result.toString());
  }

  void calculateE() {
    final result = math.e.toString();
    state = state.copyWith(result: result);
  }

  void calculateMicro() {
    final value = double.tryParse(state.expression) ?? 0;
    final result = (value * math.pow(10, -6)).toString();
    state = state.copyWith(result: result);
  }

  void calculateSin() {
    final value = double.tryParse(state.expression) ?? 0;
    final result = math.sin(value).toString();
    state = state.copyWith(result: result);
  }

  void convertDeg() {
    final value = double.tryParse(state.expression) ?? 0;
    final radians = (value * math.pi / 180).toString();
    state = state.copyWith(result: radians);
  }

  double _evaluate(String expression) {
    try {
      final parts = expression.split(' ');
      print('here here $parts');
      print('here here parts length ${parts.length}');
      if (parts.length > 3) {
        double result = 0.0;
        double number2 = 0;
        String op = '';
        for (String v in parts) {
          if (['-', '+', 'x', '÷'].contains(v)) {
            op = v;
          } else {
            if (op == '') {
              result = double.parse(v);
            } else {
              number2 = double.parse(v);
              switch (op) {
                case '+':
                  result = result + number2;
                case '-':
                  result = result - number2;
                case 'x':
                  result = result * number2;
                case '÷':
                  result = result / number2;
                default:
                  result = 0.0;
              }
            }
          }
        }
        return result;
      }
      final num1 = double.parse(parts[0]);
      final op = parts[1];
      final num2 = double.parse(parts[2]);
      switch (op) {
        case '+':
          return num1 + num2;
        case '-':
          return num1 - num2;
        case 'x':
          return num1 * num2;
        case '÷':
          return num1 / num2;
        default:
          return 0.0;
      }
    } catch (e) {
      return 0.0;
    }
  }
}

final calculatorProvider =
    StateNotifierProvider<CalculatorNotifier, CalculatorState>((ref) {
  return CalculatorNotifier();
});
