import 'package:progresswebtu/utility/serviceStore/search_algorithm.dart';

class BinarySearchComparator<S, T> extends Comparator<S, T> {
  final bool Function(S, T) isGreaterThan;
  final bool Function(S, T) isLessThan;

  BinarySearchComparator(
      {required this.isGreaterThan, required this.isLessThan});
}

class BinarySearchAlgorithm<E, T>
    extends SearchAlgorithm<E,T,BinarySearchComparator<E,T>> {

  final BinarySearchComparator comparator;

  BinarySearchAlgorithm(this.comparator);

  @override
  E? search(List<E> list, T target) {
    int min = 0;
    int max = list.length - 1;

    while (min <= max) {
      int mid = (min + max) ~/ 2;
      E midVal = list[mid];

      if (comparator.isLessThan(midVal, target)) {
        min = mid + 1;
      } else if (comparator.isGreaterThan(midVal, target)) {
        max = mid - 1;
      } else {
        return midVal;
      }
    }

    return null;
  }
}
