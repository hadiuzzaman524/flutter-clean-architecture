part of 'stream_widgets.dart';

class FutureModelBuilder<M> extends StatelessWidget {
  final Future<Optional<M>> futureModel;
  final Widget Function(BuildContext) buildLoading;
  final Widget Function(BuildContext) buildEmpty;
  final Widget Function(BuildContext, M) buildData;

  const FutureModelBuilder({
    super.key,
    required this.futureModel,
    required this.buildLoading,
    required this.buildEmpty,
    required this.buildData,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildLoading(context);
        }
        final dataOption = snapshot.data;
        if (dataOption == null || !dataOption.hasData) {
          return buildEmpty(context);
        }
        return buildData(context, dataOption.data);
      },
    );
  }
}
