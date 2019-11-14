# procs-sagas.md
## linux packages (ubuntu 18.04)
```sh
sudo apt-get install build-essential graphviz libboost-all-dev
sudo apt-get install openjdk-8-jdk
# build tools
sudo apt-get install maven gradle
# dev tools
sudo apt-get install mysql-client-5.7
sudo apt-get install libldap2-dev libsasl2-dev libxml2-dev libxslt-dev python-dev python3-lxml

# graphviz cli render
sudo cpan Graph::Easy
```

## conda packages
```sh
conda install -c conda-forge icu
```

## packages: bigdata
* fire, waitress, simplejson, clipboard, graphviz
* honcho
* rasa, spacy
* py4j, kazoo
* aio-pika, aiohttp, pika
* pypinyin, jieba, nltk, stanfordnlp, pyltp, kroman, cyrtranslit, iso-639
* jupyter, streamlit
* OdooRPC
* PyExecJS, bs4
* pyicu, morfessor pycld2 polyglot
* graphene, pyarrow

## docker
```sh
cd /pi/stack
# rabbit, mosquitto, duckling, mongo
cd compose/dist && docker-compose up
# or: backend
# or: start bus
```

## specials
✔ pyknp: juman/juman++, knp
    + workspace/rasa/japanese/procs-pyknp.md
✔ spacy: language-models
    $ pip install /pi/ai/spacy/2.2/*

```sh
$ cd /pi/stack
$ scripts/download_spacy_models.sh
$ python -m spacy validate
```

## apps
```sh
$ cd /pi/stack
# $ sudo cp -r ./conf /pi/conf
$ sudo ln -s /pi/stack/conf /pi/conf
# check conf
$ python -m sagas.conf.conf validate

$ . /vagrant/env.sh
$ using bigdata
# $ python -m sagas.nlu.parse_servant run
$ honcho start -f Procfile_linux
# or: s1
```

## apps: rasa
```sh
$ conda create --name rasa python=3.6
$ using rasa
$ pip install rasa-nlu==0.13.7
$ pip install rasa-core==0.12.2
$ pip install jieba sklearn_crfsuite
$ pip install fire honcho
$ honcho start -f Procfile_rasa 
# or: s2
```

## cli
```sh
$ sz '我是一个学生'
$ sj "望遠鏡で泳いでいる少女を見た。"
$ se 'I saw the girl'

# check: nltk
$ python -m sagas.nlu.wordnet_procs print_definition dog
# check knp
$ python -m sagas.ja.knp_procs tree "望遠鏡で泳いでいる少女を見た。"
# check spacy
$ python -m sagas.nlu.spacy_procs ents 'I am from China'
```

## java components
✔ langprocs
    + projs/langprocs, ./build-docker.sh
✔ timenlp
    + projs/timenlp, ./startup.run build
✔ ofbiz (depends: ✔mysql/✔kafka/✔rabbitmq/✔sagas-base)
    + ~/Sagasforce/fedora-28/ofbiz/procs.md
    + langs/procs-kafka-linux.md
    + projs/sagas-base, ./startup.run dist

```sh
cd /vagrant/projs/langprocs
mvn compiler:compile && mvn exec:java -Dexec.mainClass="com.samlet.langprocs.App"

cd /vagrant/projs/timenlp
mvn compiler:compile && mvn exec:java -Dexec.mainClass="com.samlet.bridge.ApplicaEntryPoint"

# check hanlp
$ start ws
$ using bigdata
$ python -m sagas.bots.hanlp_procs deps '苹果电脑可以运 行开源阿尔法狗代码吗'

# check timenlp
$ python -m sagas.zh.timenlp_procs parse "周五下午7点到8点" "2017-07-19-00-00-00"

# ofbiz
# preqs: start bus
# check ofbiz database
$ runi mysql bash
$ mysql -h 192.168.33.30 -uofbiz -pofbiz

# start kafka
$ cd /home/vagrant/kafka/kafka_2.12-2.3.1 && bin/kafka-server-start.sh config/server.properties

$ cd /vagrant/projs/ofbiz-framework/
# init for linux&macos
$ ./gradlew cleanAll loadAll ofbiz
# browse https://localhost:8443/webtools, 使用用户名“admin”和密码“ofbiz”登录并查看.

# only load data
$ ./gradlew loadAll -x test
# normal startup
./gradlew ofbiz -x test

# check ofbiz entities
$ python -m sagas.ofbiz.tools entity-data DataResourceType 1000
# check ofbiz services
$ python -m sagas.ofbiz.tools ping
```

+ shortcuts: ofbiz

```sh
start bus
start kafka
start ofbiz
```

## backend
□ odoo (depends: ✔postgres)
    + stack/procs-postgres.md
    + workspace/odoo/procs-odoo-12.md

```sh
$ conda create --name odoo python=3.6
$ using odoo
$ cd /vagrant/projs/odoo-12.0.post20190620/

$ pip install -r requirements.txt
# $ python setup.py install
$ sudo -u postgres createuser vagrant
$ sudo -u postgres createdb demo
# initialize db: demo, test1 is ./myaddons/test1
$ ./odoo-bin -d demo -i test1
# 因为指定了数据库为demo, 默认用户&密码是: admin&admin

# shell
$ ./odoo-bin shell -d demo 
> self.env['res.partner'].search([('name', 'like', 'Ad')]) 

# check db
$ psql -l  # 列出已有数据库
$ psql demo
demo=# \d test1_test1
demo-# \q

# web
$ ./odoo-bin -d demo 
# 默认用户&密码是: admin&admin
$ open http://192.168.33.30:8069

# check api
$ python -m sagas.crmsfa.odoo_info all_langs
```

+ shortcuts: odoo

```sh
$ start odoo-shell
$ start odoo
```

## cache data: translator
```sh
# export (macos)
mongoexport --collection=trans --db=langs --out=./out/trans.json
# import (macos)
mongoimport --db=langs --collection=trans --file=./out/trans.json

# import (linux)
start ssh
cd /pi/stack/compose/dist
docker-compose ps
docker cp /pi/stack/out/trans.json "$(docker-compose ps -q mongo)":/trans.json
# enter container: runi mongo bash
# or directly exec
docker-compose exec mongo /usr/bin/mongoimport --db=langs --collection=trans --file=/trans.json

# check
$ cd /pi/stack
$ using bigdata
$ python -m sagas.nlu.trans_cacher all_sources vi
```


