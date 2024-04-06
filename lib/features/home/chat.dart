import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/core/utill/images.dart';
import 'package:foodease/core/widgets/custom_widgets/appbar/custom_app_bar.dart';
import 'package:foodease/core/widgets/custom_widgets/custom_scaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isDarkTheme = false;
  final currentUser = ChatUser(
    id: '1',
    name: 'Flutter',
    profilePhoto: Data.profileImage,
  );
  final _chatController = ChatController(
    initialMessageList: Data.messageList,
    scrollController: ScrollController(),
    chatUsers: [
      ChatUser(
        id: '2',
        name: 'Simform',
        profilePhoto: AppImage.testImage,
      ),
      ChatUser(
        id: '3',
        name: 'Jhon',
        profilePhoto: AppImage.testImage,
      ),
    ],
  );

  void _showHideTypingIndicator() {
    _chatController.setTypingIndicator = !_chatController.showTypingIndicator;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchMessages();
  //   _chatController.initialMessageList=  _fetchMessages();
  // }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: StreamBuilder<List<Message>>(
          stream: _fetchMessages(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Or any other loading indicator
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            _chatController.initialMessageList = snapshot.data ?? [];
            return ChatView(
              // المستخدم الحالي في المحادثة
              currentUser: currentUser,
              // متحكم المحادثة والرسائل
              chatController: _chatController,
              // دالة تُنفَّذ عند الضغط على زر الإرسال
              onSendTap: _onSendTap,
              // إعدادات الخصائص النشطة في المحادثة
              featureActiveConfig: const FeatureActiveConfig(
                lastSeenAgoBuilderVisibility: true,
                receiptsBuilderVisibility: true,
                enablePagination: true,
              ),

              // حالة المحادثة الحالية
              chatViewState: ChatViewState.hasMessages,

              // إعدادات حالة المحادثة
              chatViewStateConfig: ChatViewStateConfiguration(
                // إعدادات واجهة التحميل
                loadingWidgetConfig: const ChatViewStateWidgetConfiguration(
                  loadingIndicatorColor: Color(0xFF14BE77), // Green color added
                ),
                onReloadButtonTap: () {},
              ),

              // إعدادات عنصر التحديد (Typing indicator)
              typeIndicatorConfig: const TypeIndicatorConfiguration(
                flashingCircleBrightColor:
                    Color(0xFF14BE77), // Green color added
                flashingCircleDarkColor: Color(0xFF14BE77), // Green color added
              ),

              // شريط التطبيق المخصص (AppBar)
              appBar: const CustomAppBar(),
              // إعدادات خلفية المحادثة

              chatBackgroundConfig: ChatBackgroundConfiguration(
                backgroundColor:
                    ColorResources.getHomeBg(context).withOpacity(0),
                messageTimeIconColor: ColorResources.getTextTitle(context),
                messageTimeTextStyle:
                    TextStyle(color: ColorResources.getTextTitle(context)),
                defaultGroupSeparatorConfig: DefaultGroupSeparatorConfiguration(
                  textStyle: TextStyle(
                    color: ColorResources.getTextTitle(context),
                    fontSize: 17,
                  ),
                ),
              ),

              // إعدادات إرسال الرسائل
              sendMessageConfig: SendMessageConfiguration(
                // إعدادات أيقونات اختيار الصور والكاميرا
                imagePickerIconsConfig: ImagePickerIconsConfiguration(
                  cameraIconColor: ColorResources.white.withOpacity(0.4),
                  galleryIconColor: ColorResources.white.withOpacity(0.4),
                ),
                // ألوان عنصر إرسال الرد
                replyMessageColor: ColorResources.getIconBg(context),
                // لون زر الإرسال الافتراضي
                defaultSendButtonColor: ColorResources.primaryMaterial,
                // ألوان عناصر الرد
                replyDialogColor: ColorResources.getIconBg(context),
                replyTitleColor: ColorResources.getIconBg(context),
                textFieldBackgroundColor: ColorResources.getIconBg(context),
                closeIconColor: ColorResources.getIconBg(context),

                // إعدادات حقل إدخال النص
                textFieldConfig: TextFieldConfiguration(
                  margin: const EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(
                      vertical: 10.h(context), horizontal: 4.w(context)),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  onMessageTyping: (status) {
                    debugPrint(status.toString());
                  },
                  compositionThresholdTime: const Duration(seconds: 1),
                  textStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
                ),
                micIconColor: Colors.black.withOpacity(0.4),
                allowRecordingVoice: true,

                // إعدادات تسجيل الصوت
                voiceRecordingConfiguration: VoiceRecordingConfiguration(
                  backgroundColor: Colors.white.withOpacity(0),
                  recorderIconColor:
                      ColorResources.white3(context).withOpacity(0.5),
                  waveStyle: WaveStyle(
                    showMiddleLine: false,
                    labelSpacing: 0,
                    waveColor: Colors.black.withOpacity(0.4),
                    extendWaveform: true,
                  ),
                ),
              ),

              // إعدادات فقاعات الدردشة
              chatBubbleConfig: ChatBubbleConfiguration(
                // إعدادات فقاعة الدردشة الصادرة
                outgoingChatBubbleConfig: ChatBubble(
                  linkPreviewConfig: LinkPreviewConfiguration(
                    backgroundColor:
                        ColorResources.primaryMaterial.withOpacity(0.5),
                    bodyStyle:
                        TextStyle(color: ColorResources.getWhite(context)),
                    titleStyle:
                        TextStyle(color: ColorResources.getWhite(context)),
                  ),
                  receiptsWidgetConfig: const ReceiptsWidgetConfig(
                      showReceiptsIn: ShowReceiptsIn.all),
                  color: ColorResources.primaryMaterial.withOpacity(0.5),
                ),
                // إعدادات فقاعة الدردشة الواردة
                inComingChatBubbleConfig: ChatBubble(
                  linkPreviewConfig: LinkPreviewConfiguration(
                    linkStyle: TextStyle(
                      color: ColorResources.getTextTitle(context),
                      decoration: TextDecoration.underline,
                    ),
                    backgroundColor:
                        ColorResources.white3(context).withOpacity(0.1),
                    bodyStyle:
                        TextStyle(color: ColorResources.getTextBody(context)),
                    titleStyle:
                        TextStyle(color: ColorResources.getTextTitle(context)),
                  ),
                  textStyle:
                      TextStyle(color: ColorResources.getTextTitle(context)),
                  onMessageRead: (message) {
                    debugPrint('Message Read');
                  },
                  senderNameTextStyle:
                      TextStyle(color: ColorResources.getTextTitle(context)),
                  color: ColorResources.white3(context).withOpacity(0.1),
                ),
              ),

              // إعدادات الردود المنبثقة
              replyPopupConfig: ReplyPopupConfiguration(
                backgroundColor: Colors.black.withOpacity(0.3),
                buttonTextStyle: const TextStyle(color: Colors.black),
                topBorderColor: Colors.black.withOpacity(0.3),
              ),

              // إعدادات الردود المتفاعلة
              reactionPopupConfig: ReactionPopupConfiguration(
                shadow: BoxShadow(
                  color: Colors.black54.withOpacity(0.3),
                  blurRadius: 20,
                ),
                backgroundColor: Colors.black.withOpacity(0.3),
              ),

              // إعدادات الرسائل
              messageConfig: MessageConfiguration(
                messageReactionConfig: MessageReactionConfiguration(
                  backgroundColor: Colors.black,
                  borderColor: Colors.black,
                  reactedUserCountTextStyle:
                      const TextStyle(color: Colors.black),
                  reactionCountTextStyle: const TextStyle(color: Colors.black),
                  reactionsBottomSheetConfig: ReactionsBottomSheetConfiguration(
                    // backgroundColor: theme.colorScheme.background,
                    reactedUserTextStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    reactionWidgetDecoration: BoxDecoration(
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: isDarkTheme
                              ? Colors.black12
                              : Colors.grey.shade200,
                          offset: const Offset(0, 20),
                          blurRadius: 40,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // إعدادات الرسائل الصورية
                imageMessageConfig: ImageMessageConfiguration(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  shareIconConfig: ShareIconConfiguration(
                    defaultIconBackgroundColor:
                        ColorResources.white3(context).withOpacity(0.1),
                    defaultIconColor:
                        ColorResources.primaryMaterial.withOpacity(0.3),
                  ),
                ),
              ),

              // إعدادات الصورة الشخصية
              profileCircleConfig: const ProfileCircleConfiguration(
                profileImageUrl: Data.profileImage,
              ),

              // إعدادات الرسائل المُرَدَّة
              repliedMessageConfig: RepliedMessageConfiguration(
                backgroundColor: Colors.black.withOpacity(0.3),
                verticalBarColor: Colors.black.withOpacity(0.3),
                repliedMsgAutoScrollConfig: const RepliedMsgAutoScrollConfig(
                  enableHighlightRepliedMsg: true,
                  highlightColor: ColorResources.green,
                ),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                replyTitleTextStyle: const TextStyle(color: Colors.black),
              ),

              // إعدادات الرد بالسحب
              swipeToReplyConfig: SwipeToReplyConfiguration(
                replyIconColor:
                    ColorResources.getBlack(context).withOpacity(0.3),
              ),
            );
          }),
    );
  }

  // void _onSendTap(
  //   String message,
  //   ReplyMessage replyMessage,
  //   MessageType messageType,
  // ) {
  //   final id = int.parse(Data.messageList.last.id) + 1;
  //   _chatController.addMessage(
  //     Message(
  //       id: id.toString(),
  //       createdAt: DateTime.now(),
  //       message: message,
  //       sendBy: currentUser.id,
  //       replyMessage: replyMessage,
  //       messageType: messageType,
  //     ),
  //   );
  //   Future.delayed(const Duration(milliseconds: 300), () {
  //     _chatController.initialMessageList.last.setStatus =
  //         MessageStatus.undelivered;
  //   });
  //   Future.delayed(const Duration(seconds: 1), () {
  //     _chatController.initialMessageList.last.setStatus = MessageStatus.read;
  //   });
  // }

  void _onSendTap(
    String message,
    ReplyMessage replyMessage,
    MessageType messageType,
  ) async {
    final collection = FirebaseFirestore.instance.collection('messages');
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    await collection.add({
      'id': id,
      'createdAt': DateTime.now(),
      'message': message,
      'sendBy': currentUser.id,
      'replyMessage': replyMessage.toJson(),
      'messageType': messageType.toString(),
    });
  }

  Stream<List<Message>> _fetchMessages() {
    final collection = FirebaseFirestore.instance.collection('messages');
    return collection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Message.fromJson(doc.data());
      }).toList();
    });
  }

  void _onThemeIconTap() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }
}

class Data {
  static const profileImage = AppImage.testImage;
  static final messageList = [
    Message(
      id: '1',
      message: "Hi!",
      createdAt: DateTime.now(),
      sendBy: '1', // userId of who sends the message
      status: MessageStatus.read,
    ),
    Message(
      id: '2',
      message: "Hi!",
      createdAt: DateTime.now(),
      sendBy: '2',
      status: MessageStatus.read,
    ),
    Message(
      id: '3',
      message: "We can meet?I am free",
      createdAt: DateTime.now(),
      sendBy: '1',
      status: MessageStatus.read,
    ),
    Message(
      id: '4',
      message: "Can you write the time and place of the meeting?",
      createdAt: DateTime.now(),
      sendBy: '1',
      status: MessageStatus.read,
    ),
    Message(
      id: '5',
      message: "That's fine",
      createdAt: DateTime.now(),
      sendBy: '2',
      reaction: Reaction(reactions: ['\u{2764}'], reactedUserIds: ['1']),
      status: MessageStatus.read,
    ),
    Message(
      id: '6',
      message: "When to go ?",
      createdAt: DateTime.now(),
      sendBy: '3',
      status: MessageStatus.read,
    ),
    Message(
      id: '7',
      message: "I guess Simform will reply",
      createdAt: DateTime.now(),
      sendBy: '4',
      status: MessageStatus.read,
    ),
    Message(
      id: '8',
      message: "https://bit.ly/3JHS2Wl",
      createdAt: DateTime.now(),
      sendBy: '2',
      reaction: Reaction(
        reactions: ['\u{2764}', '\u{1F44D}', '\u{1F44D}'],
        reactedUserIds: ['2', '3', '4'],
      ),
      status: MessageStatus.read,
      replyMessage: const ReplyMessage(
        message: "Can you write the time and place of the meeting?",
        replyTo: '1',
        replyBy: '2',
        messageId: '4',
      ),
    ),
    Message(
      id: '9',
      message: "Done",
      createdAt: DateTime.now(),
      sendBy: '1',
      status: MessageStatus.read,
      reaction: Reaction(
        reactions: [
          '\u{2764}',
          '\u{2764}',
          '\u{2764}',
        ],
        reactedUserIds: ['2', '3', '4'],
      ),
    ),
    Message(
      id: '10',
      message: "Thank you!!",
      status: MessageStatus.read,
      createdAt: DateTime.now(),
      sendBy: '1',
      reaction: Reaction(
        reactions: ['\u{2764}', '\u{2764}', '\u{2764}', '\u{2764}'],
        reactedUserIds: ['2', '4', '3', '1'],
      ),
    ),
    Message(
      id: '11',
      message: "https://miro.medium.com/max/1000/0*s7of7kWnf9fDg4XM.jpeg",
      createdAt: DateTime.now(),
      messageType: MessageType.image,
      sendBy: '1',
      reaction: Reaction(reactions: ['\u{2764}'], reactedUserIds: ['2']),
      status: MessageStatus.read,
    ),
    Message(
      id: '12',
      message: "🤩🤩",
      createdAt: DateTime.now(),
      sendBy: '2',
      status: MessageStatus.read,
    ),
  ];
}
