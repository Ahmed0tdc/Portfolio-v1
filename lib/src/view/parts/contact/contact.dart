import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/data.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:portfolio/src/view/global_widgets/section_header.dart';
import 'package:provider/src/provider.dart';
import 'local_widgets/email_message_form.dart';
import 'local_widgets/social_media_links.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const SectionHeader _sectionHeader = SectionHeader(
        upperText: "CONTACT",
        lowerText: "How to get in touch?",
        upperFontSize: 30,
        lowerFontSize: 24);
    return ListView(
      physics: const BouncingScrollPhysics(),
      controller: context.read<ProviderClass>().getScrollController,
      children: [
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: _sectionHeader,
        ),
        const SizedBox(height: 50),
        FadeInUp(
          duration: const Duration(milliseconds: 300),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                      text:
                          'Get in touch via the form below, or by emailing\n',
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
          ),
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(children: [
            Expanded(
              child: FadeInUp(
                duration: const Duration(milliseconds: 400),
                child: Column(
                  children: [
                    const EmailMessageForm(),
                    const SizedBox(height: 20),
                    context.read<ProviderClass>().getEmailSendingStatus
                        ? ElasticIn(
                            child: const Txt(
                                txt: 'Your message is sent successfully',
                                clr: Colors.green,
                                fontFam: 'boldPoppins',
                                size: 20,
                                alignment: TextAlign.center))
                        : const SizedBox.shrink()
                  ],
                ),
              ),
            ),
            SizeConfig.isDesktop() ? const Spacer() : const SizedBox.shrink()
          ]),
        ),
        const SizedBox(height: 30),
        FadeInUp(
          duration: const Duration(milliseconds: 500),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Txt(
              txt: 'Or you can reach out on',
              clr: kwhite,
              size: 19,
              fontFam: 'semiBoldPoppins',
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Expanded(
                child: FadeInUp(
                  duration: const Duration(milliseconds: 600),
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 0,
                              offset: const Offset(10, 10),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.4))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        socialMediaData.length,
                        (index) => SocialMediaLinks(
                          socialMediaData: socialMediaData[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizeConfig.isDesktop()
                  ? const Spacer(flex: 3)
                  : const SizedBox.shrink()
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
