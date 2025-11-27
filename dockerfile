# Сборка
FROM golang:1.24.0

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем исходные файлы
COPY go.mod go.sum ./

RUN go mod download
#RUN go mod tidy

# Копируем исходный код
COPY . .

RUN go mod tidy

# Компилируем приложение
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /parcel-tracker

# Определяем точку входа
CMD ["/parcel-tracker"]
