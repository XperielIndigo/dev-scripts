alias test-cc='bazel test //src/test/cc/... --fetch=false'
alias run-ios-wrapper='bazel run //src/main/objc/com/xperiel/newapi:TestNewApi --fetch=false --ios_cpu=i386'
alias build-cc='bazel build //src/main/cc/... --fetch=false'
alias build-objc='bazel build //src/main/objc/... --fetch=false'
alias build-ios-wrapper='bazel build //src/main/objc/com/xperiel/newapi:all --fetch=false --ios_cpu=i386'
alias android-wrapper='bazel mobile-install //src/main/java/com/xperiel/android/api:wrapper --fetch=false'
alias incremental-android-wrapper='bazel mobile-install --incremental //src/main/java/com/xperiel/android/api:wrapper --fetch=false'
alias test-java-small='bazel test //src/test/java/... --test_size_filters=small --fetch=false'
alias fix-lint='./buildtools/dev/fix-common-cc-lint.py'
alias recent-commits='git log master --oneline --reverse | nl | tac | head -n 20'
