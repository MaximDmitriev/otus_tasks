#!/bin/bash

# Параметры подключения к MySQL
MYSQL_HOST="localhost"
MYSQL_PORT="3306"
MYSQL_USER="root"
MYSQL_PASSWORD="M88zsVH_2D"

# Название базы данных
DATABASE_NAME="mydb"

# Путь к директории для сохранения бекапа
BACKUP_DIR="~/backup"

# Название файла для бекапа
BACKUP_FILENAME="${DATABASE_NAME}_$(date +%Y-%m-%d_%H-%M-%S).sql"

# Получаем позицию бинлога
BINLOG_POSITION=$(mysql -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW MASTER STATUS\G" | grep Position | awk '{print $2}')

# Получаем список таблиц в базе данных
TABLES=$(mysql -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -p$MYSQL_PASSWORD -e "USE ${DATABASE_NAME}; SHOW TABLES;" | tail -n +2)

# Создаем директорию для бекапа, если она не существует
mkdir -p $BACKUP_DIR

# Создаем пустой файл для бекапа
touch $BACKUP_DIR/$BACKUP_FILENAME

# Добавляем в бекап информацию о позиции бинлога
echo "SET @@GLOBAL.gtid_purged='$BINLOG_POSITION';" >> $BACKUP_DIR/$BACKUP_FILENAME

# Бекапим каждую таблицу в отдельности
for TABLE in $TABLES
do
  echo "Backing up table $TABLE"
  mysqldump -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -p$MYSQL_PASSWORD --single-transaction --quick --lock-tables=false $DATABASE_NAME $TABLE >> $BACKUP_DIR/$BACKUP_FILENAME
done

echo "Backup completed: $BACKUP_DIR/$BACKUP_FILENAME"
