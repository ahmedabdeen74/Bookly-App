import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:bookly_app/core/utils/function/launch_url.dart';
import 'package:flutter/material.dart';
import 'book_details_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                const SizedBox(
                  height: 10,
                ),
                BookDetailsSection(
                  bookModel: bookModel,
                ),
                BooksAction(
                    text: getText(bookModel),
                    onPressed: (){
                      launchCustomUrl(
                          context, 'bookModel.volumeInfo.previewLink!');
                    }),
                const Expanded(
                  //resposive ui in all screen text and listview always in bottom and use child scroll view because i dont know height of screen low or high than my current screen.
                  child: SizedBox(
                    height: 40,
                  ),
                ),
                const SimilarBooksSection(),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
