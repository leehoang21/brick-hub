https://docs.brickhub.dev/brick-syntax

Brick Hub Logo
BrickHub

🚀 Tổng quan
Bắt đầu

🧑 💻 Cài đặt Mason CLI
📁 Khởi tạo Mason CLI
🧱 Lắp đặt gạch
📝 Liệt kê tất cả các viên gạch đã cài đặt
👷 Sử dụng gạch
Tạo gạch

✨ Tạo gạch
🧱 Cấu trúc của một viên gạch
🥸 Cú pháp gạch
🧑 💻 Phát triển gạch
🪝 Móc
Quản lý gạch

Bắt đầu👷 Sử dụng gạch
👷 Sử dụng gạch
Trong phần này, chúng ta sẽ xem xét cách sử dụng lệnh để tạo mã từ một brick hiện có.make

🚀 Tổng quan
Như chúng ta đã thấy trong phần tổng quan, chúng ta có thể chạy lệnh theo sau là tên của một viên gạch đã cài đặt để tạo mã từ viên gạch đó:mason make

mason make hello
? What is your name? (Dash) Mason
✓ Generated 1 file. (29ms)
  created HELLO.md

🧑 💻 Args dòng lệnh
Theo mặc định, nếu một gạch yêu cầu các biến sẽ nhắc nhở các biến đó như được thấy trong đoạn mã ở trên. Nếu chúng ta biết trước những biến nào mà một viên gạch yêu cầu, chúng ta có thể cung cấp các biến dưới dạng đối số dòng lệnh:masonmason

mason make hello --name Mason
✓ Generated 1 file. (29ms)
  created HELLO.md

Lưu ý làm thế nào trong ví dụ trên, không nhắc tên vì nó đã được cung cấp dưới dạng đối số.mason

GHI
Trong trường hợp có nhiều biến, có thể cung cấp bất kỳ số lượng biến nào trực tiếp dưới dạng arg dòng lệnh và sẽ tự động nhắc bất kỳ biến nào bị thiếu.mason

📝 Tệp cấu hình
Trong một số trường hợp, có thể bất tiện khi phải cung cấp các biến theo cách thủ công hoặc thông qua các arg dòng lệnh (đặc biệt là đối với các mẫu yêu cầu nhiều biến). Trong những trường hợp này, chúng ta có thể cung cấp các biến thông qua tệp cấu hình. Ví dụ: nếu chúng ta tạo một tệp được gọi với nội dung sau:config.json

{
  "name": "Mason"
}

Sau đó, chúng ta có thể chuyển tệp cấu hình đến thông qua tùy chọn:mason make-c

mason make hello -c config.json
✓ Generated 1 file. (29ms)
  created HELLO.md

GHI
Tệp cấu hình có thể có bất kỳ tên nào và có thể tồn tại ở bất kỳ đâu trên hệ thống tệp cục bộ của bạn.

🗂 Thư mục đầu ra tùy chỉnh
Theo mặc định sẽ tạo ra đầu ra trong thư mục làm việc hiện tại nhưng một thư mục đầu ra tùy chỉnh có thể được chỉ định thông qua tùy chọn:mason make-o

mason make hello --name Mason -o ./out
✓ Generated 1 file. (29ms)
  created out/HELLO.md

GHI
mason sẽ tự động tạo bất kỳ thư mục nào bị thiếu cho bạn nếu bạn chỉ định một thư mục đầu ra chưa tồn tại.

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

🕵️ Detecting Changes
In some cases, it may be useful to detect whether running for a given brick produces a diff. For example, you may want to add a step in a continuous integration workflow which runs for a given brick to ensure developers ran a codegen step prior to opening a pull request. The flag will exit with an error code if any files were changed after running :mason makemason make--set-exit-if-changedmason make

# 🚨 Exit with error if any files were changed
mason make hello --name Dash --set-exit-if-changed

Chỉnh sửa trang này
Trước
📝 Liệt kê tất cả các viên gạch đã cài đặt
Sau
Tạo gạch
🚀 Tổng quan
🧑 💻 Args dòng lệnh
📝 Tệp cấu hình
🗂 Thư mục đầu ra tùy chỉnh
❗️ Giải quyết xung đột tệp
✅ Chiến lược giải quyết xung đột
🕵️ Phát hiện thay đổi
Cộng đồng
BrickHub
Twitter
Bất hòa
Tài nguyên
Gói của tuần | Hồi hộp
Livestream Mason | Liên doanh rất tốt
Nhiều hơn
Mở một vấn đề
GitHub
Thợ nề
Đặt nền móng 🧱 ☁️
Bản quyền 2023 © BrickHub.