import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa/blocs/images_cubit.dart';
import 'package:nasa/presentation/imageDetails.dart';
import 'package:nasa/presentation/imageItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ImagesCubit>().getAllImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ImagesCubit, ImagesState>(
      builder: (context, state) {
        if (state is ImagesLoaded) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: state.images.length - 1,
            itemBuilder: (context, index) {
              return InkWell(onTap: () {
                Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) =>
                        ImageDetails(image: state.images[index]),));
              }, child: ImageItem(image: state.images[index]));
            },
          );
        } else if (state is ImagesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ImagesError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
