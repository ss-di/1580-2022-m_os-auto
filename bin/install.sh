#!/bin/sh

echo '#!/bin/sh' > /etc/rc.d/rc.local # создаем файл, который будет запустаться при старте системы
chmod +x /etc/rc.d/rc.local           # даем права на запуск

echo "cd /root/1580-2022-m_os-auto" >> /etc/rc.d/rc.local # будем переходить в каталог скрипта
echo "sh bin/main.sh" >> /etc/rc.d/rc.local # и запускать нужный файлик

