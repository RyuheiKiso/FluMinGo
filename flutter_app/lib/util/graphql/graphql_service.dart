import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:retry/retry.dart';
import 'package:logging/logging.dart';

// 各画面からの使用方法
// 1. GraphQLServiceクラスをインポートします。
// import 'package:your_app/util/graphql/graphql_service.dart';

// 2. クエリを実行する場合：
// String query = '''
//   query GetItems {
//     items {
//       id
//       name
//     }
//   }
// ''';
// QueryResult result = await GraphQLService.performQuery(query);
// if (result.hasException) {
//   GraphQLService.handleError(result);
// } else {
//   // 結果を処理します
// }

// 3. ミューテーションを実行する場合：
// String mutation = '''
//   mutation AddItem(
//     $name: String!
//   ) {
//     addItem(name: $name) {
//       id
//       name
//     }
//   }
// ''';
// Map<String, dynamic> variables = {'name': 'NewItem'};
// QueryResult result = await GraphQLService.performMutation(mutation, variables: variables);
// if (result.hasException) {
//   GraphQLService.handleError(result);
// } else {
//   // 結果を処理します
// }

// 4. クライアントを取得する場合：
// ValueNotifier<GraphQLClient> client = GraphQLService.getClient();

class GraphQLService {
  static final HttpLink httpLink = HttpLink(
    'https://your-graphql-endpoint.com/graphql',
  );

  static final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  static final Link link = authLink.concat(httpLink);

  static ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(cache: GraphQLCache(store: InMemoryStore()), link: link),
  );

  static final Logger _logger = Logger('GraphQLService');

  static Future<QueryResult> performQuery(
    String query, {
    Map<String, dynamic>? variables,
  }) async {
    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: variables ?? {},
    );
    _logger.info('Performing query: $query');
    return await _retry(() => client.value.query(options));
  }

  static Future<QueryResult> performMutation(
    String mutation, {
    Map<String, dynamic>? variables,
  }) async {
    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: variables ?? {},
    );
    _logger.info('Performing mutation: $mutation');
    return await _retry(() => client.value.mutate(options));
  }

  static Future<QueryResult> _retry(
    Future<QueryResult> Function() operation,
  ) async {
    return await retry(operation, retryIf: (e) => e is NetworkException);
  }

  static void handleError(QueryResult result) {
    if (result.hasException) {
      _logger.severe('GraphQL Error: ${result.exception.toString()}');
    }
  }

  static ValueNotifier<GraphQLClient> getClient() {
    return client;
  }
}
