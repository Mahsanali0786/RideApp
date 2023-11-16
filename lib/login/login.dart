import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rideapp/selectSeat/views/book_seat.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  bool isEmailValid = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(validateEmail);
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void validateEmail() {
    final enteredEmail = emailController.text;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    setState(() {
      isEmailValid = emailRegex.hasMatch(enteredEmail);
    });
  }

  //password related fields

  String password = '';
  String confirmPassword = '';
  bool isPasswordStrong = false;
  bool doPasswordsMatch = false;

  void checkPasswordStrength(String value) {
    password = value;

    bool hasMinLength = password.length >= 8;
    bool hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowerCase = password.contains(RegExp(r'[a-z]'));

    // Check for uniqueness
    Set<String> uniqueChars = password.split('').toSet();

    setState(() {
      bool hasUniqueCharacters = uniqueChars.length == password.length;

      isPasswordStrong =
          hasMinLength && hasUpperCase && hasLowerCase && hasUniqueCharacters;

      if (confirmPassword.isNotEmpty) {
        doPasswordsMatch = password == confirmPassword;
      }
    });
  }

  void checkPasswordMatch(String value) {
    confirmPassword = value;
    if (password.isNotEmpty) {
      doPasswordsMatch = password == confirmPassword;
      setState(() {});
    }
  }

  String selectedRole = 'passenger';
  String countryCode = '+123';

  // Initially selecting 'driver'
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                // Image.asset(
                //   'assets/your_logo.png', // Replace 'your_logo.png' with your logo image path
                //   height: 100,
                //   width: 100,
                // ),
                Container(
                  padding: const EdgeInsets.all(5),
                  constraints: const BoxConstraints(
                      maxWidth: 150), // Set your preferred maximum width
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Duseca',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 30,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                const SizedBox(height: 55),

                // "Sign Up Today" Text
                const Text(
                  'SignUp today',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Provide us your credentials to start',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'journey with us.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Name TextField
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Your name',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17)),
                    const SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'e.g.John Doe',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Email TextField
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Your email',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17)),
                    const SizedBox(height: 5),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'youremail@gmail.com',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: isEmailValid
                                  ? Colors.green
                                  : Colors
                                      .red, // Border color based on validation
                            ),
                          ),
                          //ed

                          focusedBorder: OutlineInputBorder(
                            // Change active border color to green
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: isEmailValid
                                  ? Colors.green
                                  : Colors
                                      .red, // Active border color when focused
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: isEmailValid
                                    ? Colors.green
                                    : Colors
                                        .red), // Transparent color when not focused
                          ),
                          //
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: isEmailValid
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Phone No*',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                // Phone No TextField with dropdown
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: DropdownButton<String>(
                              value:
                                  countryCode, // Initial value for the dropdown
                              onChanged: (String? newValue) {
                                // Handle dropdown value change
                                setState(() {
                                  countryCode = newValue.toString();
                                });
                              },
                              underline: Container(
                                // Set underline to an empty container
                                height: 0,
                                color: Colors.transparent,
                              ),
                              items: <String>[
                                '+123',
                                '+1',
                                '+44',
                                '+92'
                              ] // country codes
                                  .map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                    11), // Limit character count to 11
                                FilteringTextInputFormatter
                                    .digitsOnly, // Allow only numeric digits
                              ],
                              decoration: const InputDecoration(
                                hintText: '310-XXXXXXXX',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .transparent), // Transparent color when focused
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .transparent), // Transparent color when not focused
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),

                // Password TextField
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Password',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17)),
                    const SizedBox(height: 5),
                    TextField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      style: const TextStyle(color: Colors.grey),
                      onChanged: checkPasswordStrength,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: doPasswordsMatch
                                ? Colors.grey
                                : Colors
                                    .red, // Change border color based on match
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Confirm Password TextField
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Confirm Password',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17)),
                    const SizedBox(height: 5),
                    TextField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      style: TextStyle(color: Colors.grey),
                      onChanged: checkPasswordMatch,
                      decoration: InputDecoration(
                        hintText: 'Confirm your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: doPasswordsMatch
                                ? Colors.grey
                                : Colors
                                    .red, // This change border color based on match
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Passenger and Driver Radio buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (selectedRole != 'passenger') {
                          setState(() {
                            selectedRole = 'passenger';
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Radio(
                            value: 'passenger',
                            groupValue: selectedRole,
                            onChanged: (_) {
                              setState(() {
                                selectedRole = 'passenger';
                              });
                            },
                            activeColor: Colors.red,
                          ),
                          Text(
                            'Passenger',
                            style: TextStyle(
                              color: selectedRole == 'passenger'
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (selectedRole != 'driver') {
                          // Update the selected role and trigger a rebuild
                          print(selectedRole);
                          setState(() {
                            selectedRole = 'driver';
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Radio(
                            value: 'driver',
                            groupValue: selectedRole,
                            onChanged: (_) {
                              setState(() {
                                selectedRole = 'driver';
                              });
                            }, // onChanged is null because we're handling onTap
                            activeColor: Colors.red,
                          ),
                          Text(
                            'Driver',
                            style: TextStyle(
                              color: selectedRole == 'driver'
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Password requirements text
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      child: Center(
                        child: Icon(
                          doPasswordsMatch
                              ? Icons.check_circle
                              : Icons.highlight_off,
                          size: 20,
                          color: doPasswordsMatch ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Password must be at least 8 characters, contain uppercase, lowercase letters, and unique characters!',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Create Account Button
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      // style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                      onPressed: () {
                        // Handle Create Account button press
                        Navigator.push(context, CupertinoPageRoute(builder: (context)=>const BookSeat(numberOfSeats: 12)));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 19),
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                             color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
