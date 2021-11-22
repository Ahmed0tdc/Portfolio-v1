// ignore_for_file: curly_braces_in_flow_control_structures, avoid_print

import 'package:flutter/material.dart';
import 'package:portfolio/src/services/email_service/email_service.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:provider/provider.dart';

class EmailMessageForm extends StatefulWidget {
  const EmailMessageForm({Key? key}) : super(key: key);

  @override
  _EmailMessageFormState createState() => _EmailMessageFormState();
}

class _EmailMessageFormState extends State<EmailMessageForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late FocusNode _nameNode;
  late TextEditingController _emailController;
  late FocusNode _emailNode;
  late TextEditingController _messageController;
  late FocusNode _messageNode;
  bool _sendingEmail = false;

  void clearAllFields(){
    _nameController.text = '';
    _emailController.text = '';
    _messageController.text = '';
  }

  Future<void> _sendEmail() async {
    EmailService _emailService = EmailService();
    setState(() {
      _sendingEmail = true;
    });
    try {
      final bool result = await _emailService.sendEmail(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        message: _messageController.text.trim(),
      );
      if (result) context.read<ProviderClass>().setEmailSendingStatus = true;
      else print('email did not get sent'.toUpperCase());
    } catch (e) {
      print(e);
    }
    setState(() {
      _sendingEmail = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _nameNode = FocusNode();
    _emailController = TextEditingController();
    _emailNode = FocusNode();
    _messageController = TextEditingController();
    _messageNode = FocusNode();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nameNode.dispose();
    _emailController.dispose();
    _emailNode.dispose();
    _messageController.dispose();
    _messageNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildTextFormField(
                    hintText: 'Name',
                    controller: _nameController,
                    node: _nameNode),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: _buildTextFormField(
                    hintText: 'Email',
                    inputType: TextInputType.emailAddress,
                    controller: _emailController,
                    node: _emailNode),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildTextFormField(
              hintText: "Message",
              inputType: TextInputType.multiline,
              controller: _messageController,
              node: _messageNode),
          const SizedBox(height: 10),
          _buildSubmitButton(context),
          (_sendingEmail && context.read<ProviderClass>().emailIsSentWithSuccess == false)
          ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Center(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(valueColor: const AlwaysStoppedAnimation(kwhite), backgroundColor: Theme.of(context).primaryColor),
                const SizedBox(width: 10),
                Txt(txt: 'Sending your message...', clr: Theme.of(context).primaryColor, size: 20)
              ],
            )),
          )
          : const SizedBox()
        ],
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: MaterialButton(
        disabledColor: Colors.grey[600],
        hoverColor: kwhite.withOpacity(0.4),
        color: Theme.of(context).primaryColor,
        onPressed: !_sendingEmail 
        ? () async {
          if (_formKey.currentState!.validate()) {
            print('sending your email...');
            try {
              _formKey.currentState!.save();
              await _sendEmail();
              clearAllFields.call();
            } catch (e) {
              print(e);
            }
          }
        } : null,
        child: const Text('Submit', style: TextStyle(color: kwhite)),
      ),
    );
  }

  TextFormField _buildTextFormField(
      {String? hintText,
      TextInputType? inputType,
      required FocusNode node,
      required TextEditingController controller}) {
    OutlineInputBorder _getBorder({Color? clr}) => OutlineInputBorder(
        borderSide: BorderSide(
            color: clr ?? Theme.of(context).primaryColor, width: 2.0));
    final bool _isMessageField = hintText?.toLowerCase() == 'message';
    return TextFormField(
      controller: controller,
      focusNode: node,
      maxLines: _isMessageField ? 5 : 1,
      keyboardType: inputType ?? TextInputType.text,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        disabledBorder: _getBorder(),
        enabledBorder: _getBorder(),
        focusedBorder: _getBorder(),
        errorBorder: _getBorder(clr: Colors.red),
        border: InputBorder.none,
        fillColor: kwhite,
        filled: true,
        hintText: hintText ?? 'Enter your text',
      ),
      style: const TextStyle(color: kblack),
      onFieldSubmitted: (text) {
        if (node.hasFocus) node.unfocus();
        switch (hintText?.toLowerCase()) {
          case 'name':
            _emailNode.requestFocus();
            break;
          case 'email':
            _messageNode.requestFocus();
            break;
        }
      },
      validator: (String? text) {
        bool isEmptyField = text == null || text.isEmpty;
        if (isEmptyField) {
          return 'Please fill out this field.';
        } else if (!isEmptyField && inputType == TextInputType.emailAddress) {
          const String regPattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          if (RegExp(regPattern).hasMatch(text.trim()) == false) {
            return 'Please enter a valid email address.';
          }
        }
        return null;
      },
    );
  }
}
