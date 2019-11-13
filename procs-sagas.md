# procs-sagas.md
## linux packages (ubuntu 18.04)
```sh
sudo apt-get install build-essential graphviz libboost-all-dev
sudo apt-get install openjdk-8-jdk
# build tools
sudo apt-get install maven gradle
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
* py4j
* aio-pika, aiohttp, pika
* pypinyin, jieba, nltk, stanfordnlp, pyltp, kroman, cyrtranslit, iso-639
* jupyter, streamlit
* OdooRPC
* PyExecJS, bs4
* pyicu, morfessor pycld2 polyglot

## docker
```sh
cd /pi/stack
# rabbit, mosquitto, duckling, mongo
cd compose/dist && docker-compose up
# or: backend
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
$ sudo cp -r ./conf /pi/conf

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
□ langprocs
□ timenlp
□ ofbiz
    + ~/Sagasforce/fedora-28/ofbiz/procs.md

## backend
□ odoo


