import 'package:flutter/material.dart';
import 'package:row_belajar/model/tourism_place.dart';

class DetailScreen extends StatelessWidget {

  final TourismPlace place;

  DetailScreen(this.place);

  @override
  Widget build(BuildContext context) {
    return DetailMobilePage(place: place);
  }
}

class FavoriteButton extends StatefulWidget{
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>{

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget{
  final TourismPlace place;

  const DetailMobilePage({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Image.asset(place.imageAsset),
                        SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
                                      Navigator.pop(context);
                                    }),
                                  ),
                                  FavoriteButton(),
                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: Text(place.name,
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Icon(Icons.calendar_today),
                                SizedBox(height: 8.0),
                                Text(place.openDays)
                              ],
                            ),
                            Column(children: <Widget>[
                              Icon(Icons.alarm),
                              SizedBox(height: 8.0),
                              Text(place.openTime)
                            ]),
                            Column(
                              children: <Widget>[
                                Icon(Icons.account_balance),
                                SizedBox(height: 8.0),
                                Text(place.ticketPrice)
                              ],
                            )
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          place.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16.0),
                        )),
                    Container(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: place.imageUrls.map((url){
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.network(
                              url,
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ]),
            )
        ));
  }

}

class DetailWebPage extends StatelessWidget{
  final TourismPlace place;

  const DetailWebPage({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }

}
