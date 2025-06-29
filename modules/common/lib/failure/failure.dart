// import 'package:equatable/equatable.dart';
//
// class Failure extends Equatable {
//   final String message;
//   final int? code;
//   final FailureType? type;
//   final List<String>? validationDetails;
//
//   const Failure(
//       this.message, {
//         this.code,
//         this.validationDetails,
//         this.type
//       });
//
//   @override
//   List<Object?> get props => [message, code, validationDetails ?? []];
//
//   factory Failure.fromApiError(Map<String, dynamic> json) {
//     final rawErrors = (json['errors'] as List?)
//         ?.cast<Map<String, dynamic>>() ??
//         [];
//
//     final details = rawErrors
//         .map((e) => e['detail']?.toString() ?? '')
//         .where((d) => d.isNotEmpty)
//         .toList();
//
//     int? code;
//     if (rawErrors.isNotEmpty) {
//       final rawCode = rawErrors.first['e_code'];
//       code = rawCode is int
//           ? rawCode
//           : int.tryParse(rawCode?.toString() ?? '');
//     }
//
//     final message = details.isNotEmpty
//         ? details.first
//         : (json['message']?.toString() ?? 'Unknown error');
//
//     return Failure(
//       message,
//       code: code,
//       validationDetails: details.isEmpty ? null : details,
//     );
//   }
// }
// enum FailureType { serverError, networkError, unknown }
