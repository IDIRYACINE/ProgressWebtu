

abstract class SearchAlgorithm<E,T,C extends Comparator<E,T>>{


  SearchAlgorithm();

  E? search(List<E> list, T target);

}

abstract class Comparator<S,T>{

}
