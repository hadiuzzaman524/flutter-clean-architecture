import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_calling/domain/common/response_error.dart';
import 'package:network_calling/domain/entities/api/api_entity.dart';
import 'package:network_calling/presentation/cubits/app_theme/app_theme_cubit.dart';
import 'package:network_calling/presentation/cubits/app_theme/app_theme_state.dart';
import 'package:network_calling/presentation/public_api/cubits/public_api/cubit.dart';
import 'package:network_calling/presentation/public_api/cubits/public_api/state.dart';
import 'package:network_calling/presentation/public_api/widgets/public_api_screen_body.dart';

class MockPublicApiCubit extends MockCubit<PublicApiState>
    implements PublicApiCubit {}

class MockAppThemeCubit extends MockCubit<AppThemeState>
    implements AppThemeCubit {}

void main() {
  late PublicApiCubit publicApiCubit;
  late AppThemeCubit appThemeCubit;
  final publicApiModelList = <ApiEntity>[
    ApiEntity(
      apiName: 'Dummy Title',
      description: 'Dummy Description',
      link: 'https://dummy-link.com',
    ),
    ApiEntity(
      apiName: 'Dummy Title2',
      description: 'Dummy Description2',
      link: 'https://dummy-link.com2',
    ),
    ApiEntity(
      apiName: 'Dummy Title3',
      description: 'Dummy Description3',
      link: 'https://dummy-link.com3',
    ),
  ];
  setUp(() {
    publicApiCubit = MockPublicApiCubit();
    appThemeCubit = MockAppThemeCubit();
  });

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => publicApiCubit),
        BlocProvider(create: (ctx) => appThemeCubit),
      ],
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

  testWidgets(
    'should return error text when state is failure',
    (widgetTester) async {
      when(() => publicApiCubit.state).thenReturn(
        const PublicApiState.apiFetchedError(
          responseError: ResponseError.unknown(),
        ),
      );

      await widgetTester.pumpWidget(
        makeTestableWidget(
          const PublicApiScreenBody(),
        ),
      );

      expect(find.byKey(const Key('error-key')), findsOneWidget);
    },
  );

  testWidgets(
    'should return list of api when state is loaded',
    (widgetTester) async {
      when(() => publicApiCubit.state).thenAnswer(
        (_) => PublicApiState.apiFetchedLoaded(
          publicApiModelList: publicApiModelList,
        ),
      );
      when(() => appThemeCubit.state)
          .thenReturn(AppThemeState(isDarkMode: true));

      await widgetTester.pumpWidget(
        makeTestableWidget(
          const PublicApiScreenBody(),
        ),
      );

      /// check one ListView() is rendered
      expect(find.byKey(const Key('api-loaded-list')), findsOneWidget);

      ///check all list tile is rendered
      expect(find.byType(ListTile), findsNWidgets(publicApiModelList.length));

      ///check successfully render the ListTile by its key
      for (var i = 0; i < publicApiModelList.length; i++) {
        ///check all text are shown in the UI
        expect(find.text(publicApiModelList[i].apiName), findsOneWidget);
        expect(find.text(publicApiModelList[i].description), findsOneWidget);
        expect(find.text(publicApiModelList[i].link), findsOneWidget);
      }
    },
  );
}
