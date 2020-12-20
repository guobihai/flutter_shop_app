import 'package:flutter/cupertino.dart';

class MyListViewDelegate extends SliverChildBuilderDelegate {
  final int childCount;
  final IndexedWidgetBuilder builder;

  MyListViewDelegate(this.builder, {this.childCount}) : super(builder);
  @override
  Widget build(BuildContext context, int index) {
    assert(builder != null);
    if (index < 0 || (childCount != null && index >= childCount)) return null;
    Widget child;
    try {
      child =Transform.scale(
        scale: index == 0 ? 1.0 : 0.97,
        child: builder(context, index),
        alignment: Alignment.center,
      );
      //builder(context, index);
    } catch (exception, stackTrace) {
      child = _createErrorWidget(exception, stackTrace);
    }
    if (child == null) return null;
    final Key key = child.key != null ? _SaltedValueKey(child.key) : null;
    if (addRepaintBoundaries) child = RepaintBoundary(child: child);
    if (addSemanticIndexes) {
      final int semanticIndex = semanticIndexCallback(child, index);
      if (semanticIndex != null)
        child = IndexedSemantics(
            index: semanticIndex + semanticIndexOffset, child: child);
    }
    if (addAutomaticKeepAlives) child = AutomaticKeepAlive(child: child);
    return KeyedSubtree(child: child, key: key);
  }

  // Return a Widget for the given Exception
  Widget _createErrorWidget(dynamic exception, StackTrace stackTrace) {
    final FlutterErrorDetails details = FlutterErrorDetails(
      exception: exception,
      stack: stackTrace,
      library: 'widgets library',
      context: ErrorDescription('building'),
    );
    FlutterError.reportError(details);
    return ErrorWidget.builder(details);
  }

  @override
  bool shouldRebuild(SliverChildDelegate oldDelegate) => true;

  @override
  int get estimatedChildCount => childCount;

  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
//    print('第一个Item是$firstIndex，最后一个Item是$lastIndex');
  }

  ///监听 在可见的列表中 显示的第一个位置和最后一个位置
  @override
  double estimateMaxScrollOffset(int firstIndex, int lastIndex,
      double leadingScrollOffset, double trailingScrollOffset) {
//    print(
//        'firstIndex sss : $firstIndex, lastIndex ssss : $lastIndex, leadingScrollOffset ssss : $leadingScrollOffset,'
//        'trailingScrollOffset ssss : $trailingScrollOffset  ');
    return super.estimateMaxScrollOffset(firstIndex, lastIndex, leadingScrollOffset, trailingScrollOffset);
  }
}

class _SaltedValueKey extends ValueKey<Key> {
  const _SaltedValueKey(Key key)
      : assert(key != null),
        super(key);
}
