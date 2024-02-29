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
    double result;
    if (state.expression.contains('sin')) {
      final val = state.expression.split('(');
      calculateSin(double.parse(val[1]));
      // convertDeg(double.parse(val[1]));
    }
    result = _evaluate(state.expression);
    state = state.copyWith(result: result.toString());
  }

  void calculateE() {
    final result = math.e.toString();
    state = state.copyWith(result: result);
  }

  void calculateMicro() {
    final value = double.tryParse(state.expression) ?? 0;
    final result = (value * math.pow(10, -6)).toString();
    state = state.copyWith(result: result.toString() , expression: result.toString() );
  }

  void calculateSin(double value) {
    //  final value = double.tryParse(state.expression) ?? 0;
    final result = math.sin(value).toString();
    state = state.copyWith(result: result);
  }

  void convertDeg() {
    final value = double.tryParse(state.expression) ?? 0;
    final radians = (value * math.pi / 180).toString();
    state = state.copyWith(result: radians.toString() , expression: radians.toString());
  }

  double _evaluate(String expression) {
    List<String> tokens =
        expression.split(' ').where((token) => token.isNotEmpty).toList();
    if (state.result.isNotEmpty) {
      tokens.insert(0, state.result);
    }
    const precedence = {'+': 1, '-': 1, 'x': 2, '÷': 2};

    List<double> numberStack = [];
    List<String> operatorStack = [];

    void operate() {
      if (numberStack.length < 2) return;
      double number2 = numberStack.removeLast();
      double number1 = numberStack.removeLast();
      String operator = operatorStack.removeLast();

      double result;
      switch (operator) {
        case '+':
          result = number1 + number2;
          break;
        case '-':
          result = number1 - number2;
          break;
        case 'x':
          result = number1 * number2;
          break;
        case '÷':
          result = number1 / number2;
          break;
        default:
          throw Exception('Unsupported operator $operator');
      }
      numberStack.add(result);
    }

    for (var token in tokens) {
      if (token == 'e' || token == 'sin(') {
        continue;
      }
      double? number = double.tryParse(token);
      if (number != null) {
        numberStack.add(number);
      } else if (precedence.containsKey(token)) {
        while (operatorStack.isNotEmpty &&
            precedence[token]! <= precedence[operatorStack.last]!) {
          operate();
        }
        operatorStack.add(token);
      }
    }

    while (operatorStack.isNotEmpty) {
      operate();
    }

    return numberStack.isNotEmpty ? numberStack.last : 0.0;
  }
}

final calculatorProvider =
    StateNotifierProvider<CalculatorNotifier, CalculatorState>((ref) {
  return CalculatorNotifier();
});
