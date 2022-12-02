#!/bin/sh

echo '#!/bin/sh' > /etc/rc.d/rc.local
chmod +x /etc/rc.d/rc.local

echo "cd /root/1580-2022-m_os-auto" >> /etc/rc.d/rc.local
echo "sh /root/1580-2022-m_os-auto/bin/main.sh" >> /etc/rc.d/rc.local

