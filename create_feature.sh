#!/bin/bash
set -e

usage() {
  cat <<'USAGE'
Usage: ./create_feature.sh <feature_name> [options]

Generates a feature across the domain / data / presentation layers.

Options:
  --layers=<list>    Comma separated subset of: domain,data,presentation
                     (default: domain,data,presentation)
  --ui-only          Presentation layer only (alias for --layers=presentation)
  --no-data-source   Keep the data layer, but skip the remote/mock data sources
                     and the flavor factory wiring. The repository impl returns
                     in-memory sample data instead, so DI still resolves.
  --no-cubit         Screen + views without a cubit/state (like SettingsScreen)
  --skip-build       Skip pub get / build_runner / analyze
  -h, --help         Show this help

Examples:
  ./create_feature.sh order                        # full stack, mock + remote
  ./create_feature.sh order --no-data-source       # domain + data + UI, no API
  ./create_feature.sh about --ui-only --no-cubit   # static screen only
  ./create_feature.sh order --layers=domain,data   # no UI
USAGE
}

FEATURE_NAME=""
LAYERS="domain,data,presentation"
WITH_DATA_SOURCE=1
WITH_CUBIT=1
RUN_BUILD=1

while [ $# -gt 0 ]; do
  case $1 in
    --layers=*) LAYERS="${1#*=}" ;;
    --ui-only) LAYERS="presentation" ;;
    --no-data-source) WITH_DATA_SOURCE=0 ;;
    --no-cubit) WITH_CUBIT=0 ;;
    --skip-build) RUN_BUILD=0 ;;
    -h | --help)
      usage
      exit 0
      ;;
    -*)
      echo "❌ Unknown option: $1"
      usage
      exit 1
      ;;
    *)
      if [ -n "$FEATURE_NAME" ]; then
        echo "❌ Unexpected argument: $1"
        usage
        exit 1
      fi
      FEATURE_NAME=$1
      ;;
  esac
  shift
done

if [ -z "$FEATURE_NAME" ]; then
  usage
  exit 1
fi

has_layer() {
  case ",$LAYERS," in
    *",$1,"*) return 0 ;;
    *) return 1 ;;
  esac
}

for layer in $(echo "$LAYERS" | tr ',' ' '); do
  case $layer in
    domain | data | presentation) ;;
    *)
      echo "❌ Unknown layer '$layer' (expected domain, data or presentation)"
      exit 1
      ;;
  esac
done

GEN_DOMAIN=0
GEN_DATA=0
GEN_PRESENTATION=0
has_layer domain && GEN_DOMAIN=1
has_layer data && GEN_DATA=1
has_layer presentation && GEN_PRESENTATION=1

if [ "$GEN_DATA" = 1 ] && [ "$GEN_DOMAIN" = 0 ]; then
  echo "❌ The data layer implements the domain repository — include 'domain' too."
  exit 1
fi

if [ "$GEN_DOMAIN" = 0 ]; then
  # No entity/use case means nothing for the data layer to build on.
  WITH_DATA_SOURCE=0
fi

if [ ! -f pubspec.yaml ]; then
  echo "❌ Run this script from the project root (pubspec.yaml not found)."
  exit 1
fi

PACKAGE_NAME=$(awk '/^name:/ { print $2; exit }' pubspec.yaml)

# Convert feature name to snake case (all lowercase, underscores)
FEATURE_SNAKE=$(echo "$FEATURE_NAME" | tr '[:upper:]' '[:lower:]')

# Convert snake_case to PascalCase / camelCase.
# (`sed -r 's/...\U\2/'` is GNU-only and silently produces garbage on macOS.)
ENTITY_CAMEL=""
IFS='_' read -ra FEATURE_PARTS <<< "$FEATURE_SNAKE"
for part in "${FEATURE_PARTS[@]}"; do
  [ -z "$part" ] && continue
  ENTITY_CAMEL+="$(echo "${part:0:1}" | tr '[:lower:]' '[:upper:]')${part:1}"
done
unset IFS
FEATURE_LOWER_CAMEL="$(echo "${ENTITY_CAMEL:0:1}" | tr '[:upper:]' '[:lower:]')${ENTITY_CAMEL:1}"

# ---------------------------
# Paths
# ---------------------------
DOMAIN_ENTITY_DIR="lib/domain/entity/$FEATURE_SNAKE"
DOMAIN_REPO_DIR="lib/domain/repository/$FEATURE_SNAKE"
DOMAIN_USECASE_DIR="lib/domain/use_cases/$FEATURE_SNAKE"

DATA_MODEL_DIR="lib/data/models/response_model/$FEATURE_SNAKE"
DATA_REPO_IMPL_DIR="lib/data/repository_impl/$FEATURE_SNAKE"
DATA_REMAPPER_DIR="lib/data/remapper"
DATA_DS_DIR="lib/data/data_source/$FEATURE_SNAKE"
DATA_DS_REMOTE_DIR="$DATA_DS_DIR/remote"
DATA_DS_MOCK_DIR="$DATA_DS_DIR/mock"

PRESENTATION_DIR="lib/presentation/screen/$FEATURE_SNAKE"
CUBIT_DIR="$PRESENTATION_DIR/cubit"
COMPONENTS_DIR="$PRESENTATION_DIR/components"

# ---------------------------
# Files
# ---------------------------
DOMAIN_ENTITY_FILE="$DOMAIN_ENTITY_DIR/${FEATURE_SNAKE}_entity.dart"
DOMAIN_REPO_FILE="$DOMAIN_REPO_DIR/${FEATURE_SNAKE}_repository.dart"
DOMAIN_USECASE_FILE="$DOMAIN_USECASE_DIR/get_${FEATURE_SNAKE}_list_use_case.dart"

DATA_MODEL_FILE="$DATA_MODEL_DIR/${FEATURE_SNAKE}_response_model.dart"
DATA_REPO_IMPL_FILE="$DATA_REPO_IMPL_DIR/${FEATURE_SNAKE}_repository_impl.dart"
DATA_REMAPPER_FILE="$DATA_REMAPPER_DIR/${FEATURE_SNAKE}_response_to_entity.dart"
DATA_DS_FILE="$DATA_DS_DIR/${FEATURE_SNAKE}_data_source.dart"
DATA_REMOTE_DS_FILE="$DATA_DS_REMOTE_DIR/${FEATURE_SNAKE}_remote_data_source.dart"
DATA_MOCK_DS_FILE="$DATA_DS_MOCK_DIR/${FEATURE_SNAKE}_mock_data_source.dart"

CUBIT_FILE="$CUBIT_DIR/${FEATURE_SNAKE}_cubit.dart"
STATE_FILE="$CUBIT_DIR/${FEATURE_SNAKE}_state.dart"

SCREEN_FILE="$PRESENTATION_DIR/${FEATURE_SNAKE}_screen.dart"
PORTRAIT_VIEW_FILE="$PRESENTATION_DIR/${FEATURE_SNAKE}_portrait_view.dart"
LANDSCAPE_VIEW_FILE="$PRESENTATION_DIR/${FEATURE_SNAKE}_landscape_view.dart"
LIST_VIEW_FILE="$COMPONENTS_DIR/${FEATURE_SNAKE}_list_view.dart"

BASE_ENTITY_FILE="lib/domain/entity/base/base_entity.dart"
BASE_RESPONSE_FILE="lib/data/models/response_model/base/base_response.dart"
APP_ROUTER_FILE="lib/presentation/route/app_router.dart"
FACTORY_DIR="lib/data/data_source/base/factory"
DS_FACTORY_FILE="$FACTORY_DIR/data_source_factory.dart"
MOCK_FACTORY_FILE="$FACTORY_DIR/mock_data_source_factory.dart"
REMOTE_FACTORY_FILE="$FACTORY_DIR/remote_data_source_factory.dart"
DS_PROVIDER_FILE="$FACTORY_DIR/data_source_provider.dart"

# ---------------------------
# Helpers
# ---------------------------
# All source edits go through awk + a temp file. GNU `sed -i` is not portable:
# BSD/macOS sed reads -i's argument as a backup suffix and then treats the
# filename as the script ("extra characters at the end of l command").
_new_tmp() { mktemp "${TMPDIR:-/tmp}/create_feature.XXXXXX"; }

_require_file() {
  if [ ! -f "$1" ]; then
    echo "⚠️  Skipped: $1 not found"
    return 1
  fi
  return 0
}

# Insert $line before the first line matching regex $marker (appended if absent).
insert_line_before() {
  local file=$1 marker=$2 line=$3 tmp
  _require_file "$file" || return 0
  grep -Fq "$line" "$file" && return 0
  tmp=$(_new_tmp)
  awk -v line="$line" -v marker="$marker" '
    !inserted && $0 ~ marker { print line; inserted = 1 }
    { print }
    END { if (!inserted) print line }
  ' "$file" > "$tmp" && mv "$tmp" "$file"
  echo "   • $(basename "$file"): added $line"
}

# Insert an import, sorted within the imports of the same package
# (falls back to the end of the import block).
add_import() {
  local file=$1 line=$2 prefix tmp
  _require_file "$file" || return 0
  grep -Fq "$line" "$file" && return 0
  prefix="${line%%/*}/"
  tmp=$(_new_tmp)
  awk -v line="$line" -v prefix="$prefix" '
    FNR == NR {
      if ($0 ~ /^import /) last = FNR
      if (index($0, prefix) == 1) last_in_group = FNR
      next
    }
    {
      if (!inserted && index($0, prefix) == 1 && $0 > line) {
        print line
        inserted = 1
      }
      print
      if (!inserted && last_in_group > 0 && FNR == last_in_group) {
        print line
        inserted = 1
      }
      if (!inserted && last_in_group == 0 && FNR == last) {
        print line
        inserted = 1
      }
    }
  ' "$file" "$file" > "$tmp" && mv "$tmp" "$file"
}

# Insert a (multi-line) block just before the file's last top-level `}`.
add_class_member() {
  local file=$1 signature=$2 block=$3 tmp blockfile
  _require_file "$file" || return 0
  grep -Fq "$signature" "$file" && return 0
  blockfile=$(_new_tmp)
  printf '%s\n' "$block" > "$blockfile"
  tmp=$(_new_tmp)
  awk -v blockfile="$blockfile" '
    FNR == NR { if ($0 == "}") last = FNR; next }
    FNR == last { while ((getline l < blockfile) > 0) print l }
    { print }
  ' "$file" "$file" > "$tmp" && mv "$tmp" "$file"
  rm -f "$blockfile"
  grep -Fq "$signature" "$file" ||
    echo "⚠️  Could not add '$signature' to $(basename "$file") — add it manually"
}

# Append an argument to a constructor declaration, whether `dart format` kept it
# on one line or wrapped it over several:
#   Foo(this._a, this._b);   ->  Foo(this._a, this._b, this._c);
#   Foo(                     ->  ...inserts `    this._c,` before the `);`
#     this._a,
#   );
add_constructor_arg() {
  local file=$1 class=$2 arg=$3 tmp
  _require_file "$file" || return 0
  grep -Fq "$arg" "$file" && return 0
  tmp=$(_new_tmp)
  awk -v class="$class" -v arg="$arg" '
    !done && !in_args && index($0, class "(") {
      if ($0 ~ /\);[[:space:]]*$/) {
        sub(/\);[[:space:]]*$/, ", " arg ");")
        done = 1
        print
        next
      }
      if ($0 ~ /\([[:space:]]*$/) {
        in_args = 1
        print
        next
      }
    }
    in_args && !done && /^[[:space:]]*\);[[:space:]]*$/ {
      print "    " arg ","
      done = 1
      in_args = 0
    }
    { print }
  ' "$file" > "$tmp" && mv "$tmp" "$file"
  grep -Fq "$arg" "$file" ||
    echo "⚠️  Could not add '$arg' to $class in $(basename "$file") — add it manually"
}

# Add a `final X _y;` line right after the last existing field declaration.
add_final_field() {
  local file=$1 field=$2 tmp
  _require_file "$file" || return 0
  grep -Fq "$field" "$file" && return 0
  tmp=$(_new_tmp)
  awk -v field="$field" '
    FNR == NR { if ($0 ~ /^  final .*;$/) last = FNR; next }
    { print }
    FNR == last { print field }
  ' "$file" "$file" > "$tmp" && mv "$tmp" "$file"
  grep -Fq "$field" "$file" ||
    echo "⚠️  Could not add the field to $(basename "$file") — add it manually"
}

# Add a parameter to an @module factory method and forward it to the
# constructor call, single-line or wrapped:
#   ) => MockDataSourceFactory(userMock, authMock);
add_module_param() {
  local file=$1 class=$2 declaration=$3 arg=$4 tmp skip_decl=0 skip_arg=0
  _require_file "$file" || return 0
  grep -Fq "$declaration" "$file" && skip_decl=1
  # The arg also appears on the declaration line, so it counts as forwarded to
  # the constructor call only when it shows up on a second line.
  [ "$(grep -Fc "$arg" "$file")" -ge 2 ] && skip_arg=1
  [ "$skip_decl" = 1 ] && [ "$skip_arg" = 1 ] && return 0
  tmp=$(_new_tmp)
  awk -v class="$class" -v declaration="$declaration" -v arg="$arg" \
    -v skip_decl="$skip_decl" -v skip_arg="$skip_arg" '
    !handled && index($0, ") => " class "(") {
      if (!skip_decl) print declaration
      handled = 1
      if (skip_arg) { print; next }
      if ($0 ~ /\);[[:space:]]*$/) {
        sub(/\);[[:space:]]*$/, ", " arg ");")
        added_arg = 1
        print
        next
      }
      in_call = 1
      print
      next
    }
    in_call && !added_arg && /^[[:space:]]*\);[[:space:]]*$/ {
      print "    " arg ","
      added_arg = 1
      in_call = 0
    }
    { print }
  ' "$file" > "$tmp" && mv "$tmp" "$file"
  if ! grep -Fq "$declaration" "$file" ||
    [ "$(grep -Fc "$arg" "$file")" -lt 2 ]; then
    echo "⚠️  Could not add '$arg' to $class in $(basename "$file") — add it manually"
  fi
}

# ---------------------------
# Create directories
# ---------------------------
if [ "$GEN_DOMAIN" = 1 ]; then
  mkdir -p "$DOMAIN_ENTITY_DIR" "$DOMAIN_REPO_DIR" "$DOMAIN_USECASE_DIR"
fi
if [ "$GEN_DATA" = 1 ]; then
  mkdir -p "$DATA_REPO_IMPL_DIR"
  if [ "$WITH_DATA_SOURCE" = 1 ]; then
    mkdir -p "$DATA_MODEL_DIR" "$DATA_REMAPPER_DIR"
    mkdir -p "$DATA_DS_DIR" "$DATA_DS_REMOTE_DIR" "$DATA_DS_MOCK_DIR"
  fi
fi
if [ "$GEN_PRESENTATION" = 1 ]; then
  mkdir -p "$PRESENTATION_DIR" "$COMPONENTS_DIR"
  [ "$WITH_CUBIT" = 1 ] && mkdir -p "$CUBIT_DIR"
fi

echo "🔹 Generating '$FEATURE_SNAKE' ($ENTITY_CAMEL) — layers: $LAYERS"
if [ "$GEN_DATA" = 1 ] && [ "$WITH_DATA_SOURCE" = 0 ]; then
  echo "   (no data source: the repository impl returns in-memory sample data)"
fi
if [ "$GEN_DOMAIN" = 1 ] && [ "$GEN_DATA" = 0 ]; then
  echo "⚠️  No data layer: ${ENTITY_CAMEL}Repository has no implementation, so"
  echo "   injector<Get${ENTITY_CAMEL}ListUseCase>() will throw until you add one."
fi

if [ "$GEN_DOMAIN" = 1 ]; then
# ---------------------------
# Domain Entity
# ---------------------------
cat <<EOF > "$DOMAIN_ENTITY_FILE"
part of '../base/base_entity.dart';

@freezed
abstract class ${ENTITY_CAMEL}Entity with _\$${ENTITY_CAMEL}Entity {
  const factory ${ENTITY_CAMEL}Entity({
    required String id,
    required String title,
  }) = _${ENTITY_CAMEL}Entity;
}
EOF

insert_line_before "$BASE_ENTITY_FILE" "part '.*\\.freezed\\.dart';" \
  "part '../$FEATURE_SNAKE/${FEATURE_SNAKE}_entity.dart';"

# ---------------------------
# Domain Repository
# ---------------------------
cat <<EOF > "$DOMAIN_REPO_FILE"
import 'package:$PACKAGE_NAME/domain/entity/base/base_entity.dart';

abstract class ${ENTITY_CAMEL}Repository {
  Future<List<${ENTITY_CAMEL}Entity>> get${ENTITY_CAMEL}List();

  Future<${ENTITY_CAMEL}Entity> get${ENTITY_CAMEL}ById({required String id});
}
EOF

# ---------------------------
# Domain UseCase
# ---------------------------
cat <<EOF > "$DOMAIN_USECASE_FILE"
import 'package:injectable/injectable.dart';
import 'package:$PACKAGE_NAME/domain/entity/base/base_entity.dart';
import 'package:$PACKAGE_NAME/domain/repository/$FEATURE_SNAKE/${FEATURE_SNAKE}_repository.dart';
import 'package:$PACKAGE_NAME/domain/use_cases/base/base_use_case.dart';

@singleton
class Get${ENTITY_CAMEL}ListUseCase with BaseUseCase<List<${ENTITY_CAMEL}Entity>> {
  Get${ENTITY_CAMEL}ListUseCase(this._${FEATURE_LOWER_CAMEL}Repository);

  final ${ENTITY_CAMEL}Repository _${FEATURE_LOWER_CAMEL}Repository;

  @override
  Future<List<${ENTITY_CAMEL}Entity>> execute() =>
      _${FEATURE_LOWER_CAMEL}Repository.get${ENTITY_CAMEL}List();
}
EOF
fi

if [ "$GEN_DATA" = 1 ] && [ "$WITH_DATA_SOURCE" = 1 ]; then
# ---------------------------
# Data Model (Freezed)
# ---------------------------
cat <<EOF > "$DATA_MODEL_FILE"
part of '../base/base_response.dart';

@freezed
abstract class ${ENTITY_CAMEL}ResponseModel with _\$${ENTITY_CAMEL}ResponseModel {
  const factory ${ENTITY_CAMEL}ResponseModel({
    String? id,
    String? title,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _${ENTITY_CAMEL}ResponseModel;

  factory ${ENTITY_CAMEL}ResponseModel.fromJson(Map<String, dynamic> json) =>
      _\$${ENTITY_CAMEL}ResponseModelFromJson(json);
}
EOF

insert_line_before "$BASE_RESPONSE_FILE" "part '.*\\.freezed\\.dart';" \
  "part '../$FEATURE_SNAKE/${FEATURE_SNAKE}_response_model.dart';"

# ---------------------------
# Data Source contract (flavor picks the implementation, see factory wiring)
# ---------------------------
cat <<EOF > "$DATA_DS_FILE"
import 'package:$PACKAGE_NAME/data/models/response_model/base/base_response.dart';

abstract class ${ENTITY_CAMEL}DataSource {
  Future<List<${ENTITY_CAMEL}ResponseModel>> get${ENTITY_CAMEL}List();

  Future<${ENTITY_CAMEL}ResponseModel> get${ENTITY_CAMEL}ById({
    required String id,
  });
}
EOF

# ---------------------------
# Remote Data Source (staging / production)
# ---------------------------
cat <<EOF > "$DATA_REMOTE_DS_FILE"
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:$PACKAGE_NAME/data/data_source/$FEATURE_SNAKE/${FEATURE_SNAKE}_data_source.dart';
import 'package:$PACKAGE_NAME/data/models/response_model/base/base_response.dart';
import 'package:$PACKAGE_NAME/domain/enum/dio_client_type.dart';

part '${FEATURE_SNAKE}_remote_data_source.g.dart';

@RestApi()
@LazySingleton()
abstract class ${ENTITY_CAMEL}RemoteDataSource implements ${ENTITY_CAMEL}DataSource {
  @factoryMethod
  factory ${ENTITY_CAMEL}RemoteDataSource(
    @Named(DioClientType.unauthenticated) Dio dio,
  ) = _${ENTITY_CAMEL}RemoteDataSource;

  // TODO: point these at the real endpoints.
  @override
  @GET('/$FEATURE_SNAKE')
  Future<List<${ENTITY_CAMEL}ResponseModel>> get${ENTITY_CAMEL}List();

  @override
  @GET('/$FEATURE_SNAKE/{id}')
  Future<${ENTITY_CAMEL}ResponseModel> get${ENTITY_CAMEL}ById({
    @Path('id') required String id,
  });
}
EOF

# ---------------------------
# Mock Data Source (development flavor, fully offline)
# ---------------------------
cat <<EOF > "$DATA_MOCK_DS_FILE"
import 'package:injectable/injectable.dart';
import 'package:$PACKAGE_NAME/data/data_source/$FEATURE_SNAKE/${FEATURE_SNAKE}_data_source.dart';
import 'package:$PACKAGE_NAME/data/models/response_model/base/base_response.dart';

@LazySingleton()
class ${ENTITY_CAMEL}MockDataSource implements ${ENTITY_CAMEL}DataSource {
  /// Simulated network latency, so the loading state is visible.
  static const _delay = Duration(seconds: 2);

  @override
  Future<List<${ENTITY_CAMEL}ResponseModel>> get${ENTITY_CAMEL}List() async {
    await Future<void>.delayed(_delay);
    return const [
      ${ENTITY_CAMEL}ResponseModel(id: '1', title: 'Mock $ENTITY_CAMEL 1'),
      ${ENTITY_CAMEL}ResponseModel(id: '2', title: 'Mock $ENTITY_CAMEL 2'),
    ];
  }

  @override
  Future<${ENTITY_CAMEL}ResponseModel> get${ENTITY_CAMEL}ById({
    required String id,
  }) async {
    await Future<void>.delayed(_delay);
    return ${ENTITY_CAMEL}ResponseModel(id: id, title: 'Mock $ENTITY_CAMEL \$id');
  }
}
EOF

# ---------------------------
# Remapper
# ---------------------------
cat <<EOF > "$DATA_REMAPPER_FILE"
import 'package:$PACKAGE_NAME/data/models/response_model/base/base_response.dart';
import 'package:$PACKAGE_NAME/domain/entity/base/base_entity.dart';

extension ${ENTITY_CAMEL}ResponseMapper on List<${ENTITY_CAMEL}ResponseModel> {
  /// Maps a list of ${ENTITY_CAMEL}ResponseModel to a list of ${ENTITY_CAMEL}Entity
  List<${ENTITY_CAMEL}Entity> to${ENTITY_CAMEL}Entities() =>
      map((response) => response.to${ENTITY_CAMEL}Entity()).toList();
}

extension ${ENTITY_CAMEL}ResponseItemMapper on ${ENTITY_CAMEL}ResponseModel {
  /// Maps a ${ENTITY_CAMEL}ResponseModel to a ${ENTITY_CAMEL}Entity
  ${ENTITY_CAMEL}Entity to${ENTITY_CAMEL}Entity() =>
      ${ENTITY_CAMEL}Entity(id: id ?? '', title: title ?? '');
}
EOF
fi

# ---------------------------
# Repository Implementation
# ---------------------------
if [ "$GEN_DATA" = 1 ] && [ "$WITH_DATA_SOURCE" = 1 ]; then
# data source comes from the flavor factory
cat <<EOF > "$DATA_REPO_IMPL_FILE"
import 'package:injectable/injectable.dart';
import 'package:$PACKAGE_NAME/data/data_source/$FEATURE_SNAKE/${FEATURE_SNAKE}_data_source.dart';
import 'package:$PACKAGE_NAME/data/data_source/base/factory/data_source_factory.dart';
import 'package:$PACKAGE_NAME/data/remapper/${FEATURE_SNAKE}_response_to_entity.dart';
import 'package:$PACKAGE_NAME/domain/entity/base/base_entity.dart';
import 'package:$PACKAGE_NAME/domain/repository/$FEATURE_SNAKE/${FEATURE_SNAKE}_repository.dart';

@Singleton(as: ${ENTITY_CAMEL}Repository)
class ${ENTITY_CAMEL}RepositoryImpl implements ${ENTITY_CAMEL}Repository {
  ${ENTITY_CAMEL}RepositoryImpl(DataSourceFactory factory)
    : _${FEATURE_LOWER_CAMEL}DataSource = factory.create${ENTITY_CAMEL}DataSource();

  final ${ENTITY_CAMEL}DataSource _${FEATURE_LOWER_CAMEL}DataSource;

  @override
  Future<List<${ENTITY_CAMEL}Entity>> get${ENTITY_CAMEL}List() async {
    final response = await _${FEATURE_LOWER_CAMEL}DataSource.get${ENTITY_CAMEL}List();
    return response.to${ENTITY_CAMEL}Entities();
  }

  @override
  Future<${ENTITY_CAMEL}Entity> get${ENTITY_CAMEL}ById({required String id}) async {
    final response = await _${FEATURE_LOWER_CAMEL}DataSource.get${ENTITY_CAMEL}ById(
      id: id,
    );
    return response.to${ENTITY_CAMEL}Entity();
  }
}
EOF
elif [ "$GEN_DATA" = 1 ]; then
cat <<EOF > "$DATA_REPO_IMPL_FILE"
import 'package:injectable/injectable.dart';
import 'package:$PACKAGE_NAME/domain/entity/base/base_entity.dart';
import 'package:$PACKAGE_NAME/domain/repository/$FEATURE_SNAKE/${FEATURE_SNAKE}_repository.dart';

/// TODO: replace the in-memory data with a real source.
/// Re-run \`./create_feature.sh $FEATURE_SNAKE\` (without --no-data-source) to
/// generate mock + remote data sources and wire them into the flavor factories.
@Singleton(as: ${ENTITY_CAMEL}Repository)
class ${ENTITY_CAMEL}RepositoryImpl implements ${ENTITY_CAMEL}Repository {
  /// Simulated latency, so the loading state is visible.
  static const _delay = Duration(seconds: 2);

  static const _items = [
    ${ENTITY_CAMEL}Entity(id: '1', title: 'Sample $ENTITY_CAMEL 1'),
    ${ENTITY_CAMEL}Entity(id: '2', title: 'Sample $ENTITY_CAMEL 2'),
  ];

  @override
  Future<List<${ENTITY_CAMEL}Entity>> get${ENTITY_CAMEL}List() async {
    await Future<void>.delayed(_delay);
    return _items;
  }

  @override
  Future<${ENTITY_CAMEL}Entity> get${ENTITY_CAMEL}ById({required String id}) async {
    await Future<void>.delayed(_delay);
    return _items.firstWhere((item) => item.id == id);
  }
}
EOF
fi

if [ "$GEN_DATA" = 1 ] && [ "$WITH_DATA_SOURCE" = 1 ]; then
# ---------------------------
# Wire the data source into the flavor-based Abstract Factory
# ---------------------------
echo "🔹 Wiring $ENTITY_CAMEL data source into the flavor factories..."

DS_IMPORT="import 'package:$PACKAGE_NAME/data/data_source/$FEATURE_SNAKE/${FEATURE_SNAKE}_data_source.dart';"
MOCK_DS_IMPORT="import 'package:$PACKAGE_NAME/data/data_source/$FEATURE_SNAKE/mock/${FEATURE_SNAKE}_mock_data_source.dart';"
REMOTE_DS_IMPORT="import 'package:$PACKAGE_NAME/data/data_source/$FEATURE_SNAKE/remote/${FEATURE_SNAKE}_remote_data_source.dart';"

# 1. The abstract factory contract
add_import "$DS_FACTORY_FILE" "$DS_IMPORT"
add_class_member "$DS_FACTORY_FILE" "create${ENTITY_CAMEL}DataSource" \
  "  ${ENTITY_CAMEL}DataSource create${ENTITY_CAMEL}DataSource();"

# 2. Mock factory (development)
add_import "$MOCK_FACTORY_FILE" "$DS_IMPORT"
add_import "$MOCK_FACTORY_FILE" "$MOCK_DS_IMPORT"
add_constructor_arg "$MOCK_FACTORY_FILE" "MockDataSourceFactory" \
  "this._${FEATURE_LOWER_CAMEL}Mock"
add_final_field "$MOCK_FACTORY_FILE" \
  "  final ${ENTITY_CAMEL}MockDataSource _${FEATURE_LOWER_CAMEL}Mock;"
add_class_member "$MOCK_FACTORY_FILE" "create${ENTITY_CAMEL}DataSource" \
  "
  @override
  ${ENTITY_CAMEL}DataSource create${ENTITY_CAMEL}DataSource() => _${FEATURE_LOWER_CAMEL}Mock;"

# 3. Remote factory (staging / production)
add_import "$REMOTE_FACTORY_FILE" "$DS_IMPORT"
add_import "$REMOTE_FACTORY_FILE" "$REMOTE_DS_IMPORT"
add_constructor_arg "$REMOTE_FACTORY_FILE" "RemoteDataSourceFactory" \
  "this._${FEATURE_LOWER_CAMEL}Remote"
add_final_field "$REMOTE_FACTORY_FILE" \
  "  final ${ENTITY_CAMEL}RemoteDataSource _${FEATURE_LOWER_CAMEL}Remote;"
add_class_member "$REMOTE_FACTORY_FILE" "create${ENTITY_CAMEL}DataSource" \
  "
  @override
  ${ENTITY_CAMEL}DataSource create${ENTITY_CAMEL}DataSource() => _${FEATURE_LOWER_CAMEL}Remote;"

# 4. DI module that binds one factory per environment
add_import "$DS_PROVIDER_FILE" "$MOCK_DS_IMPORT"
add_import "$DS_PROVIDER_FILE" "$REMOTE_DS_IMPORT"
add_module_param "$DS_PROVIDER_FILE" "MockDataSourceFactory" \
  "    ${ENTITY_CAMEL}MockDataSource ${FEATURE_LOWER_CAMEL}Mock," \
  "${FEATURE_LOWER_CAMEL}Mock"
add_module_param "$DS_PROVIDER_FILE" "RemoteDataSourceFactory" \
  "    ${ENTITY_CAMEL}RemoteDataSource ${FEATURE_LOWER_CAMEL}Remote," \
  "${FEATURE_LOWER_CAMEL}Remote"
fi

# ---------------------------
# Cubit + State
# ---------------------------
if [ "$GEN_PRESENTATION" = 1 ] && [ "$WITH_CUBIT" = 1 ] && [ "$GEN_DOMAIN" = 1 ]; then
cat <<EOF > "$CUBIT_FILE"
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:$PACKAGE_NAME/core/error/response_error.dart';
import 'package:$PACKAGE_NAME/core/state_status/base_status.dart';
import 'package:$PACKAGE_NAME/domain/use_cases/$FEATURE_SNAKE/get_${FEATURE_SNAKE}_list_use_case.dart';
import 'package:$PACKAGE_NAME/presentation/screen/$FEATURE_SNAKE/cubit/${FEATURE_SNAKE}_state.dart';

@injectable
class ${ENTITY_CAMEL}Cubit extends Cubit<${ENTITY_CAMEL}State> {
  ${ENTITY_CAMEL}Cubit(this._get${ENTITY_CAMEL}ListUseCase, this._logger)
    : super(const ${ENTITY_CAMEL}State());

  final Get${ENTITY_CAMEL}ListUseCase _get${ENTITY_CAMEL}ListUseCase;
  final Logger _logger;

  Future<void> get${ENTITY_CAMEL}List() async {
    try {
      emit(state.copyWith(status: const BaseStatus.loading()));
      final ${FEATURE_LOWER_CAMEL}List = await _get${ENTITY_CAMEL}ListUseCase.execute();
      emit(
        state.copyWith(
          ${FEATURE_LOWER_CAMEL}List: ${FEATURE_LOWER_CAMEL}List,
          status: const BaseStatus.success(),
        ),
      );
    } catch (e) {
      _logger.e(e);
      emit(state.copyWith(status: BaseStatus.failure(ResponseError.from(e))));
    }
  }
}
EOF

cat <<EOF > "$STATE_FILE"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:$PACKAGE_NAME/core/state_status/base_status.dart';
import 'package:$PACKAGE_NAME/domain/entity/base/base_entity.dart';

part '${FEATURE_SNAKE}_state.freezed.dart';

@freezed
sealed class ${ENTITY_CAMEL}State with _\$${ENTITY_CAMEL}State {
  const factory ${ENTITY_CAMEL}State({
    @Default([]) List<${ENTITY_CAMEL}Entity> ${FEATURE_LOWER_CAMEL}List,
    @Default(BaseStatus.initial()) BaseStatus status,
  }) = _${ENTITY_CAMEL}State;
}
EOF
elif [ "$GEN_PRESENTATION" = 1 ] && [ "$WITH_CUBIT" = 1 ]; then
cat <<EOF > "$CUBIT_FILE"
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:$PACKAGE_NAME/core/error/response_error.dart';
import 'package:$PACKAGE_NAME/core/state_status/base_status.dart';
import 'package:$PACKAGE_NAME/presentation/screen/$FEATURE_SNAKE/cubit/${FEATURE_SNAKE}_state.dart';

@injectable
class ${ENTITY_CAMEL}Cubit extends Cubit<${ENTITY_CAMEL}State> {
  ${ENTITY_CAMEL}Cubit(this._logger) : super(const ${ENTITY_CAMEL}State());

  final Logger _logger;

  /// How long the fake work takes. Drop it once this screen does real work.
  static const _delay = Duration(seconds: 2);

  static const _sampleItems = ['Sample $ENTITY_CAMEL 1', 'Sample $ENTITY_CAMEL 2'];

  Future<void> load() async {
    try {
      emit(state.copyWith(status: const BaseStatus.loading()));
      // TODO: replace with the work this screen actually does.
      await Future<void>.delayed(_delay);
      emit(
        state.copyWith(
          items: _sampleItems,
          status: const BaseStatus.success(),
        ),
      );
    } catch (e) {
      _logger.e(e);
      emit(state.copyWith(status: BaseStatus.failure(ResponseError.from(e))));
    }
  }
}
EOF

cat <<EOF > "$STATE_FILE"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:$PACKAGE_NAME/core/state_status/base_status.dart';

part '${FEATURE_SNAKE}_state.freezed.dart';

@freezed
sealed class ${ENTITY_CAMEL}State with _\$${ENTITY_CAMEL}State {
  const factory ${ENTITY_CAMEL}State({
    @Default(<String>[]) List<String> items,
    @Default(BaseStatus.initial()) BaseStatus status,
  }) = _${ENTITY_CAMEL}State;
}
EOF
fi

# ---------------------------
# Screen + views
# ---------------------------
if [ "$GEN_PRESENTATION" = 1 ]; then

if [ "$WITH_CUBIT" = 1 ]; then
if [ "$GEN_DOMAIN" = 1 ]; then
  CUBIT_CREATE="injector<${ENTITY_CAMEL}Cubit>()..get${ENTITY_CAMEL}List()"
else
  CUBIT_CREATE="injector<${ENTITY_CAMEL}Cubit>()..load()"
fi
cat <<EOF > "$SCREEN_FILE"
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:$PACKAGE_NAME/core/injector/injector.dart';
import 'package:$PACKAGE_NAME/presentation/screen/$FEATURE_SNAKE/cubit/${FEATURE_SNAKE}_cubit.dart';
import 'package:$PACKAGE_NAME/presentation/screen/$FEATURE_SNAKE/${FEATURE_SNAKE}_landscape_view.dart';
import 'package:$PACKAGE_NAME/presentation/screen/$FEATURE_SNAKE/${FEATURE_SNAKE}_portrait_view.dart';
import 'package:$PACKAGE_NAME/presentation/widgets/widgets.dart';

@RoutePage()
class ${ENTITY_CAMEL}Screen extends Screen {
  const ${ENTITY_CAMEL}Screen({super.key});

  @override
  Widget buildViewWrapper({required Widget child}) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => $CUBIT_CREATE)],
      child: child,
    );
  }

  @override
  Widget buildMobilePortraitView(BuildContext context) {
    return const ${ENTITY_CAMEL}PortraitView();
  }

  @override
  Widget buildMobileLandscapeView(BuildContext context) {
    return const ${ENTITY_CAMEL}LandscapeView();
  }
}
EOF
else
cat <<EOF > "$SCREEN_FILE"
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:$PACKAGE_NAME/presentation/screen/$FEATURE_SNAKE/${FEATURE_SNAKE}_landscape_view.dart';
import 'package:$PACKAGE_NAME/presentation/screen/$FEATURE_SNAKE/${FEATURE_SNAKE}_portrait_view.dart';
import 'package:$PACKAGE_NAME/presentation/widgets/widgets.dart';

@RoutePage()
class ${ENTITY_CAMEL}Screen extends Screen {
  const ${ENTITY_CAMEL}Screen({super.key});

  @override
  Widget buildViewWrapper({required Widget child}) {
    return child;
  }

  @override
  Widget buildMobilePortraitView(BuildContext context) {
    return const ${ENTITY_CAMEL}PortraitView();
  }

  @override
  Widget buildMobileLandscapeView(BuildContext context) {
    return const ${ENTITY_CAMEL}LandscapeView();
  }
}
EOF
fi

write_view() {
  local file=$1 class_suffix=$2
  if [ "$WITH_CUBIT" = 0 ]; then
cat <<EOF > "$file"
import 'package:flutter/material.dart';
import 'package:$PACKAGE_NAME/presentation/theme/text/app_text.dart';

class ${ENTITY_CAMEL}${class_suffix} extends StatelessWidget {
  const ${ENTITY_CAMEL}${class_suffix}({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppText.titleLargeBold('$ENTITY_CAMEL')),
      // TODO: build the $ENTITY_CAMEL view.
      body: const Center(child: Text('$ENTITY_CAMEL')),
    );
  }
}
EOF
  elif [ "$GEN_DOMAIN" = 1 ]; then
cat <<EOF > "$file"
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:$PACKAGE_NAME/core/error/error_localization.dart';
import 'package:$PACKAGE_NAME/core/error/response_error.dart';
import 'package:$PACKAGE_NAME/core/state_status/base_status.dart';
import 'package:$PACKAGE_NAME/presentation/screen/$FEATURE_SNAKE/components/${FEATURE_SNAKE}_list_view.dart';
import 'package:$PACKAGE_NAME/presentation/screen/$FEATURE_SNAKE/cubit/${FEATURE_SNAKE}_cubit.dart';
import 'package:$PACKAGE_NAME/presentation/screen/$FEATURE_SNAKE/cubit/${FEATURE_SNAKE}_state.dart';
import 'package:$PACKAGE_NAME/presentation/theme/text/app_text.dart';

class ${ENTITY_CAMEL}${class_suffix} extends StatelessWidget {
  const ${ENTITY_CAMEL}${class_suffix}({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppText.titleLargeBold('$ENTITY_CAMEL')),
      body: BlocBuilder<${ENTITY_CAMEL}Cubit, ${ENTITY_CAMEL}State>(
        builder: (context, state) {
          return switch (state.status) {
            Loading() => const Center(child: CircularProgressIndicator()),
            Failure(:final ResponseError responseError) => Center(
              child: AppText.bodyLarge(
                context.errorLocalization.responseError(responseError),
                textAlign: TextAlign.center,
              ),
            ),
            Success() =>
              state.${FEATURE_LOWER_CAMEL}List.isEmpty
                  ? const Center(child: Text('No items found'))
                  : ${ENTITY_CAMEL}ListView(items: state.${FEATURE_LOWER_CAMEL}List),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
EOF
  else
cat <<EOF > "$file"
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:$PACKAGE_NAME/core/error/error_localization.dart';
import 'package:$PACKAGE_NAME/core/error/response_error.dart';
import 'package:$PACKAGE_NAME/core/state_status/base_status.dart';
import 'package:$PACKAGE_NAME/presentation/screen/$FEATURE_SNAKE/cubit/${FEATURE_SNAKE}_cubit.dart';
import 'package:$PACKAGE_NAME/presentation/screen/$FEATURE_SNAKE/cubit/${FEATURE_SNAKE}_state.dart';
import 'package:$PACKAGE_NAME/presentation/theme/text/app_text.dart';

class ${ENTITY_CAMEL}${class_suffix} extends StatelessWidget {
  const ${ENTITY_CAMEL}${class_suffix}({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppText.titleLargeBold('$ENTITY_CAMEL')),
      body: BlocBuilder<${ENTITY_CAMEL}Cubit, ${ENTITY_CAMEL}State>(
        builder: (context, state) {
          return switch (state.status) {
            Loading() => const Center(child: CircularProgressIndicator()),
            Failure(:final ResponseError responseError) => Center(
              child: AppText.bodyLarge(
                context.errorLocalization.responseError(responseError),
                textAlign: TextAlign.center,
              ),
            ),
            Success() =>
              state.items.isEmpty
                  ? const Center(child: Text('No items found'))
                  : ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) => ListTile(
                        title: AppText.bodyLarge(state.items[index]),
                      ),
                    ),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
EOF
  fi
}

write_view "$PORTRAIT_VIEW_FILE" "PortraitView"
write_view "$LANDSCAPE_VIEW_FILE" "LandscapeView"

fi

# ---------------------------
# ListView Component
# ---------------------------
if [ "$GEN_PRESENTATION" = 1 ] && [ "$GEN_DOMAIN" = 1 ] && [ "$WITH_CUBIT" = 1 ]; then
cat <<EOF > "$LIST_VIEW_FILE"
import 'package:flutter/material.dart';
import 'package:$PACKAGE_NAME/domain/entity/base/base_entity.dart';
import 'package:$PACKAGE_NAME/presentation/theme/text/app_text.dart';

class ${ENTITY_CAMEL}ListView extends StatelessWidget {
  const ${ENTITY_CAMEL}ListView({required this.items, super.key});

  final List<${ENTITY_CAMEL}Entity> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: AppText.bodyLarge(item.title),
          subtitle: AppText.bodySmall('ID: \${item.id}'),
        );
      },
    );
  }
}
EOF
fi

# ---------------------------
# Add route to app_router.dart
# ---------------------------
ROUTE_LINE="AutoRoute(page: ${ENTITY_CAMEL}Route.page),"
if [ "$GEN_PRESENTATION" = 0 ]; then
  :
elif ! _require_file "$APP_ROUTER_FILE"; then
  :
elif grep -Fq "$ROUTE_LINE" "$APP_ROUTER_FILE"; then
  echo "   • app_router.dart: ${ENTITY_CAMEL}Route already registered"
else
  ROUTER_TMP=$(_new_tmp)
  awk -v line="    $ROUTE_LINE" '
    /List<AutoRoute> get routes => \[/ { in_routes = 1 }
    in_routes && !inserted && /^[[:space:]]*\];/ {
      print line
      inserted = 1
      in_routes = 0
    }
    { print }
  ' "$APP_ROUTER_FILE" > "$ROUTER_TMP" && mv "$ROUTER_TMP" "$APP_ROUTER_FILE"
  echo "   • app_router.dart: added ${ENTITY_CAMEL}Screen route"
fi

# ---------------------------
# Format + code generation
# ---------------------------
# Only the paths this run actually touched.
TOUCHED=()
[ "$GEN_DOMAIN" = 1 ] &&
  TOUCHED+=("$DOMAIN_ENTITY_DIR" "$DOMAIN_REPO_DIR" "$DOMAIN_USECASE_DIR" "$BASE_ENTITY_FILE")
[ "$GEN_DATA" = 1 ] && TOUCHED+=("$DATA_REPO_IMPL_DIR")
if [ "$GEN_DATA" = 1 ] && [ "$WITH_DATA_SOURCE" = 1 ]; then
  TOUCHED+=("$DATA_MODEL_DIR" "$DATA_DS_DIR" "$DATA_REMAPPER_FILE" "$FACTORY_DIR" "$BASE_RESPONSE_FILE")
fi
[ "$GEN_PRESENTATION" = 1 ] && TOUCHED+=("$PRESENTATION_DIR" "$APP_ROUTER_FILE")

if command -v dart >/dev/null 2>&1 && [ ${#TOUCHED[@]} -gt 0 ]; then
  dart format "${TOUCHED[@]}" >/dev/null
fi

if [ "$RUN_BUILD" = 1 ]; then
  echo "🔹 Running build_runner..."
  if command -v flutter >/dev/null 2>&1; then
    flutter pub get
  else
    dart pub get
  fi
  dart run build_runner build --delete-conflicting-outputs

  if command -v flutter >/dev/null 2>&1 && [ ${#TOUCHED[@]} -gt 0 ]; then
    echo "🔹 Analyzing..."
    flutter analyze "${TOUCHED[@]}" ||
      echo "⚠️  Analyzer reported issues in the generated feature (see above)."
  fi
else
  echo "⏭️  Skipped pub get / build_runner / analyze (--skip-build)."
  echo "   Run: dart run build_runner build --delete-conflicting-outputs"
fi

echo "🎉 Feature '$FEATURE_NAME' generated successfully!"
if [ "$GEN_DATA" = 1 ] && [ "$WITH_DATA_SOURCE" = 1 ]; then
  echo "   development flavor → ${ENTITY_CAMEL}MockDataSource"
  echo "   staging/production → ${ENTITY_CAMEL}RemoteDataSource (set the endpoint paths)"
fi
