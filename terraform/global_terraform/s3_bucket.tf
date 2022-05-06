resource "aws_s3_bucket" "alb_logs" {
    bucket          = "${var.stage}-alb-${var.AWS_ACCOUNT_ID}-logs"
    force_destroy   = true
}

resource "aws_s3_bucket_policy" "this" {
  bucket            = aws_s3_bucket.alb_logs.id
  policy            = data.aws_iam_policy_document.s3_bucket_alb_write.json
}
