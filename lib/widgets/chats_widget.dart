import 'package:flutter/material.dart';
import 'package:it_lectory_3/pages/students/chats.dart';
import 'package:it_lectory_3/widgets/style_text.dart';

class ChatCardWidget extends StatelessWidget {
  final String name;
  final String subtitle;
  final int indexMessage;
  const ChatCardWidget({
    super.key,
    required this.subtitle,
    required this.name,
    required this.indexMessage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>ChatMessenger(
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 385,
            decoration: BoxDecoration(
              color: Color.fromRGBO(53, 51, 51, 1),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                     style: TextStylesMain.alltxt,
                    ),
                    Text(
                      subtitle,
                      style: TextStylesMain.alltxt,
                    ),

                  ],
                ),
                const Spacer(),
                indexMessage != 0
                    ? Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(82, 203, 255, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(140),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '$indexMessage',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
