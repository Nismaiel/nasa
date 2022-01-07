import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa/blocs/images_cubit.dart';
import 'package:nasa/presentation/imageDetails.dart';
import 'package:nasa/presentation/imageItem.dart';
import 'package:nasa/presentation/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScreenElements screenElements = ScreenElements();
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  listenToConnectivity(){
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result == ConnectivityResult.none) {
        context.read<ImagesCubit>().getAllCachedImages();

      } else if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        context.read<ImagesCubit>().getAllImages();
      }
    });
  }
  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        context.read<ImagesCubit>().getAllCachedImages();

      } else if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        context.read<ImagesCubit>().getAllImages();

      }
    } on PlatformException catch (e) {
      print(e.toString());
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
if(!mounted){
  return Future.value(null);
}
  }

  @override
  void initState() {
    initConnectivity();
    listenToConnectivity();
    super.initState();
  }


  Widget imagesGrid(state) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: state.images.length - 1,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => ImageDetails(image: state.images[index]),
              ));
            },
            child: ImageItem(image: state.images[index]));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: BlocBuilder<ImagesCubit, ImagesState>(
        builder: (context, state) {
          if (state is ImagesLoaded) {
            return imagesGrid(state);
          } else if (state is OfflineImagesLoaded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [screenElements.offlineSign(), imagesGrid(state)],
                ),
              ),
            );
          } else if (state is ImagesLoading) {
            return screenElements.loading();
          } else if (state is ImagesError) {
            return Center(child: Text(state.message));
          } else {
            return screenElements.loading();
          }
        },
      ),
    ));
  }
}
