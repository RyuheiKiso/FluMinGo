import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/util/graphql/graphql_service.dart';
import 'graphql_service_test.mocks.dart';

@GenerateMocks([GraphQLClient])
void main() {
  late MockGraphQLClient mockGraphQLClient;

  setUp(() {
    mockGraphQLClient = MockGraphQLClient();
    // No need to instantiate GraphQLService
  });

  test('Test GraphQLService query', () async {
    final options = QueryOptions(document: gql('query { test }'));
    when(mockGraphQLClient.query(options)).thenAnswer((_) async => QueryResult(data: {'test': 'value'}, options: options, source: QueryResultSource.network));

    final result = await GraphQLService.performQuery('query { test }');

    expect(result.data, {'test': 'value'});
  });

  test('Test GraphQLService mutate', () async {
    final options = MutationOptions(document: gql('mutation { test }'));
    when(mockGraphQLClient.mutate(options)).thenAnswer((_) async => QueryResult(data: {'test': 'value'}, options: options, source: QueryResultSource.network));

    final result = await GraphQLService.performMutation('mutation { test }');

    expect(result.data, {'test': 'value'});
  });
}
