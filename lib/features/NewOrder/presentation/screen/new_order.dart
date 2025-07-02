import 'package:dosytkom/features/NewOrder/data/model/educationalField_model.dart';
import 'package:dosytkom/features/NewOrder/presentation/cubit/newOrderCubit.dart';
import 'package:dosytkom/features/NewOrder/presentation/state/newOrder_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({super.key});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  /* ثابتة محليًا */
  final List<String> teacher = ['أحمد', 'محمد'];

  /* تُملأ من الـ API */
  List<String> subject        = [];
  List<String> gradeNames     = [];
  List<String> branchNames    = [];
  List<String> semisterNames  = [];      // << جديد

  /* المختارات */
  String? selectedTeacher,
      selectedGrade,
      selectedSubject,
      selectedSemester,
      selectedBranch;

  /* Controllers */
  final TextEditingController quantityController     = TextEditingController();
  final TextEditingController libraryNameController  = TextEditingController();
  final TextEditingController libraryPhoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<NewOrderCubit>().fetchEducationalItems();
    context.read<NewOrderCubit>().fetchEducationalLevels();
    context.read<NewOrderCubit>().fetchEducationalFields();
    context.read<NewOrderCubit>().fetchEducationalSemisters();   // << جديد
  }

  @override
  void dispose() {
    quantityController.dispose();
    libraryNameController.dispose();
    libraryPhoneController.dispose();
    super.dispose();
  }

  /* ---------- UI ---------- */

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewOrderCubit, NewOrderState>(
      listener: (context, state) {
        if (state is NewOrderSuccessState) {
          _showSnackBar('نجاح', state.message, Colors.green.shade100);
          _resetForm();
        } else if (state is NewOrderErrorState) {
          _showSnackBar('خطأ', state.errorMessage, Colors.red.shade100);
        }
      },
      builder: (context, state) {
        final isLoading = state is NewOrderLoadingState;

        /* حالات التحميل لأي قائمة */
        if (state is EducationalItemsLoadingState ||
            state is EducationalLevelsLoadingState ||
            state is EducationalFieldsLoadingState ||
            state is EducationalSemistersLoadingState) {               // << جديد
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        /* أخطاء */
        if (state is EducationalItemsErrorState)      { return _buildError('خطأ في تحميل المواد', state.message); }
        if (state is EducationalLevelsErrorState)     { return _buildError('خطأ في تحميل الصفوف', state.message); }
        if (state is EducationalFieldsErrorState)     { return _buildError('خطأ في تحميل الفروع', state.message); }
        if (state is EducationalSemistersErrorState)  { return _buildError('خطأ في تحميل الفصول', state.message); }

        /* تعبئة القوائم */
        if (state is EducationalItemsLoadedState)      subject        = state.items.map((e) => e.name).toList();
        if (state is EducationalLevelsLoadedState)     gradeNames     = state.levels.map((e) => e.name).toList();
        if (state is EducationalFieldsLoadedState)     branchNames    = state.fields.map((e) => e.name).toList();
        if (state is EducationalSemistersLoadedState)  semisterNames  = state.semisters.map((e) => e.name).toList();

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: const Color(0xFFF6F9FC),
                appBar: _buildAppBar(),
                body: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildInfoSection(),
                            const SizedBox(height: 20),
                            _buildQuantitySection(),
                            const SizedBox(height: 30),
                            _buildButtonsRow(),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (isLoading)
                const Center(child: AbsorbPointer(absorbing: true, child: CircularProgressIndicator())),
            ],
          ),
        );
      },
    );
  }

  /* ---------- Widgets مساعدة ---------- */

  PreferredSizeWidget _buildAppBar() => AppBar(
        backgroundColor: const Color(0xFFF6F9FC),
        title: const Text(
          'إنشاء طلب جديد',
          style: TextStyle(color: Color(0xFF12416F), fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF12416F)),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
      );

  Widget _buildInfoSection() => _buildSectionCard('معلومات الطلب', Icons.info_outline, [
        _buildDropdownRow('المعلم', teacher, (v) => setState(() => selectedTeacher = v), //
            'الصف', gradeNames, (v) => setState(() => selectedGrade = v)),
        const SizedBox(height: 16),
        _buildDropdownRow('المادة', subject, (v) => setState(() => selectedSubject = v), //
            'الفصل', semisterNames, (v) => setState(() => selectedSemester = v)),          // << استخدام semisterNames
        const SizedBox(height: 16),
        _buildCustomDropdown('الفرع', branchNames, (v) => setState(() => selectedBranch = v)),
        const SizedBox(height: 16),
        TextFormField(
          controller: libraryNameController,
          decoration: _inputDecoration('اسم المكتبة', 'أدخل اسم المكتبة'),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: libraryPhoneController,
          keyboardType: TextInputType.phone,
          decoration: _inputDecoration('رقم هاتف المكتبة', 'أدخل رقم الهاتف', prefix: Icons.phone),
        ),
      ]);

  Widget _buildQuantitySection() => _buildSectionCard('الكمية المطلوبة', Icons.format_list_numbered, [
        TextFormField(
          controller: quantityController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: _inputDecoration('العدد المطلوب', 'أدخل عدد الدوسيات المطلوبة', prefix: Icons.numbers),
          style:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF12416F)),
        ),
      ]);

  Widget _buildButtonsRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionButton(
            text: 'تأكيد الطلب',
            icon: Icons.check_circle,
            backgroundColor: const Color(0xFF0E73B7),
            onPressed: _confirmOrder,
          ),
          _buildActionButton(
            text: 'إلغاء',
            icon: Icons.cancel,
            backgroundColor: Colors.white,
            textColor: const Color(0xFF0E73B7),
            borderColor: const Color(0xFF0E73B7),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );

  /* ---------- بنّاؤوا الدروب داون ---------- */

  Widget _buildDropdownRow(
    String hint1,
    List<String> items1,
    void Function(String?) onChanged1,
    String hint2,
    List<String> items2,
    void Function(String?) onChanged2,
  ) =>
      Row(
        children: [
          Expanded(child: _buildCustomDropdown(hint1, items1, onChanged1)),
          const SizedBox(width: 16),
          Expanded(child: _buildCustomDropdown(hint2, items2, onChanged2)),
        ],
      );

  Widget _buildCustomDropdown(String hint, List<String> items, void Function(String?) onChanged) =>
      DropdownButtonFormField<String>(
        decoration: _inputDecoration(hint, null),
        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: onChanged,
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF12416F)),
        value: _getSelectedValue(hint),
      );

  

  Widget _buildError(String title, String msg) =>
      Scaffold(body: Center(child: Text('$title: $msg')));

  String? _getSelectedValue(String hint) {
    switch (hint) {
      case 'المعلم':
        return selectedTeacher;
      case 'الصف':
        return selectedGrade;
      case 'المادة':
        return selectedSubject;
      case 'الفصل':
        return selectedSemester;   
      case 'الفرع':
        return selectedBranch;
      default:
        return null;
    }
  }

  InputDecoration _inputDecoration(String label, String? hint, {IconData? prefix}) => InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF9FAFB),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF0E73B7), width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        prefixIcon: prefix != null ? Icon(prefix, color: const Color(0xFFB7B4B4)) : null,
      );

  Widget _buildSectionCard(String title, IconData icon, List<Widget> children) => Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Icon(icon, color: const Color(0xFF0E73B7)),
                const SizedBox(width: 8),
                Text(title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF12416F))),
              ]),
              const SizedBox(height: 12),
              ...children,
            ],
          ),
        ),
      );

  Widget _buildActionButton({
    required String text,
    required IconData icon,
    required Color backgroundColor,
    Color textColor = Colors.white,
    Color? borderColor,
    required VoidCallback onPressed,
  }) =>
      SizedBox(
        width: 160,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: textColor,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: borderColor != null ? BorderSide(color: borderColor, width: 1.5) : BorderSide.none,
            ),
            elevation: 3,
          ),
          onPressed: onPressed,
          icon: Icon(icon, size: 22),
          label: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      );

  

  void _confirmOrder() {
    final qty          = int.tryParse(quantityController.text) ?? 1;
    final libraryName  = libraryNameController.text.trim();
    final libraryPhone = libraryPhoneController.text.trim();

    if (selectedTeacher == null ||
        selectedGrade == null ||
        selectedSubject == null ||
        selectedSemester == null ||
        selectedBranch == null ||
        libraryName.isEmpty ||
        libraryPhone.isEmpty) {
      _showSnackBar('تنبيه', 'يرجى تعبئة جميع الحقول', Colors.orange.shade100);
      return;
    }

    context.read<NewOrderCubit>().createOrder(
          dosyahName: selectedSubject!,
          dosyahCount: qty,
          orderAcceptance: 1,
          libraryName: libraryName,
          libraryPhoneNumber: libraryPhone,
          orderLocation: 1,
        );
  }

  

  void _resetForm() {  }
  void _showSnackBar(String t,String m,Color c) {  }
}
