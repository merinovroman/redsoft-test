# Test for RedSoft

## Demo

Демо находится [здесь] (redsoft.zipofar.ru) 

## Описание задания

Каталог содержащий два вида объектов
* Раздел
* Товар

### Раздел
Древовидная структура с неограниченной вложенностью

### Товар
Представляет собой объект со следующими полями
* ID
* Название
* Наличие
* Цена
* Производитель

Товар может быть привязан к нескольким разделам
 
### Функции каталога
Взаимодействие с пользователем происходит посредством HTTP запросов к API серверу. Все ответы представляют собой JSON объекты.

Сервер реализует следующие методы:
* Выдача товара по ID
* Выдача товаров по вхождению подстроки в названии
* Выдача товаров по производителю/производителям
* Выдача товаров по разделу (только раздел)
* Выдача товаров по разделу и вложенным разделам
  
###  Задание
* Спроектировать БД и написать скрипт по ее созданию
* Подготовить данные для заполнения БД
* Реализовать API с вышеуказанными методами
* Написать документацию по использованию этого API

Формат запросов и ответов определяется исполнителем.

## API

URL не должен заканчиваться символом слеш.

Для всех случаев, когда присутствует параметр {offset}, стандартное значение {offset} = 0, является опциональным.

* Выдача товара по ID
```
/api/id/{id_product}
```

* Выдача товаров по вхождению подстроки в названии.
```
/api/product_name/{name}/{offset}
```

* Выдача товаров по производителю/производителям
```
/api/brand/{name}/{offset}
/api/brand/{name1+name2+name3}/{offset}
```

* Выдача товаров по разделу (только раздел)
```
/api/section/{name}/{offset}
```

* Выдача товаров по разделу и вложенным разделам

Начинать запрос нужно с корневого узла, разделяя нижележащие узлы символами '>>'

```
/api/sections/{root>>node>>node>>leaf}/{offset}
```

* Получить всю иерархию разделов (json)

```
/api/hierarchy
```

* Получить всю иерархию разделов в виде html списка (добавить /1)

```
/api/hierarchy/1
```

## Requirements

* Mac / Linux
* Docker
* Docker Compose

## Install

Clone repo

```bash
$ git clone https://github.com/zipofar/redsoft-test.git
```
[Install ansible](http://docs.ansible.com/ansible/latest/intro_installation.html)

```bash
$ cd redsoft-test
$ make ansible-development-setup
$ make run-dev
$ make development-setup
```

По умолчанию логи находятся в app/storage/logs. Для того, чтобы приложение могло создать в этой директории файл логов, необходимо изменить разрешения.
```
sudo chmod 777 app/storage/logs
```

Open <http://localhost:4000>

Так же в dev окружении настроен Xdebug на порту 9001
## Run

```bash
$ make run-dev
```

Open <http://localhost:4000>

## Test
If did not run app, first "make run-dev"
```
$ make run-dev
```
run test
```bash
$ make test
```
