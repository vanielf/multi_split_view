import 'package:flutter_test/flutter_test.dart';
import 'package:multi_split_view/src/internal/layout_constraints.dart';

void main() {
  group('LayoutConstraints', () {
    group('Constructor', () {
      test('negative childrenCount', () {
        expect(() {
          LayoutConstraints(
              childrenCount: -1, containerSize: 100, dividerThickness: 5);
        },
            throwsA(isA<ArgumentError>()
                .having((e) => e.name, '', 'childrenCount')));
      });
      test('negative dividerThickness', () {
        expect(() {
          LayoutConstraints(
              childrenCount: 0, containerSize: 100, dividerThickness: -5);
        },
            throwsA(isA<ArgumentError>()
                .having((e) => e.name, '', 'dividerThickness')));
      });
      test('negative containerSize', () {
        expect(() {
          LayoutConstraints(
              childrenCount: 1, containerSize: -10, dividerThickness: 5);
        },
            throwsA(isA<ArgumentError>()
                .having((e) => e.name, '', 'containerSize')));
      });
      test('totalDividerSize', () {
        expect(
            LayoutConstraints(
                    childrenCount: 0, containerSize: 100, dividerThickness: 5)
                .totalDividerSize,
            0);
        expect(
            LayoutConstraints(
                    childrenCount: 1, containerSize: 100, dividerThickness: 5)
                .totalDividerSize,
            0);
        expect(
            LayoutConstraints(
                    childrenCount: 2, containerSize: 100, dividerThickness: 5)
                .totalDividerSize,
            5);
        expect(
            LayoutConstraints(
                    childrenCount: 3, containerSize: 100, dividerThickness: 5)
                .totalDividerSize,
            10);
        expect(
            LayoutConstraints(
                    childrenCount: 10, containerSize: 100, dividerThickness: 0)
                .totalDividerSize,
            0);
      });
      test('availableSpace', () {
        expect(
            LayoutConstraints(
                    childrenCount: 0, containerSize: 100, dividerThickness: 5)
                .availableSpace,
            100);
        expect(
            LayoutConstraints(
                    childrenCount: 1, containerSize: 100, dividerThickness: 5)
                .availableSpace,
            100);
        expect(
            LayoutConstraints(
                    childrenCount: 2, containerSize: 100, dividerThickness: 5)
                .availableSpace,
            95);
        expect(
            LayoutConstraints(
                    childrenCount: 3, containerSize: 100, dividerThickness: 5)
                .availableSpace,
            90);
        expect(
            LayoutConstraints(
                    childrenCount: 10, containerSize: 100, dividerThickness: 0)
                .availableSpace,
            100);
        expect(
            LayoutConstraints(
                    childrenCount: 2, containerSize: 100, dividerThickness: 100)
                .availableSpace,
            0);
        expect(
            LayoutConstraints(
                    childrenCount: 2, containerSize: 100, dividerThickness: 200)
                .availableSpace,
            0);
      });
    });
  });
}
