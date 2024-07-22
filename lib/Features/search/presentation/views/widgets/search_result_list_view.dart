import 'package:flutter/material.dart';
class SearchResultSearchView extends StatelessWidget {
  const SearchResultSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: // BestSellerListViewItem(),
        Text('data'),
      );
    });
  }
}