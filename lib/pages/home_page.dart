import 'package:flutter/material.dart';
import 'package:reubro_mtask/core/colors.dart';
import 'package:reubro_mtask/core/constants.dart';
import 'package:reubro_mtask/models/categories_model.dart';
import 'package:reubro_mtask/models/top_authors_model.dart';
import 'package:reubro_mtask/widgets/categories_tile.dart';
import 'package:reubro_mtask/widgets/r_app_bar.dart';
import 'package:reubro_mtask/widgets/top_authors_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final CategoriesModel categoriesModel = CategoriesModel();
  final TopAuthorsModel topAuthorsModel = TopAuthorsModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rBackgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: RAppBar()
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopTiles(context),
              rHeightBox45,
              Text("Select Categories", style: titleTextStyle,),
              _buildCategoriesTiles(context),
              rHeightBox45,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Top Authors", style: titleTextStyle,),
                  Text("View all", style: TextStyle(color: rGreyColor, fontSize: 20,),)
                ],
              ),
              _buildTopAuthorsTiles(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopTiles(context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
        primary: false,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1/1,
        ),
        itemCount: 2,
        itemBuilder: (context, index) => CategoriesTile(
          title: categoriesModel.categoriesItems[index][0],
          imagePath: categoriesModel.categoriesItems[index][1],
          color: categoriesModel.categoriesItems[index][2],
          onTap: () {
            if (categoriesModel.categoriesItems[index] == categoriesModel.categoriesItems[0]){
              Navigator.pushNamed(context, "/selectLevelsPage");
            }
          },
        )
    );
  }

  Widget _buildCategoriesTiles(context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: 2,
        itemBuilder: (context, index) => CategoriesTile(
            title: categoriesModel.categoriesItems[index+2][0],
            imagePath: categoriesModel.categoriesItems[index+2][1],
            color: categoriesModel.categoriesItems[index+2][2],
        )
    );
  }

  Widget _buildTopAuthorsTiles(context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: topAuthorsModel.topAuthors.length,
          itemBuilder: (context, index) => TopAuthorsTile(
            profileImagePath: topAuthorsModel.topAuthors[index][1],
            name: topAuthorsModel.topAuthors[index][0],
          )
      ),
    );
  }
}
