import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/data.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:portfolio/src/view/global_widgets/section_header.dart';
import 'package:provider/src/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const SectionHeader _sectionHeader = SectionHeader(
        upperText: "CONTACT",
        lowerText: "How to get in touch?",
        upperFontSize: 30,
        lowerFontSize: 24);
    return SingleChildScrollView(
      controller: context.read<ProviderClass>().getScrollController,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _sectionHeader,
            const SizedBox(height: 50),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                      text: 'Get in touch via the form below, or by emailing\n',
                      style: TextStyle(
                          color: kwhite,
                          fontSize: 19,
                          fontFamily: 'semiBoldPoppins')),
                  WidgetSpan(
                      child: SelectableText('ahmedelotmani200@gmail.com',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 19))),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Row(children: [
              const Expanded(child: EmailMessageForm()),
              SizeConfig.isDesktop() ? const Spacer() : const SizedBox.shrink()
            ]),
            const SizedBox(height: 50),
            const Txt(
              txt: 'Or reach out on',
              clr: kwhite,
              size: 19,
              fontFam: 'semiBoldPoppins',
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _buildSocialMediaLinks(context)),
                SizeConfig.isDesktop() ? const Spacer(flex: 3) : const SizedBox.shrink()
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialMediaLinks(BuildContext context) {
    Widget socialWidget(Map socialMediaData) => GestureDetector(
      onTap: () async {
        if(await canLaunch(socialMediaData['link'])){
          launch(socialMediaData['link']);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Image.asset(socialMediaData['icon'], height: 40),
      ),
    );
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 0,
            offset: const Offset(10, 10),
            color: Theme.of(context).primaryColor.withOpacity(0.4)
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: socialMediaData.map((Map socialMediaData) => socialWidget(socialMediaData)).toList(),
      ),
    );
  }
}

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
          _buildSubmitButton(context)
        ],
      ),
    );
  }

  SizedBox _buildSubmitButton(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: MaterialButton(
        color: Theme.of(context).primaryColor,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            //TODO send email
          }
        },
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
          const String regPattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          if (RegExp(regPattern).hasMatch(text.trim()) == false) {
            return 'Please enter a valid email adsress';
          }
        }
        return null;
      },
    );
  }
}
