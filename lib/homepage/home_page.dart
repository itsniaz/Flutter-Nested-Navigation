import 'package:flutter/material.dart';
import 'package:nested_navigation/screen_a/screen-a.dart';
import 'package:nested_navigation/screen_b/screen_b.dart';
import 'package:nested_navigation/widgets/route_page.dart';

import '../widgets/RoundedButton.dart';


final navigatorKeyScreenA = GlobalKey<NavigatorState>();
final navigatorKeyScreenB = GlobalKey<NavigatorState>();

class DemoHomePage extends StatelessWidget {
  const DemoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nested Navigation Example'),
        elevation: 4,
      ),
      body:   Column(
        children: [
          /* Screen A */

          Flexible(flex : 2,child: Navigator(
              key: navigatorKeyScreenA,
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) => const ScreenA(),
                );
              },
          )),

          /* Screen B */

          Flexible(flex : 2,child: Navigator(
            key: navigatorKeyScreenB,
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => const ScreenB(),
              );
            },
          )),

          const Divider(height: 4,),
          /* Control Center */
        Flexible(flex: 1,child: Row(
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text("Screen A",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    const SizedBox(height: 16.0,),
                    Wrap(
                      spacing: 8.0,
                     children: [
                       RoundedButton(title: "1",color: Colors.red,onPressed: _navigateToRoutedScreen(navigatorKeyScreenA,"1",Colors.red)),
                       RoundedButton(title: "2",color: Colors.green,onPressed: _navigateToRoutedScreen(navigatorKeyScreenA,"2",Colors.green)),
                       RoundedButton(title: "3",color: Colors.blue,onPressed: _navigateToRoutedScreen(navigatorKeyScreenA,"3",Colors.blue)),
                     ]
                    ),
                    const SizedBox(height:8.0),
                    RoundedButton(title: "<--",color: Colors.orange,onPressed: _handleBackPress(navigatorKeyScreenA),),
                  ],
                ),
              )),
              const VerticalDivider(),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text("Screen B",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    const SizedBox(height: 16.0,),
                    Wrap(
                        spacing: 8.0,
                        children: [
                          RoundedButton(title: "4",color: Colors.black,onPressed: _navigateToRoutedScreen(navigatorKeyScreenB,"4",Colors.black)),
                          RoundedButton(title: "5",color: Colors.deepPurple,onPressed: _navigateToRoutedScreen(navigatorKeyScreenB,"5",Colors.deepPurple)),
                          RoundedButton(title: "6",color: Colors.teal,onPressed: _navigateToRoutedScreen(navigatorKeyScreenB,"6",Colors.teal)),
                        ]
                    ),
                    const SizedBox(height:8.0),
                    RoundedButton(title: "<--",color: Colors.orange,onPressed: _handleBackPress(navigatorKeyScreenB),),
                  ],
                ),
              )),
            ],
          )),
        ],
      )
    );
  }

  Function() _navigateToRoutedScreen(GlobalKey<NavigatorState> key,String text,Color color){
    return ()=>key.currentState!.push(PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => RoutePage(text: text,color: color,),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ));
  }

  Function() _handleBackPress(GlobalKey<NavigatorState> key){
    return (){
      if(key.currentState!.canPop()){
        key.currentState!.pop();
      }
    };
  }
}