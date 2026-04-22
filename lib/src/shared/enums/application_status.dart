/// Application status for garage owner verification
enum ApplicationStatus {
  pending('PENDING'),
  approved('APPROVED'),
  rejected('REJECTED');

  const ApplicationStatus(this.value);

  final String value;

  static ApplicationStatus fromString(String value) {
    return ApplicationStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => ApplicationStatus.pending,
    );
  }

  bool get isPending => this == ApplicationStatus.pending;
  bool get isApproved => this == ApplicationStatus.approved;
  bool get isRejected => this == ApplicationStatus.rejected;
}
