import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa/blocs/images_cubit.dart';
import 'package:nasa/data/picturesModel.dart';
import 'package:nasa/presentation/widgets.dart';

class ImageDetails extends StatelessWidget {
  final Images image;
  const ImageDetails({required this.image,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenElements screenElements=ScreenElements();
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.2,
                  child: CachedNetworkImage(imageUrl:
                    image.url.toString(),
                    fit: BoxFit.fill,
                  ),
                ),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18, left: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        image.title.toString(),
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: .27,
                          color: Color(0xFF17262A),
                        ),
                      ),
                      Text(
                       image.date.toString(),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 22,
                          letterSpacing: .27,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BlocBuilder<ImagesCubit,ImagesState>(builder: (context, state) {
                        if(state is OfflineImagesLoaded){
                          return screenElements.offlineSign();
                        }else{return const SizedBox();}
                      },),
                      const Divider(),
                      const Text(
                        'explanation:',
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: Text(
                             image.explanation.toString(),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  letterSpacing: .27,
                                  color: Colors.black),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
