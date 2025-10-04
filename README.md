
Các tệp đã tạo

- `Dockerfile` - image cơ bản có openssh-server và user `user`.
- `docker-compose.yml` - mapping host:2222 -> container:22 để dễ SSH.

Hướng dẫn nhanh

1) Build và chạy container

   docker-compose build
   docker-compose up -d

   (nếu docker-compose không nằm trong PATH, dùng Docker Desktop hoặc `docker compose`)
2) SSH vào container từ Windows
   Trong PowerShell chạy:

   ssh user@localhost -p 2222

   Mật khẩu: password
3) Từ trong container, cài DE (ví dụ XFCE) và TigerVNC
   Sau SSH vào container, chạy các lệnh (ví dụ dùng apt/ubuntu):

   sudo apt update
   sudo apt update sudo apt install xfce4 tightvncserver

   # Thiết lập mật khẩu VNC cho user

   vncserver :1

   # Khởi VNC server (display :1)

   vncserver :1 -geometry 1920x1080 -depth 24
4) Kết nối từ Windows

   - Tải RealVNC truy cập localhost:5901
