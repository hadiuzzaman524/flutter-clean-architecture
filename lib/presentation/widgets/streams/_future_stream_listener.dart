part of 'stream_widgets.dart';

class FutureStreamListener<M> extends StatefulWidget {
  final Future<Stream<M>> futureStream;
  final bool Function(M, M)? listenWhen;
  final void Function(BuildContext context, M dataOption) listen;
  final Widget child;

  const FutureStreamListener({
    super.key,
    required this.futureStream,
    this.listenWhen,
    required this.listen,
    required this.child,
  });

  @override
  State<FutureStreamListener<M>> createState() =>
      _FutureStreamStreamListenerState<M>();
}

class _FutureStreamStreamListenerState<M>
    extends State<FutureStreamListener<M>> {
  M? data;
  StreamSubscription<M>? subscription;

  @override
  void initState() {
    super.initState();
    setUp();
  }

  Future setUp() async {
    final stream = await widget.futureStream;
    subscription = stream.listen((data) {
      if (data == null) return;
      if (widget.listenWhen != null &&
          this.data != null &&
          !widget.listenWhen!(this.data as M, data)) {
        return;
      }
      this.data = data;
      if (mounted) {
        widget.listen(context, data);
      }
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
