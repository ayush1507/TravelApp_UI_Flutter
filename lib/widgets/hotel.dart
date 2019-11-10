import 'package:flutter/material.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:travel_app/models/hotel_model.dart';

class HotelPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Exclusive Hotels',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      letterSpacing: 1.5)),
              Text('See All',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16.0,
                      color: Theme.of(context).primaryColor,
                      letterSpacing: 1.0)),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300.0,
          child: ListView.builder(
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              Hotel beta = hotels[index];
              return Container(
                width: 240.0,
                margin: EdgeInsets.all(10.0),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      bottom: 15.0,
                      child: Container(
                          height: 120.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  beta.name,
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2),
                                ),
                                SizedBox(height: 2.0,),
                                Text(
                                  beta.address,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 2.0,)
                                ,Text('\$${beta.price}/night',
                                style: TextStyle(fontSize: 18.0,
                                fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0)
                          ]),
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            child: Image(
                              height: 180.0,
                              width: 220.0,
                              image: AssetImage(beta.imageUrl),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
