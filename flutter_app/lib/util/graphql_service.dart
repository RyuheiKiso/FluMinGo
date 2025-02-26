import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  final GraphQLClient graphQLClient;

  GraphQLService({required this.graphQLClient});

  Future<QueryResult> query(QueryOptions options) async {
    return await graphQLClient.query(options);
  }

  Future<QueryResult> mutate(MutationOptions options) async {
    return await graphQLClient.mutate(options);
  }
}