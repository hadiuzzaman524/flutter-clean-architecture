part of 'stream_widgets.dart';

class FutureModelStreamBuilder<M> extends StatelessWidget {
  final Future<ModelStream<M>> futureStream;
  final Widget Function(BuildContext) buildLoading;
  final Widget Function(BuildContext) buildEmpty;
  final Widget Function(BuildContext, M) buildData;

  const FutureModelStreamBuilder({
    super.key,
    required this.futureStream,
    required this.buildLoading,
    required this.buildEmpty,
    required this.buildData,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return buildLoading(context);
        }

        if (snapshot.data == null) {
          return buildEmpty(context);
        }

        return StreamBuilder(
          stream: snapshot.data!,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return buildLoading(context);
            }
            final dataOption = snapshot.data;
            if (dataOption == null || !dataOption.hasData) {
              return buildEmpty(context);
            }
            if (dataOption.data is List) {
              if ((dataOption.data as List).isEmpty) {
                return buildEmpty(context);
              }
            }
            return buildData(context, dataOption.data);
          },
        );
      },
    );
  }
}
