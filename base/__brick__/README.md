#install package
fvm flutter pub add visibility_detector
fvm flutter pub add cached_network_image
fvm flutter pub add flutter_i18n 
fvm flutter pub add either_dart
fvm flutter pub add json_annotation
fvm flutter pub add dio 
fvm flutter pub add flutter_translate
fvm flutter pub add auto_route
fvm flutter pub add flutter_svg 
fvm flutter pub add injectable
fvm flutter pub add get_it
fvm flutter pub add pull_to_refresh 
fvm flutter pub add flutter_screenutil
fvm flutter pub add flutter_bloc
fvm flutter pub add freezed_annotation
fvm flutter pub add retrofit_generator
fvm flutter pub add nb_utils
fvm flutter pub add shimmer

fvm flutter pub add injectable_generator  --dev
fvm flutter pub add build_runner --dev
fvm flutter pub add auto_route_generator  --dev
fvm flutter pub add json_serializable --dev
fvm flutter pub add freezed --dev
fvm flutter pub add flutter_launcher_icons --dev
fvm flutter pub add flutter_gen_runner --dev
fvm flutter pub add flutter_lints --dev

❗️ Giải quyết xung đột tệp
Xung đột có thể xảy ra khi cố gắng tạo tệp đã tồn tại và nội dung của tệp hiện có khác với nội dung của tệp được tạo.mason

mason make hello --name Dash
conflict HELLO.md
Overwrite HELLO.md? (Yyna) y
✓ Generated 1 file. (21.6s)
  created HELLO.md

HELLO.md

- Hello Mason! 👋
+ Hello Dash! 👋

Theo mặc định, sẽ nhắc nhở trên mỗi xung đột tệp và sẽ cho phép người dùng chỉ định cách giải quyết xung đột thông qua các tùy chọn sau:mason make

y - yes, overwrite (default)
Y - yes, overwrite this and all others
n - no, do not overwrite
a - append to existing file

✅ Chiến lược giải quyết xung đột
Chiến lược giải quyết xung đột tệp tùy chỉnh có thể được chỉ định thông qua tùy chọn:--on-conflict

# Always prompt when there is a file conflict (default)
mason make hello --name Mason --on-conflict prompt

# Always overwrite when there is a file conflict
mason make hello --name Mason --on-conflict overwrite

# Always skip when there is a file conflict
mason make hello --name Mason --on-conflict skip

# Always append when there is a file conflict
mason make hello --name Mason --on-conflict append