# Hướng dẫn chạy dự án với Docker

## Yêu cầu
- Docker
- Docker Compose

## Cài đặt và chạy

### Cách 1: Sử dụng script (Khuyến nghị)
```bash
./docker-start.sh
```

### Cách 2: Chạy thủ công
```bash
# Build và khởi động containers
docker-compose up -d --build

# Xem logs
docker-compose logs -f
```

### 2. Cấu hình database
Nếu bạn muốn sử dụng database trong Docker, có 2 cách:

**Cách 1:** Sử dụng file database.docker.php (đã được tạo sẵn)
- Đổi tên hoặc copy: `cp config/database.docker.php config/database.php`

**Cách 2:** Sửa file `config/database.php`:
- Thay `127.0.0.1:3306` thành `mysql:3306`

### 3. Truy cập ứng dụng
- Website: http://localhost
- phpMyAdmin: http://localhost:8080
  - Username: `root`
  - Password: `secret`

### 4. Import database (nếu có file SQL)
File SQL sẽ tự động được import khi container MySQL khởi động lần đầu (nếu file `truyentranh.sql` tồn tại).

## Các lệnh hữu ích

### Xem logs
```bash
docker-compose logs -f
```

### Dừng containers
```bash
docker-compose down
```

### Dừng và xóa volumes (bao gồm database)
```bash
docker-compose down -v
```

### Restart một service cụ thể
```bash
docker-compose restart nginx
docker-compose restart php
docker-compose restart mysql
```

### Vào container PHP để chạy lệnh
```bash
docker-compose exec php sh
```

### Vào container MySQL
```bash
docker-compose exec mysql mysql -u root -psecret dev_otruyen
```

## Cấu trúc
Tất cả các file Docker đã được đặt trong thư mục `public_html`:
- `nginx.conf`: Cấu hình Nginx (đã chuyển đổi từ .htaccess)
- `docker-compose.yml`: Cấu hình Docker Compose
- `Dockerfile.php`: Dockerfile cho PHP-FPM
- `docker-start.sh`: Script khởi động nhanh
- `config/database.docker.php`: Cấu hình database cho Docker

## Lưu ý
- Port 80 đã được sử dụng cho Nginx
- Port 3306 đã được sử dụng cho MySQL
- Port 8080 đã được sử dụng cho phpMyAdmin
- Nếu các port này đã được sử dụng, bạn cần thay đổi trong `docker-compose.yml`

