#!/bin/bash

echo "🚀 Đang khởi động Docker containers..."

# Kiểm tra xem Docker có đang chạy không
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker không đang chạy. Vui lòng khởi động Docker trước."
    exit 1
fi

# Build và khởi động containers
docker-compose up -d --build

# Đợi MySQL sẵn sàng
echo "⏳ Đang đợi MySQL khởi động..."
sleep 10

# Kiểm tra trạng thái
echo ""
echo "✅ Docker containers đã được khởi động!"
echo ""
echo "📋 Thông tin truy cập:"
echo "   - Website: http://localhost"
echo "   - phpMyAdmin: http://localhost:8080"
echo "   - MySQL: localhost:3306"
echo ""
echo "📊 Xem logs: docker-compose logs -f"
echo "🛑 Dừng containers: docker-compose down"
echo ""

