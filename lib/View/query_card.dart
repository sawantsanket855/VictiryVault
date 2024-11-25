import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class QueryCard extends StatefulWidget {
  final Map<String, dynamic> m1;
  QueryCard({required this.m1});
  @override
  _QueryCardState createState() => _QueryCardState();
}

class _QueryCardState extends State<QueryCard> {
  Future<void> sendEmail(BuildContext context, String reciverusername) async {
    // Replace with your email credentials
    String username = 'xjarvis13@gmail.com';
    String password = 'niyqmegeweajujdr'; // Generated app password

    // SMTP server configuration
    final smtpServer = gmail(username, password);

    // Create the email
    final message = Message()
      ..from = Address(username, 'Akshay Raut')
      ..recipients.add(reciverusername) // Replace with recipient's email
      ..subject = 'Query resloved '
      ..text = 'Thanks for your suggestion';

    try {
      await send(message, smtpServer);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email sent successfully!')),
      );
    } catch (e) {
      print('Email not sent: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send email.')),
      );
    }
  }
  bool isResolved = false; 
  @override
  Widget build(BuildContext context) {
    log("data of m1 is ${widget.m1}");
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  Text(
                    widget.m1['query'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.purple[900],
                    ),
                  ),
                  SizedBox(height: 8), // Spacing between query and name
                  // Name
                  Text(
                    widget.m1['date'],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[700],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                isResolved ? Icons.check_circle : Icons.error_outline,
                color: isResolved ? Colors.green : Colors.purple[300],
                size: 28,
              ),
              onPressed: () async {
                await sendEmail(context, widget.m1['email']);
                setState(() {
                  isResolved = !isResolved;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
