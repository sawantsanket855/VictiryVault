mport "package:flutter/material.dart";
import "package:intl/intl.dart";

class DateTimeb extends StatefulWidget {
  const DateTimeb({super.key});

  @override
  State<DateTimeb> createState() => _DateTimebState();
}

class _DateTimebState extends State<DateTimeb> {
  
  TextEditingController venurController=TextEditingController();

 




  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body:Center(
            child: Container(
              
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              color: const Color.fromARGB(255, 29, 54, 88),
              child: Column(
                    children: [
                      GestureDetector(
                      onTap: pickDate,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_today, 
                            color:  Color.fromARGB(255, 2, 88, 158)),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                selectedDate ?? "Select Date",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue.shade200,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                   const  SizedBox(height: 16),
              
                     GestureDetector(
                      onTap: pickTime,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.access_time, color:  Color.fromARGB(255, 2, 88, 158)),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                selectedTime ?? "Select Time",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue.shade200,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
              
              
                    ],
                  ),
            ),
          )
           
    );
  }
}