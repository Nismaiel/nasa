import 'package:flutter/material.dart';
import 'package:nasa/data/picturesModel.dart';

class ImageDetails extends StatefulWidget {
  final Images image;

  const ImageDetails({Key? key, required this.image}) : super(key: key);

  @override
  _ImageDetailsState createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.2,
                    child: Image.network(
                      widget.image.url.toString(),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
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
                        widget.image.title.toString(),
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
                        widget.image.date.toString(),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 22,
                          letterSpacing: .27,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                              widget.image.explanation.toString(),
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
