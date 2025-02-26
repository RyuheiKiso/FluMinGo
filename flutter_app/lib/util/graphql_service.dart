import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  // GraphQL client instance
  final GraphQLClient graphQLClient;

  // Constructor to initialize the GraphQL client
  GraphQLService({required this.graphQLClient});

  // Executes a GraphQL query
  Future<QueryResult> query(QueryOptions options) async {
    try {
      return await graphQLClient.query(options);
    } catch (e) {
      // Handle and log the error
      throw Exception('Failed to execute query: $e');
    }
  }

  // Executes a GraphQL mutation
  Future<QueryResult> mutate(MutationOptions options) async {
    try {
      return await graphQLClient.mutate(options);
    } catch (e) {
      // Handle and log the error
      throw Exception('Failed to execute mutation: $e');
    }
  }
}
