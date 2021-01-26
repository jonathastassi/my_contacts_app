import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:my_contacts_app/app/modules/contacts/repositories/interfaces/contact_repository_interface.dart';

class MockClient extends Mock implements Dio {}

void main() {
  IContactRepository repository;
  // MockClient client;

  setUp(() {
    // client = MockClient();
    // repository = ContactRepository(client);
  });

  group('ContactRepository Test', () {
    //  test("First Test", () {
    //    expect(repository, isInstanceOf<ContactRepository>());
    //  });

    test('returns a Post if the http call completes successfully', () async {
      //    when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
      //        .thenAnswer((_) async =>
      //            Response(data: {'title': 'Test'}, statusCode: 200));
      //    Map<String, dynamic> data = await repository.fetchPost(client);
      //    expect(data['title'], 'Test');
    });
  });
}
