import 'package:flutter/material.dart';
import 'package:lunix/components/ticket-buy-page.dart';
import 'package:lunix/components/ticketList.dart';

class LotteryTicket extends StatefulWidget {
  const LotteryTicket({super.key});

  @override
  State<LotteryTicket> createState() => _LotteryTicketState();
}

class _LotteryTicketState extends State<LotteryTicket> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5B3FC0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B3FC0),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 30,
              width: 30,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Button Row for Switching Containers
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Button 1
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: selectedIndex == 0
                            ? Colors.white.withOpacity(0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'My tickets',
                          style: TextStyle(
                            color: selectedIndex == 0
                                ? Colors.white
                                : Colors.white.withOpacity(0.6),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Button 2
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: selectedIndex == 1
                            ? Colors.white.withOpacity(0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Buy tickets',
                          style: TextStyle(
                            color: selectedIndex == 1
                                ? Colors.white
                                : Colors.white.withOpacity(0.6),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container Switching Logic
          Expanded(
            child: selectedIndex == 0
                ? TicketsList()
                :TicketBuy()
          ),
        ],
      ),
    );
  }
}
