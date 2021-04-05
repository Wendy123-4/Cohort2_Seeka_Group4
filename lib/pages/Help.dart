import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: new IconButton(icon: new Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: ()
          {Navigator.pop(context);},
        ),
        centerTitle: true, // this is all you ne
        title: Text(" Help"),),




        body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) => EntryItem(
        data[index],
        ),
        ),

        );
        }
        }

        // Welcome to another flutter tutorial
        // In this video we will see how to create a multi-level Expansion List
        // First Let's create a class for each row in the Expansion List

              class Entry {
            final String title;
            final List<Entry>
            children; // Since this is an expansion list ...children can be another list of entries
            Entry(this.title, [this.children = const <Entry>[]]);
            }

        // This is the entire multi-level list displayed by this app
              final List<Entry> data = <Entry>[
              Entry(
              'LOAN APPLICATION',
              <Entry>[
                Entry(
                  '* How do I apply?',
                  <Entry>[
                    Entry('All applications MUST be completed on your android device . \n'
                        'You can begin your application by downloading the Seeka app from the Google Playstore. \n'
                        'After downloading the app, sign in with your google or email address and password and fill the provided fields correctly.'),
                  ],
                ),
                Entry(
                  '* Who is eligible to apply?',
                  <Entry>[
                    Entry('18 years and above'),
                  ],
                ),
                Entry(
                  '* Do I need to submit any document?',
                  <Entry>[
                    Entry('Yes\n'
                        'A scan of your passport and a picture of yourself'),
                  ],
                ),
                Entry(
                  '* When can I apply for higher amount?',
                  <Entry>[
                    Entry('The highest amount you can loan is RWF200,000 and the least is RWF 10,000'),
                  ],
                ),
                Entry(
                  '* How do I know my loan status?',
                  <Entry>[
                    Entry('There is a dashboard of your loan status on the homepage after logging in'),
                  ],
                ),


              ],
            ),
            // Second Row
            Entry('LOAN REPAYMENT', <Entry>[
              Entry(
                '* How do I payback?',
                <Entry>[
                  Entry('Click the Pay Loan button in the homepage, put in the amount to pay and click the Pay button. \n'
                      'A notification will be sent on the mobile number to confirm payment \n'
                      'Once completed, a success message will show on the app and will reflect on your dashboard'),
                ],
              ),
              Entry(
                "* What if I don't pay back?",
                <Entry>[
                  Entry('We love you as our customer and we would never want you to leave our platform,\n'
                      ' however, if you do not pay back your loan as at when due, it can attract serious legal consequences'),
                ],
              ),
              Entry(
                '* Is payment through MTN momo only?',
                <Entry>[
                  Entry('Yes\n'
                      'As of now all transactions are through MTN Momopay'),
                ],
              ),



            ]),
            Entry(
            'GENERAL ENQUIRES',
            <Entry>[
              Entry(
                '* Is my data safe with you?',
                <Entry>[
                  Entry('Yes\n'
                      'We hold every piece of information about you in high esteem'),
                ],
              ),
              Entry(
                '* I lost my device, how do I retrieve my account?',
                <Entry>[
                  Entry('All you need to do is download the app on your new device and sign\n'
                      ' in with your details'),
                ],
              ),
              Entry(
                '* What if I forgot my password?',
                <Entry>[
                  Entry('Click the Forgot Password on the Sign in page and continue with the process'),
                ],
              ),
              Entry(
                '* How do I get in contact with Seeka?',
                <Entry>[
                  Entry('You can reach us on any of the emails below:\n'
                      'w.essumn@alustudent.com\n'
                      'd.masoperh@alustudent.com\n'
                      'c.wasike@alustudent.com\n'),
                ],
              ),


            ],
            ),
            ];

        // Create the Widget for the row
            class EntryItem extends StatelessWidget {
            const EntryItem(this.entry);
            final Entry entry;

            // This function recursively creates the multi-level list rows.
            Widget _buildTiles(Entry root) {
            if (root.children.isEmpty) {
            return ListTile(
            title: Text(root.title),
            );
            }
            return ExpansionTile(
            key: PageStorageKey<Entry>(root),
            title: Text(root.title),
            children: root.children.map<Widget>(_buildTiles).toList(),
            );
            }

            @override
            Widget build(BuildContext context) {
            return _buildTiles(entry);
            }
            }






