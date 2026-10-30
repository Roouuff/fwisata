// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:navigasi_wisata_application/main.dart';

void main() {
  testWidgets('beranda menampilkan judul dan empat menu kategori', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const WisataApp());

    expect(find.text('Wisata Indonesia'), findsOneWidget);
    final gridFinder = find.byType(GridView);
    expect(
      find.descendant(of: gridFinder, matching: find.text('Pantai')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: gridFinder, matching: find.text('Gunung')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: gridFinder, matching: find.text('Budaya')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: gridFinder, matching: find.text('Kuliner')),
      findsOneWidget,
    );
    expect(gridFinder, findsOneWidget);
    final grid = tester.widget<GridView>(gridFinder);
    expect(grid.gridDelegate, isA<SliverGridDelegateWithFixedCrossAxisCount>());
    expect(
      (grid.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount)
          .crossAxisCount,
      2,
    );
  });

  testWidgets('menu kategori membuka halaman dan tombol kembali berfungsi', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const WisataApp());

    final menuPantai = find.descendant(
      of: find.byType(GridView),
      matching: find.text('Pantai'),
    );
    await tester.tap(menuPantai);
    await tester.pumpAndSettle();

    expect(find.text('Apa itu Pantai?'), findsOneWidget);

    await tester.tap(find.byTooltip('Kembali'));
    await tester.pumpAndSettle();

    expect(find.text('Wisata Indonesia'), findsOneWidget);
  });

  testWidgets('halaman detail menampilkan parameter dan dapat kembali', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const WisataApp());

    final menuPantai = find.descendant(
      of: find.byType(GridView),
      matching: find.text('Pantai'),
    );
    await tester.tap(menuPantai);
    await tester.pumpAndSettle();

    final halamanPantai = find.text('Apa itu Pantai?');
    expect(halamanPantai, findsOneWidget);
    Navigator.of(tester.element(halamanPantai))
        .pushNamed('/detail', arguments: 'Pantai Klayar');
    await tester.pumpAndSettle();

    expect(find.text('Detail Wisata'), findsOneWidget);
    expect(find.text('Pantai Klayar'), findsOneWidget);

    await tester.tap(find.text('Kembali'));
    await tester.pumpAndSettle();
    expect(find.text('Apa itu Pantai?'), findsOneWidget);
  });
}
