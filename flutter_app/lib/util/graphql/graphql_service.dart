// 概要: GraphQLサービス
// 目的: GraphQLクエリとミューテーションの実行を支援する
// 使用方法: GraphQLService.performQuery(query) または performMutation(mutation, variables: {...}) を使用

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:retry/retry.dart';
import 'package:logging/logging.dart';

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
    try {
      final QueryOptions options = QueryOptions(
        document: gql(query),
        variables: variables ?? {},
      );
      _logger.info('Performing query: $query');
      return await _retry(() => client.value.query(options));
    } catch (e, stackTrace) {
      _logger.severe('Error performing query: $e\n$stackTrace');
      rethrow;
    }
  }

  static Future<QueryResult> performMutation(
    String mutation, {
    Map<String, dynamic>? variables,
  }) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(mutation),
        variables: variables ?? {},
      );
      _logger.info('Performing mutation: $mutation');
      return await _retry(() => client.value.mutate(options));
    } catch (e, stackTrace) {
      _logger.severe('Error performing mutation: $e\n$stackTrace');
      rethrow;
    }
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
