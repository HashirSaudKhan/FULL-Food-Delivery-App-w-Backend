import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:full_food_delivery_app_with_backend/components/my_button.dart';
import 'package:full_food_delivery_app_with_backend/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  /*
  GlobalKey<FormState>:
  hum ek GlobalKey ko declare kar rahe hain jo specifically FormState ke liye use hoga.
  formKey: Yeh variable ka naam hai
  = GlobalKey<FormState>(): Yeh ek instance create kar raha hai of the class GlobalKey jiske type FormState hai.
  FormState specifically ek state hai jo ek Form widget ke saath associate hoti hai.
  FormState ka use hota hai form validation aur form submit ke sath-sath form ke states ko manage karne mein
  */
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //KEYS
  /*
  Key ek unique identifier hoti hai jo Flutter mein har widget ko uniquely identify karti hai. 
  Ye widget tree mein widget ke saath associate hoti hai aur unki state aur behavior ko
  maintain karne mein madad karti hai.
  */

  /*
  Widget State Ko Access Karna: 
  GlobalKey ke istemal se aap kisi widget ke state ko access kar sakte hain,
  chahe wo widget tree ke kahin bhi ho.
  Form Validation: 
  Form widget ke sath kaam karte waqt GlobalKey ka use form validation mein hota hai. 
  GlobalKey ke through aap form ke fields ka state access karke unka validate kar sakte hain.
  */
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  //user want to pay

  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      //only show dialog if form is valid

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Confirm Payment'),
                content: SingleChildScrollView(
                  /*
                  ListBody widget Flutter mein ek layout widget hai jo kisi ListView, Column, 
                  ya Row ke children ko organize karne mein madad karta hai.
                  ListBody scrollable nahi hota hai ListView ki tarah
                  */
                  child: ListBody(
                    children: [
                      Text("Card number $cardNumber"),
                      Text("Expiry Date $expiryDate"),
                      Text("Card Holder Name $cardHolderName"),
                      Text("CVV $cvvCode"),
                    ],
                  ),
                ),
                actions: [
                  //cancel button
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),

                  // Yes button
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DeliveryProgressPage()));
                      },
                      child: const Text('Yes'))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        //backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            //credit card
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView:
                  isCvvFocused, //true when you want to show cvv(back) view
              onCreditCardWidgetChange: (CreditCardBrand
                  brand) {}, // Callback for anytime credit card brand is changed
            ),

            //credit card form
            CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data) {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                  setState(() {});
                },
                formKey: formKey),

            //const Spacer(),
            const SizedBox(
              height: 120,
            ),

            //pay now button
            MyButton(
                onTap: () {
                  userTappedPay();
                },
                text: 'Pay now'),
          ],
        ),
      ),
    );
  }
}
