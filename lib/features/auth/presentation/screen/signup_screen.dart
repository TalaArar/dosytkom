import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:dosytkom/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:dosytkom/features/auth/presentation/screen/login.dart';
import 'package:dosytkom/features/auth/presentation/state/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_mobile_field/intl_mobile_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKeyStep1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyStep2 = GlobalKey<FormState>();
  
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController libraryNameController = TextEditingController();
  final TextEditingController libraryPhone2Controller = TextEditingController();

  // For IntlMobileField
  String? phoneNumber;
  String? libraryPhone1;
  String? libraryPhone2;

  String? selectedCountry;
  String? selectedCity;
  String? selectedArea;

  int currentStep = 1;
  final List<String> countries = const ['الأردن'];
  final List<String> cities = const ['الزرقاء', 'عمان', 'السلط'];
  final List<String> areas = const ['الوحدات', 'الزهور', 'الجبيهة'];

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is SignupSuccess) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("تم إنشاء الحساب بنجاح")),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          );
        } else if (state is SignupError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("فشل التسجيل: ${state.message}")),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xFFF6F9FC),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 30),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SizeTransition(
                            sizeFactor: animation,
                            axis: Axis.vertical,
                            child: child,
                          ),
                        );
                      },
                      child: currentStep == 1 ? _buildStepOne() : _buildStepTwo(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        const Text(
          "إنشاء حساب مكتبة",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF12416F),
          ),),
        const SizedBox(height: 20),
        Container(
          width: 150,
          height: 6,
          decoration: BoxDecoration(
            color: const Color(0xFFB7B4B4).withOpacity(0.3),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Row(
            children: [
              Expanded(
                flex: currentStep,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF0E73B7),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                ),],
          ),
        ),
      ],
    );
  }

  Widget _buildStepOne() {
    return Form(
      key: _formKeyStep1,
      child: _buildFormContainer(
        key: const ValueKey(1),
        children: [
          _buildTextField('الإسم الأول', Icons.person_outline, firstNameController),
          _buildTextField('الإسم الأخير', Icons.person_outline, lastNameController),
          _buildPhoneField('رقم الهاتف', Icons.phone_android_outlined, (number) {
            phoneNumber = number;
          }),
          const SizedBox(height: 25),
          _buildNextButton(),
          const SizedBox(height: 15),
          _buildLoginPrompt(),
        ],
      ),
    );
  }

  Widget _buildStepTwo() {
    return Form(
      key: _formKeyStep2,
      child: _buildFormContainer(
        key: const ValueKey(2),
        children: [
          _buildTextField('اسم المكتبة', Icons.store_outlined, libraryNameController),
          _buildDropdown('الدولة', countries, Icons.flag_outlined, (String? val) {
            selectedCountry = val;
          }),
          _buildDropdown('المدينة', cities, Icons.location_city_outlined, (String? val) {
            selectedCity = val;
          }),
          _buildDropdown('المنطقة', areas, Icons.location_on_outlined, (String? val) {
            selectedArea = val;
          }),
          _buildPhoneField('رقم المكتبة1', Icons.phone_outlined, (number) {
            libraryPhone1 = number;
          }),
          _buildPhoneField('رقم المكتبة2', Icons.phone_outlined, (number) {
            libraryPhone2 = number;
          }),
          const SizedBox(height: 25),
          _buildSignupButton(),
          _buildBackButton(),
          const SizedBox(height: 15),
          _buildLoginPrompt(),
        ],
      ),
    );
  }

  Widget _buildFormContainer({required Key key, required List<Widget> children}) {
    return Material(
      key: key,
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(children: children),
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFFB7B4B4)),
          prefixIcon: Icon(icon, color: const Color(0xFF12416F)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: const Color(0xFFB7B4B4).withOpacity(0.3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF0E73B7), width: 1.5),
          ),
        ),
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'هذا الحقل مطلوب';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPhoneField(String hint, IconData icon, Function(String?)? onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: IntlMobileField(
        initialCountryCode: "JO",
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFFB7B4B4)),
          prefixIcon: Icon(icon, color: const Color(0xFF12416F)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: const Color(0xFFB7B4B4).withOpacity(0.3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF0E73B7), width: 1.5),
          ),
        ),
        favorite: ["JO", "SA", "AE"],
        onChanged: (number) {
          if (onChanged != null) {
            onChanged("${number.countryCode}${number.number}");
          }
        },
        validator: (mobileNumber) {
          if (mobileNumber == null || mobileNumber.number.isEmpty) {
            return 'الرجاء إدخال رقم الهاتف';
          }
          if (!RegExp(r'^[0-9]+$').hasMatch(mobileNumber.number)) {
            return 'يجب أن يحتوي الرقم على أرقام فقط';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdown(String hint, List<String> items, IconData icon, Function(String?)? onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CustomDropdown.search(
          hintText: hint,
          items: items,
          onChanged: onChanged,
          decoration: CustomDropdownDecoration(
            closedFillColor: Colors.white,
            expandedFillColor: Colors.white,
            closedBorder: Border.all(color: const Color(0xFFB7B4B4).withOpacity(0.3)),
            expandedBorder: Border.all(color: const Color(0xFF0E73B7), width: 1.5),
            hintStyle: const TextStyle(color: Color(0xFFB7B4B4)),
            headerStyle: const TextStyle(color: Color(0xFF12416F), fontWeight: FontWeight.w500),
            listItemStyle: const TextStyle(color: Color(0xFF12416F)),
            prefixIcon: Icon(icon, color: const Color(0xFF12416F)),
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0E73B7),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
        ),
        onPressed: () {
          if (_formKeyStep1.currentState!.validate()) {
            setState(() {
              currentStep = 2;
            });
          }
        },
        child: const Text("التالي", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildSignupButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF12416F),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
        ),
        onPressed: () {
          if (_formKeyStep2.currentState!.validate()) {
            if (phoneNumber == null || libraryPhone1 == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("الرجاء إدخال أرقام الهواتف المطلوبة")),
              );
              return;
            }
            
            context.read<SignupCubit>().signUp(
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              libraryName: libraryNameController.text,
              phoneNumber: phoneNumber!,
              secondPhoneNumber: libraryPhone2 ?? libraryPhone2Controller.text,
              countryId: 0,
              cityId: 0,
              locationId: 0,
            );
          }
        },
        child: const Text("إنشاء الحساب", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
      ),
    );
  }

  Widget _buildBackButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          currentStep = 1;
        });
      },
      child: const Text("رجوع", style: TextStyle(fontSize: 15, color: Color(0xFF12416F), fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildLoginPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
          },
          child: const Text("تسجيل الدخول", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0E73B7))),
        ),
        const Text("هل لديك حساب؟", style: TextStyle(color: Color(0xFF12416F))),
      ],
    );
  }
}