import 'package:bookly/features/home/presentation/view/components/app_bar.dart';
import 'package:bookly/features/home/presentation/view/components/custom_best_seller_book_item.dart';
import 'package:bookly/features/home/presentation/view/components/custom_book_listview.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BooksListViewHorizontal(),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 16, top: 50),
                    child: Text(
                      'Best Seller',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const BooksListViewHorizontal(),
          //       Padding(
          //         padding: const EdgeInsetsDirectional.only(start: 16,top: 50),
          //         child: Text(
          //           'Best Seller',
          //           style: Theme.of(context).textTheme.titleMedium,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 16.0,
                top: 20,
                end: 16,
              ),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    const CustomBestSellerBookItem(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 24),
                itemCount: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
