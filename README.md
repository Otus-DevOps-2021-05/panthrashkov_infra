# panthrashkov_infra
panthrashkov Infra repository

# Знакомство с облачной инфраструктурой и облачными сервисами

# IP
bastion_IP=178.154.200.159
someinternalhost_IP=10.128.0.18
# Исследовать  способ  подключения  к someinternalhost  в  однукоманду  из  вашего  рабочего  устройства,
# проверить  работоспособностьнайденного решения и внести его в README.md в вашем репозитории
ssh -J appuser@$bastion_IP appuser@$someinternalhost_IP

# Деплой тестового приложения
testapp_IP=178.154.253.27
testapp_port=9292

