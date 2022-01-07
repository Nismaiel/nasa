import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa/blocs/images_cubit.dart';
import 'package:nasa/data/picturesModel.dart';

import 'imageDetails.dart';
import 'imageItem.dart';

class SearchImages extends SearchDelegate {

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<ImagesCubit, ImagesState>(
      builder: (context, state) {
      if(state is ImagesLoaded||state is OfflineImagesLoaded){
        if (query.isNotEmpty ) {
          List<Images> images = state.images
              .where((element) =>
          element.title!.toLowerCase().contains(query.toLowerCase()) ||
              element.date!.toLowerCase().contains(query))
              .toList();
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => ImageDetails(image: images[index]),
                    ));
                  },
                  child: ImageItem(image: images[index]));
            },
          );
        }else {
          return const Center(
            child: Text(
              'search images',
              style: TextStyle(color: Colors.black),
            ),
          );
        }
      } else {
        return const Center(
          child: Text(
            'search images',
            style: TextStyle(color: Colors.black),
          ),
        );
      }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text(
        'search images',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
