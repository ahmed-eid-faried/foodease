// import 'package:flutter/material.dart';
// import 'package:foodease/core/locale_keys.g.dart';

// enum StatusRequest {
//   pending,
//   newOrder,
//   cancelled,
//   onWay,
//   arrived,
//   supplied,
//   received,
//   approved
// }

// TextSpan statusRequestFun(StatusRequest state) {
//   switch (state) {
//     case StatusRequest.pending:
//       return textSpanCustom(
//         text: LocaleKeys.pending,
//         style: AppFontStyle.orange11w400(),
//       );
//     case StatusRequest.newOrder:
//       return textSpanCustom(
//         text: LocaleKeys.newp,
//         style: AppFontStyle.green11w400(),
//       );
//     case StatusRequest.cancelled:
//       return textSpanCustom(
//         text: LocaleKeys.cancelled,
//         style: AppFontStyle.red11w400(),
//       );
//     case StatusRequest.onWay:
//       return textSpanCustom(
//         text: LocaleKeys.onWay,
//         style: AppFontStyle.orange11w400(),
//       );
//     case StatusRequest.arrived:
//       return textSpanCustom(
//         text: LocaleKeys.arrived,
//         style: AppFontStyle.green11w400(),
//       );
//     case StatusRequest.supplied:
//       return textSpanCustom(
//         text: LocaleKeys.supplied,
//         style: AppFontStyle.red11w400(),
//       );
//     case StatusRequest.received:
//       return textSpanCustom(
//         text: LocaleKeys.received,
//         style: AppFontStyle.green11w400(),
//       );
//     case StatusRequest.approved:
//       return textSpanCustom(
//         text: LocaleKeys.approved,
//         style: AppFontStyle.green11w400(),
//       );
//     default:
//       return textSpanCustom(
//         text: LocaleKeys.pending,
//         style: AppFontStyle.orange11w400(),
//       );
//   }
// }

// String statusRequestFunText(StatusRequest state, {bool style = false}) {
//   switch (state) {
//     case StatusRequest.pending:
//       return LocaleKeys.pending;
//     case StatusRequest.newOrder:
//       return LocaleKeys.newp;

//     case StatusRequest.cancelled:
//       return LocaleKeys.cancelled;
//     case StatusRequest.onWay:
//       return LocaleKeys.onWay;
//     case StatusRequest.arrived:
//       return LocaleKeys.arrived;
//     case StatusRequest.supplied:
//       return LocaleKeys.supplied;
//     case StatusRequest.received:
//       return LocaleKeys.received;
//     case StatusRequest.approved:
//       return LocaleKeys.approved;
//     default:
//       return LocaleKeys.pending;
//   }
// }
