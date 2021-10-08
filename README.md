### Запуск манифеста

 - для запуска нужно добавить файл ./terraform/wp.auto.tfvars
   со следующим содержимым:

        yc_cloud    = "yandex cloud id"
        yc_folder   = "folder_id"
        db_user     = "user"
        db_password = "pa$$w0rd"
        yc_key_file = "path to yandex service accoun key file"

username             = "ubuntu"
path_to_ssh_pub_key  = "~/.ssh/id_rsa.pub"
path_to_ssh_priv_key = "~/.ssh/id_rsa"

instances = {
  1 : "a"
  2 : "b"
  3 : "c"
}
        yc_folder   = "yandex folder id"
        db_user     = "database user name"
        db_password = "database password"
        yc_key_file = "path to yandex service account key file"
        
        //пользователь и ключ для подключения к 3-м ВМ
        username            = "virtual machine user name"    
        path_to_ssh_pub_key = "~/.ssh/id_rsa.pub"

        //это для подключения к виртуальной машине в секции provisioner
        path_to_ssh_priv_key = "~/.ssh/id_rsa"
        
        // Описание для запуска нескольких экземпляров приложения
        // a, b, c необходимо для обозначения регионов yandex_cloud
        instance_count = {
            1:"a"
            2:"b"
            3:"c"
        }
 - далее создав и перейдя/находясь в директории ./terraform запускаем
        
        terraform init
        terraform apply --auto-approve


 - если всё верно terraform запустит в ЯО три подсети, три виртуальные машины, кластер PostgresSQL из 3-х нод и балансировщик нагрузки для приложения, а так же предустановку для проверки результата.

 - затем для ликвидации стека

       terraform destroy --auto-approve