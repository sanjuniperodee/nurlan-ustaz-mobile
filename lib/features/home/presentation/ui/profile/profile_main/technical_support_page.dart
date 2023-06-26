import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/web_socket/presentation/cubit/model/chat_model.dart';

class TechnicalSupportPage extends StatefulWidget {
  const TechnicalSupportPage({Key? key}) : super(key: key);

  @override
  State<TechnicalSupportPage> createState() => _TechnicalSupportPageState();
}

class _TechnicalSupportPageState extends State<TechnicalSupportPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalCustomBody(
        child: SizedBox(
          height: 1.1.sh,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(children: [
              SizedBox(
                height: 20.h,
              ),
              const CustomAppBar(
                title: 'Техникалық қолдау',
              ),
              ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 10).r,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(
                            left: 14, right: 14, top: 10, bottom: 10)
                        .r,
                    child: Align(
                      alignment: (messages[index].messageType == "receiver"
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (messages[index].messageType == "receiver"
                              ? Colors.grey.shade200
                              : Colors.blue[200]),
                        ),
                        padding: const EdgeInsets.all(16).r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              messages[index].messageContent,
                              style: const TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text('12:25')
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 200.h,
              )
            ]),
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        height: 100.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Сізде мәселе туындады ма?',
              style: getTextStyle(CustomTextStyles.s12w400)
                  .apply(color: AppColors.black),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    autofocus: true, // Set autofocus to true
                    focusNode: focusNode,
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                        hintText: 'Пікір білдіру', border: InputBorder.none),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    setState(() {});
                    _textEditingController.clear();
                  },
                ),
              ],
            ),
            const Divider(
              height: 13,
              thickness: 3,
              color: AppColors.background2,
            ),
          ],
        ),
      ),
    );
  }
}
