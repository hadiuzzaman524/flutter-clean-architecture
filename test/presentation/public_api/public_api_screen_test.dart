import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_calling/presentation/public_api/cubits/public_api/cubit.dart';
import 'package:network_calling/presentation/public_api/cubits/public_api/state.dart';
import 'package:network_calling/presentation/public_api/widgets/public_api_screen_body.dart';

class MockPublicApiCubit extends MockCubit<PublicApiState>
    implements PublicApiCubit {}

void main() {
  late PublicApiCubit publicApiCubit;

  setUp(() {
    publicApiCubit = MockPublicApiCubit();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider(
      create: (context) => publicApiCubit,
      child: MaterialApp(home: body),
    );
  }

  testWidgets(
    'should show the progress indicator when state is loading',
    (widgetTester) async {
      when(() => publicApiCubit.state).thenAnswer(
        (_) => const PublicApiState.apiFetchLoading(),
      );
      await widgetTester.pumpWidget(
        makeTestableWidget(
          const PublicApiScreenBody(),
        ),
      );
      expect(find.byKey(const Key('loading-key')), findsOneWidget);
    },
  );
}
