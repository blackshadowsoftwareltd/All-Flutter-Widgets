import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SelectableText(
            'Contrary to popular belief, Lorem Ipsum is not simply random text.'
            'It has roots in a piece of classical Latin literature from 45 BC,'
            'making it over 2000 years old. Richard McClintock, '
            'a Latin professor at Hampden-Sydney College in Virginia, '
            'looked up one of the more obscure Latin words, consectetur,'
            ' from a Lorem Ipsum passage,'
            'and going through the cites of the word in classical literature,'
            ' discovered the undoubtable source.'
            'Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of '
            '"de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero,'
            'written in 45 BC. This book is a treatise on the theory of ethics,'
            'very popular during the Renaissance. The first line of Lorem Ipsum,'
            '"Lorem ipsum dolor sit amet..", '
            'comes from a line in section 1.10.32.'
            'Contrary to popular belief, Lorem Ipsum is not simply random text.'
            'It has roots in a piece of classical Latin literature from 45 BC,'
            'making it over 2000 years old. Richard McClintock, '
            'a Latin professor at Hampden-Sydney College in Virginia, '
            'looked up one of the more obscure Latin words, consectetur,'
            ' from a Lorem Ipsum passage,'
            'and going through the cites of the word in classical literature,'
            ' discovered the undoubtable source.'
            'Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of '
            '"de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero,'
            'written in 45 BC. This book is a treatise on the theory of ethics,'
            'very popular during the Renaissance. The first line of Lorem Ipsum,'
            '"Lorem ipsum dolor sit amet..", '
            'comes from a line in section 1.10.32.'
            'Contrary to popular belief, Lorem Ipsum is not simply random text.'
            'It has roots in a piece of classical Latin literature from 45 BC,'
            'making it over 2000 years old. Richard McClintock, '
            'a Latin professor at Hampden-Sydney College in Virginia, '
            'looked up one of the more obscure Latin words, consectetur,'
            ' from a Lorem Ipsum passage,'
            'and going through the cites of the word in classical literature,'
            ' discovered the undoubtable source.'
            'Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of '
            '"de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero,'
            'written in 45 BC. This book is a treatise on the theory of ethics,'
            'very popular during the Renaissance. The first line of Lorem Ipsum,'
            '"Lorem ipsum dolor sit amet..", '
            'comes from a line in section 1.10.32.',
            style: TextStyle(
                fontSize: 18,
                color: Colors.grey[900],
                fontWeight: FontWeight.w400),

            /// toolbar options
            toolbarOptions: ToolbarOptions(
              copy: true,
              cut: true,
              paste: true,
              selectAll: true,
            ),

            /// iOS scrool physics
            scrollPhysics: BouncingScrollPhysics(),

            /// Android scrool physics
            // scrollPhysics: ClampingScrollPhysics(),
            onTap: () => print('Clicked on the text'),
          ),
        ),
      ),
    );
  }
}
