import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsSummary extends StatelessWidget {
  const ResultsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        //this widgets allows us to scroll through its chilrd (column for us)!
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  margin: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: data['user_answer'] == data['correct_answer']
                        ? Colors.blue
                        : const Color.fromARGB(255, 255, 111, 140),
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: Center(
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                //so we access the values by indicating the keys
                //'as' keyword (typecasting)-> tells dart which type of object it is (we gave it Object value)
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //w/o expanded, column goes infinitely, beyond the screen. expanded allows it to take the available space in the main axis of the parent (row)
                      children: [
                        Text((data['question'] as String),
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        //const SizedBox(height: 3),
                        Text((data['user_answer'] as String),
                            style: GoogleFonts.lato(
                                color: const Color.fromARGB(255, 186, 151, 247),
                                fontSize: 18)),
                        //const SizedBox(height: 3),
                        Text((data['correct_answer'] as String),
                            style: GoogleFonts.lato(
                                color: const Color.fromARGB(255, 124, 196, 255),
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
          //because children wants list of widgets, we convert list of maps to list of iterables, then to lists
        ),
      ),
    );
  }
}
