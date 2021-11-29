import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/AddTaskPage.dart';
import 'package:flutter_todo_app/ToDoPage.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:integration_test/integration_test.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('todopage test',(){
    testWidgets('After opening of home screen ,go to add task page by tap the Fab and come back to task page by add button',(WidgetTester tester)async{
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 2));

      expect(find.byType(ToDoPage), findsOneWidget);
      expect(find.byType(AddTaskPage),findsNothing);
      await tester.pumpAndSettle();


        final Finder fab = find.byIcon(Icons.add);
        await tester.tap(fab);
        await tester.pumpAndSettle();
      expect(find.byType(AddTaskPage), findsOneWidget);


      final Finder addTask= find.byKey(Key('add task'));
        await tester.tap(addTask);
        await tester.enterText(addTask, 'buy clothes');
        await tester.pumpAndSettle(Duration(seconds: 1));



      final Finder addButton = find.byKey(Key('add task button'));
      await tester.tap(addButton);
      await tester.pumpAndSettle(Duration(seconds: 10));

      expect(find.byType(ToDoPage), findsOneWidget);
      // expect(find.byType(AddTaskPage), findsNothing);
    });


    testWidgets('Testing scrolling', (WidgetTester tester)async{
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 3));
      expect(find.byType(ToDoPage), findsOneWidget);
      await tester.fling(find.byType(ListView), Offset(0,-200), 3000);
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.add), findsOneWidget);

    });

  });
}