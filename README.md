# Запуск манифеста

 - для запуска нужно отредактировать файл ./terraform/wp.auto.tfvars

        yc_cloud    = "yandex cloud id"
        yc_folder   = "yandex folder id"
        db_user = "database user"
        db_password = "database password"
        yc_key_file = "path to yandex service account key file"
        path_to_ssh_key = "path to private ssh key file"
        username = "virtual machine user name"        
        
        // Описание для запуска нескольких экземпляров приложения
        // a, b, c необходимо для обозначения регионов
        instance_count = {
            1:"a"
            2:"b"
            3:"c"
        }