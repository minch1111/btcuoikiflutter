import 'package:flutter/material.dart';
import 'package:flutter_exam/screens/add_new_screen.dart';
import 'package:flutter_exam/theme.dart';
import 'package:flutter_exam/widgets/button.dart';

import 'list_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            const HomeBackground(),
            const FractionallySizedBox(
              heightFactor: 0.35,
              child: HomeContent()
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonNavigator(
                    fixedSize: MaterialStateProperty.all(
                      Size(
                        size.width * 0.9,
                        size.height * 0.065,
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(
                      PrimaryFont.medium(size.height * 0.03)
                    ),
                    content: 'CREATE',
                    route: '/add',
                    args: FormArguments(),
                  ),
                  const SizedBox(height: 20,),
                  ButtonNavigator(
                    fixedSize: MaterialStateProperty.all(
                      Size(
                        size.width * 0.9,
                        size.height * 0.065,
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(
                      PrimaryFont.medium(size.height * 0.03)
                    ),
                    content: 'STUDENT LIST',
                    route: '$ListScreen',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeBackground extends StatelessWidget {
  const HomeBackground({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.4,
        widthFactor: 1,
        child: FittedBox(
          fit: BoxFit.contain,
          alignment: Alignment.topCenter,
          clipBehavior: Clip.antiAlias,
          child: Image.asset('assets/images/img_bg.png'),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(flex: 1,),
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 2.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Student management',
                  style: PrimaryFont.bold(35).copyWith(
                    color: Colors.amber,
                    height: 1.5
                  ),
                  children: [
                    TextSpan(
                      text: '\nDev by: Bui Minh Chien - 18DH110894 \n Nguyen Huu Tri - 18DH110877',
                      style: PrimaryFont.light(20).copyWith(
                      color: Colors.black
                    )
                  )
                ]
              )
            ),
          ),
        ),
      ]
    );
  }
}
