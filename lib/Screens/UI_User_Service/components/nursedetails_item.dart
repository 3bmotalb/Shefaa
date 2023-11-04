import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../models/nurse_details.dart';

class nursedetails_item extends StatefulWidget {
  const nursedetails_item({Key? key, required this.nursedetails})
      : super(key: key);
  final Nursedetails nursedetails;

  @override
  State<nursedetails_item> createState() => _nursedetails_itemState();
}

class _nursedetails_itemState extends State<nursedetails_item> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xffFF9A2B),
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 16.0,
            child: ClipRRect(
              child: Image.asset(widget.nursedetails.image),
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 250,
          height: 20,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              widget.nursedetails.name,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Card(
          child: RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                // ignore: unrelated_type_equality_checks
                widget.nursedetails.rate == rating;
              });

            },
          ),
        ),
        const SizedBox(height: 30),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            "About",
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              widget.nursedetails.details,
              style: const TextStyle(fontSize: 20),
              minFontSize: 15,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.calendar_today),
          label: const Text('view accessibility'),
          style: ElevatedButton.styleFrom(
              primary: const Color(0xffFF9A2B),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
        ),
      ],
    );
  }
}
