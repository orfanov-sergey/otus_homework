# Запуск манифеста

 - для запуска нужно добавить файл ./terraform/wp.auto.tfvars

        yc_cloud    = "yandex cloud id"
        yc_folder   = "yandex folder id"
        db_user = "database user name"
        db_password = "database password"
        yc_key_file = "path to yandex service account key file"
        
        username = "virtual machine user name"    
            
        //это для подключения к виртуальной машине
        path_to_ssh_key = "path to private ssh key file"
        
        // Описание для запуска нескольких экземпляров приложения
        // a, b, c необходимо для обозначения регионов yandex_cloud
        instance_count = {
            1:"a"
            2:"b"
            3:"c"
        }