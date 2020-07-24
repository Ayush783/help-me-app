import 'package:flutter/material.dart';
import 'package:help_me/Models/FirstAidDataModel.dart';
import 'package:help_me/Models/first_aid_content_model.dart';
import 'package:help_me/ui/screens/first_aid_screens/first_aid_content_screen.dart';
import 'package:provider/provider.dart';

//custom widget for first aid screen
class FirstAid extends StatelessWidget {
  final String title;
  FirstAid({this.title});
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<FirsAidDataRepository>(context);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: size.width * 0.058, vertical: 8),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              Map map;
              for (int i = 0; i < data.firstAidData.length; i++) {
                if (data.firstAidData[i]['woundType'] == title)
                  map = Map.from(data.firstAidData[i]);
              }
              final FirstAidContentModel content = FirstAidContentModel(map);
              return Provider<FirstAidContentModel>.value(
                value: content,
                child: FirstAidContent(),
              );
            }));
          },
        ),
      ),
    );
  }
}

//first aid card list
List<FirstAid> firstAidList = [
  FirstAid(
    title: "Basic First Aid Guide",
  ),
  FirstAid(
    title: "Guidelines for dressing a wound",
  ),
  FirstAid(
    title: "When to seek Medical care",
  ),
  FirstAid(
    title: "Building a First Aid Kit",
  ),
  FirstAid(
    title: "Scrapes",
  ),
  FirstAid(
    title: "Cuts and Tears",
  ),
  FirstAid(
    title: "Puncture Wounds",
  ),
  FirstAid(
    title: "Nosebleeds",
  ),
  FirstAid(
    title: "Splinters",
  ),
  FirstAid(
    title: "Animal bites and insect stings",
  ),
  FirstAid(
    title: "Bee, Wasp Sting",
  ),
  FirstAid(
    title: "Mosquito Bite",
  ),
  FirstAid(
    title: "Sprains and Strains",
  ),
  FirstAid(
    title: "Burn",
  ),
  FirstAid(
    title: "Sunburn",
  ),
  FirstAid(
    title: "Mild Choking",
  ),
  FirstAid(
    title: "Severe Choking",
  ),
  FirstAid(
    title: "Electric Shock",
  ),
  FirstAid(
    title: "Heart Attack",
  ),
  FirstAid(
    title: "Poisoning",
  ),
];
