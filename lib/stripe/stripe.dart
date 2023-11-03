 import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:groceries_online/widgets/text_widget.dart'; // You may need to adjust this import.
import 'package:http/http.dart' as http;

class StripePayment extends StatefulWidget {
  const StripePayment({Key? key}) : super(key: key);

  @override
  State<StripePayment> createState() => _StripePaymentState();
}

class _StripePaymentState extends State<StripePayment> {
  Map<String, dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(
          text: 'Stripe Payment',
          color: Colors.purple,
          textSize: 22,
          isTitle: true,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async {
              print('Attempting Payment...');
              await makePayment();
            },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(color: Colors.green),
              child: Center(child: Text('Pay')),
            ),
          )
        ],
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntentData = await createPaymentIntent('20', 'USD');

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          applePay: true,
          googlePay: true,
          style: ThemeMode.dark,
          merchantDisplayName: 'USD',
          merchantCountryCode: '111',
        ),
      );
      displayPaymentSheet();
    } catch (e) {
      print('Exception: ' + e.toString());
    }
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet(
        parameters: PresentPaymentSheetParameters(
          clientSecret: paymentIntentData!['client_secret'],
          confirmPayment: true,
        ),
      );
      setState(() {
        paymentIntentData = null;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Payment Successful')));
    } on StripeException catch (e) {
      print('StripeException: ' + e.toString());
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Text('Payment Cancelled'),
        ),
      );
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization':
              'Bearer sk_test_51NtZlSSBMNUPsC7G6MM8xXhWICRmw86zBcw45IdrPNY2qufRElNfXgIzIFbCAvIcagQdMvX308YxvEczDsdFWxEL00OwGCcvdD', // Replace with your actual Stripe API key.
          'content-type': 'application/x-www-form-urlencoded',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      print('Exception: ' + e.toString());
      throw e; // Rethrow the exception to propagate it.
    }
  }

  String calculateAmount(String amount) {
    final price = int.parse(amount) * 100;
    return price.toString();
  }
}
