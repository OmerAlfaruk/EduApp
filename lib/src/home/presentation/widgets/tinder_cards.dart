import 'package:education_app/core/extensions/context_extension.dart';
import 'package:education_app/core/res/media_res.dart';
import 'package:education_app/src/home/presentation/widgets/tinder_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard_2/flutter_tindercard_2.dart';

class TinderCards extends StatefulWidget {
  const TinderCards({super.key});

  @override
  State<TinderCards> createState() => _TinderCardsState();
}

class _TinderCardsState extends State<TinderCards>
    with TickerProviderStateMixin {
  final CardController controller = CardController();
  int totalCard = 20;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.width,
      width: context.width,
      child: TinderSwapCard(
        cardController: controller,
        totalNum: totalCard,
        swipeEdge: 4,
        swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
          // Get card alignment
          if (align.x < 0) {
            // Card is left swiping
          } else if (align.x > 0) {
            // Card is right Swiping
          }
        },
        swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
          // if card is the last card add more card to swipe
          if (index == totalCard - 1) {
            totalCard += 10;
          }
        },

        maxWidth: context.width,
        maxHeight: context.width * .9,
        minWidth: context.width * .61,
        minHeight: context.width * .85,
        cardBuilder: (context, index) {
          final isFirst = index == 0;
          final colorByIndex =
              index == 1 ? const Color(0xffda92fc) : const Color(0xffdc95fb);
          return Stack(
    
            children: [
              Positioned(
                bottom: 115,
                right: 0,
                left: 0,
                child: TinderCard(
                  isFirst: isFirst,
                  colour: isFirst ? null : colorByIndex,
                ),
              ),
              if (isFirst)
                Positioned(
                    bottom: 130,
                    right: 20,
                    child: Image.asset(
                      MediaRes.microscope,
                      height: 180,
                      width: 149,
                    ))
            ],
          );
        },
      ),
    );
  }
}
