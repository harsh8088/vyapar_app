import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

import 'bloc/login_bloc.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text("state.message")),
              );
          }
          if (state.status.isSubmissionSuccess) {
            Navigator.pushNamed(context, "/home");
          }
          // if (state is SuccessState) {
          //   if (state.isPinAvailable)
          //     Navigator.pushNamed(context, "/login-pin").then((value) => _refreshState());
          //   else
          //     Navigator.pushNamed(context, "/otp");
          // }
        },
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  // Align children to center
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Set minimum size to avoid stretching
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const BackButton(),
                    const Text(
                      "Logout",
                      style: TextStyle(color: Colors.black54, fontSize: 18.0),
                    ),
                    const Spacer(),
                    SizedBox(
                        height: 24,
                        child: Image.asset(
                          "assets/kite-logo.png",
                        )),
                  ],
                ),
                SizedBox(
                  height: 120,
                  child: IconButton(
                    constraints: const BoxConstraints(maxHeight: 90),
                    icon: Icon(
                      Icons.account_circle,
                      size: 130,
                      color: Colors.grey.shade300,
                    ),
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "User Name",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  "0697",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 15, bottom: 10),
                    child: TextFormField(
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                        obscureText: true,
                        obscuringCharacter: "•",
                        keyboardType: TextInputType.number,
                        // maxLength: 6,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 28,
                            color: Colors.blueAccent,
                          ),
                          focusColor: Colors.grey,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          labelText: 'Enter TOTP',
                          // focusColor: Colors.grey,
                        ))),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Forgot TOTP",
                  style: TextStyle(color: Colors.blueAccent),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset("assets/zerodha-logo.svg",
                        color: Colors.grey, semanticsLabel: 'My SVG Picture'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: RichText(
                    text: TextSpan(
                      text:
                          'NSE & BSE -SEBI Registration no 123138126486283648236462364.: 3248632648263462834 | MCX - SEBI Registration no. :INZ 000232131231| CDSL -SEBI Registration no.:IN-DP-431-209 | ',
                      style: TextStyle(color: Colors.grey.shade500),
                      children: const [
                        TextSpan(
                          text: 'Smart Online Dispute Resolution',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ' | ',
                        ),
                        TextSpan(
                          text: 'SEBI SCORES',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
