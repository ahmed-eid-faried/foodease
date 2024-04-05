import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:foodease/core/utill/images.dart';

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
      ChatUser(
        id: '4',
        name: 'Mike',
        profilePhoto: AppImage.testImage,
      ),
      ChatUser(
        id: '5',
        name: 'Rich',
        profilePhoto: AppImage.testImage,
      ),
    ],
  );

  void _showHideTypingIndicator() {
    _chatController.setTypingIndicator = !_chatController.showTypingIndicator;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatView(
        currentUser: currentUser,
        chatController: _chatController,
        onSendTap: _onSendTap,
        featureActiveConfig: const FeatureActiveConfig(
          lastSeenAgoBuilderVisibility: true,
          receiptsBuilderVisibility: true,
        ),
        chatViewState: ChatViewState.hasMessages,
        chatViewStateConfig: ChatViewStateConfiguration(
          loadingWidgetConfig: const ChatViewStateWidgetConfiguration(
            loadingIndicatorColor: Color(0xFF14BE77), // Green color added
          ),
          onReloadButtonTap: () {},
        ),
        typeIndicatorConfig: const TypeIndicatorConfiguration(
          flashingCircleBrightColor: Color(0xFF14BE77), // Green color added
          flashingCircleDarkColor: Color(0xFF14BE77), // Green color added
        ),
        appBar: ChatViewAppBar(
          elevation: 0,
          backGroundColor: const Color(0xFF14BE77), // Green color added
          profilePicture: Data.profileImage,
          backArrowColor: Colors.white,
          chatTitle: "Chat view",
          chatTitleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 0.25,
          ),
          userStatus: "online",
          userStatusTextStyle: const TextStyle(color: Colors.grey),
          actions: [
            IconButton(
              onPressed: _onThemeIconTap,
              icon: Icon(
                isDarkTheme
                    ? Icons.brightness_4_outlined
                    : Icons.dark_mode_outlined,
                color: Colors.white,
              ),
            ),
            IconButton(
              tooltip: 'Toggle TypingIndicator',
              onPressed: _showHideTypingIndicator,
              icon: const Icon(
                Icons.keyboard,
                color: Colors.white,
              ),
            ),
          ],
        ),
        chatBackgroundConfig: const ChatBackgroundConfiguration(
          messageTimeIconColor: Colors.black,
          messageTimeTextStyle: TextStyle(color: Colors.black),
          defaultGroupSeparatorConfig: DefaultGroupSeparatorConfiguration(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          // backgroundColor: theme.colorScheme.background,
        ),
        sendMessageConfig: SendMessageConfiguration(
          imagePickerIconsConfig: const ImagePickerIconsConfiguration(
            cameraIconColor: Colors.black,
            galleryIconColor: Colors.black,
          ),
          replyMessageColor: Colors.black,
          defaultSendButtonColor: const Color(0xFF14BE77), // Green color added
          replyDialogColor: Colors.black,
          replyTitleColor: Colors.black,
          textFieldBackgroundColor: Colors.white,
          closeIconColor: Colors.black,
          textFieldConfig: TextFieldConfiguration(
            onMessageTyping: (status) {
              /// Do with status
              debugPrint(status.toString());
            },
            compositionThresholdTime: const Duration(seconds: 1),
            textStyle: const TextStyle(color: Colors.black),
          ),
          micIconColor: Colors.black,
          voiceRecordingConfiguration: const VoiceRecordingConfiguration(
            backgroundColor: Colors.white,
            recorderIconColor: Colors.black,
            waveStyle: WaveStyle(
              showMiddleLine: false,
              waveColor: Colors.black,
              extendWaveform: true,
            ),
          ),
        ),
        chatBubbleConfig: ChatBubbleConfiguration(
          outgoingChatBubbleConfig: const ChatBubble(
            linkPreviewConfig: LinkPreviewConfiguration(
              backgroundColor: Colors.black,
              bodyStyle: TextStyle(color: Colors.white),
              titleStyle: TextStyle(color: Colors.white),
            ),
            receiptsWidgetConfig:
                ReceiptsWidgetConfig(showReceiptsIn: ShowReceiptsIn.all),
            color: Colors.black,
          ),
          inComingChatBubbleConfig: ChatBubble(
            linkPreviewConfig: const LinkPreviewConfiguration(
              linkStyle: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
              backgroundColor: Colors.white,
              bodyStyle: TextStyle(color: Colors.black),
              titleStyle: TextStyle(color: Colors.black),
            ),
            textStyle: const TextStyle(color: Colors.black),
            onMessageRead: (message) {
              /// send your message reciepts to the other client
              debugPrint('Message Read');
            },
            senderNameTextStyle: const TextStyle(color: Colors.black),
            color: Colors.white,
          ),
        ),
        replyPopupConfig: const ReplyPopupConfiguration(
          backgroundColor: Colors.black,
          buttonTextStyle: TextStyle(color: Colors.black),
          topBorderColor: Colors.black,
        ),
        reactionPopupConfig: const ReactionPopupConfiguration(
          shadow: BoxShadow(
            color: Colors.black54,
            blurRadius: 20,
          ),
          backgroundColor: Colors.black,
        ),
        messageConfig: MessageConfiguration(
          messageReactionConfig: MessageReactionConfiguration(
            backgroundColor: Colors.black,
            borderColor: Colors.black,
            reactedUserCountTextStyle: const TextStyle(color: Colors.black),
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
                    color: isDarkTheme ? Colors.black12 : Colors.grey.shade200,
                    offset: const Offset(0, 20),
                    blurRadius: 40,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          imageMessageConfig: ImageMessageConfiguration(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            shareIconConfig: ShareIconConfiguration(
              defaultIconBackgroundColor: Colors.black,
              defaultIconColor: Colors.black,
            ),
          ),
        ),
        profileCircleConfig: const ProfileCircleConfiguration(
          profileImageUrl: Data.profileImage,
        ),
        repliedMessageConfig: RepliedMessageConfiguration(
          backgroundColor: Colors.black,
          verticalBarColor: Colors.black,
          repliedMsgAutoScrollConfig: RepliedMsgAutoScrollConfig(
            enableHighlightRepliedMsg: true,
            highlightColor: Colors.pinkAccent.shade100,
            highlightScale: 1.1,
          ),
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.25,
          ),
          replyTitleTextStyle: const TextStyle(color: Colors.black),
        ),
        swipeToReplyConfig: const SwipeToReplyConfiguration(
          replyIconColor: Colors.black,
        ),
      ),
    );
  }

  void _onSendTap(
    String message,
    ReplyMessage replyMessage,
    MessageType messageType,
  ) {
    final id = int.parse(Data.messageList.last.id) + 1;
    _chatController.addMessage(
      Message(
        id: id.toString(),
        createdAt: DateTime.now(),
        message: message,
        sendBy: currentUser.id,
        replyMessage: replyMessage,
        messageType: messageType,
      ),
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      _chatController.initialMessageList.last.setStatus =
          MessageStatus.undelivered;
    });
    Future.delayed(const Duration(seconds: 1), () {
      _chatController.initialMessageList.last.setStatus = MessageStatus.read;
    });
  }

  void _onThemeIconTap() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }
}

class Data {
  static const profileImage =
      "https://raw.githubusercontent.com/SimformSolutionsPvtLtd/flutter_showcaseview/master/example/assets/simform.png";
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
