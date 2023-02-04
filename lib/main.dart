import 'package:flutter/material.dart';
import 'package:toonflix/widgets/Button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Hey, Selena',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '\$ 5 194 482',
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Button(
                      text: 'Transfer',
                      bgColor: Color(0xFFF1b33b),
                      textColor: Colors.black,
                    ),
                    Button(
                      text: 'Request',
                      bgColor: Color(0xFF1F2123),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Wallets',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w600)),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // Container(
                //   clipBehavior: Clip.hardEdge,
                //   decoration: BoxDecoration(
                //     color: const Color(0xFF1F2123),
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(30),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             const Text(
                //               'Euro',
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 32,
                //                 fontWeight: FontWeight.w600,
                //               ),
                //             ),
                //             const SizedBox(
                //               height: 10,
                //             ),
                //             Row(
                //               children: [
                //                 const Text(
                //                   '6 428 ',
                //                   style: TextStyle(
                //                     color: Colors.white,
                //                     fontSize: 20,
                //                   ),
                //                 ),
                //                 const SizedBox(
                //                   width: 5,
                //                 ),
                //                 Text(
                //                   'EUR',
                //                   style: TextStyle(
                //                     color: Colors.white.withOpacity(0.8),
                //                   ),
                //                 ),
                //               ],
                //             )
                //           ],
                //         ),
                //         Transform.scale(
                //           scale: 2.2,
                //           child: Transform.translate(
                //             offset: const Offset(-5, 12),
                //             child: const Icon(
                //               Icons.euro_rounded,
                //               color: Colors.white,
                //               size: 88,
                //             ),
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                const CurrencyCard(
                  name: 'Euro',
                  code: 'EUR',
                  amount: '6 428',
                  icon: Icons.euro_rounded,
                  isInverted: false,
                ),
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: const CurrencyCard(
                    name: 'Bitcoin',
                    code: 'BTC',
                    amount: '9 222',
                    icon: Icons.currency_bitcoin,
                    isInverted: true,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -40),
                  child: const CurrencyCard(
                    name: 'Dollor',
                    code: 'USD',
                    amount: '6 428',
                    icon: Icons.attach_money_outlined,
                    isInverted: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
