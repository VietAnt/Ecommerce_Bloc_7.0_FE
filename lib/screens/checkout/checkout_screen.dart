import 'package:ecommerce_smart/bloc/check_out/checkout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_smart/widgets/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    //--texteditController--//

    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: CustomNavBar(
        screen: routeName,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CUSTOMER INFORMATION',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  // _buildTextFormField(emailController, context, 'Email'),
                  // _buildTextFormField(nameController, context, 'Full name'),
                  //*--dang ky--//
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckout(email: value),
                        );
                  }, context, 'Email'),
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckout(fullName: value),
                        );
                  }, context, 'Full Name'),
                  //*----//
                  Text(
                    'DELIVERY INFORMATION',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  //*--Dang ly--//
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckout(address: value),
                        );
                  }, context, 'Address'),
                  //*-----//
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckout(city: value),
                        );
                  }, context, 'City'),
                  //*----------------///
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckout(country: value),
                        );
                  }, context, 'Country'),
                  //*--------------------------------//
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckout(zipCode: value),
                        );
                  }, context, 'zipCode'),
                  //*-------------END-------------------//
                  Text(
                    'ORDER SUMMARY',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  OrderSummary(),
                ],
              );
            } else {
              return const Text('Something went wrong');
            }
          },
        ),
      ),
    );
  }

  //*_buildTextFormField_//
  Padding _buildTextFormField(
    Function(String)? onChanged,
    // TextEditingController controller,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: TextFormField(
            onChanged: onChanged,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(left: 10),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
