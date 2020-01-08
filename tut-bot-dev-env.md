# tut-bot-dev-env.md
## start
```bash
$ xcode-select --install

$ conda create --name rasa python=3.6
$ using rasa
```

1. rasa init/train/shell
2. pycharm imports
3. docker and compose

# mysql
```bash
$ cps # alias cps='docker-compose ps'
$ runi mysql bash  # alias runi='docker-compose exec'
mysql> show databases;
```

4. insomnia
    POST: http://localhost:5005/webhooks/rest/webhook
    data: { "sender":"samlet", "message": "hello" }
    header: Content-Type  application/json

```bash
curl -s --request POST \
          --url http://localhost:5005/webhooks/rest/webhook \
          --header 'content-type: application/json' \
          --data '{
            "sender":"samlet", "message": "hello"
          }' | json
```

+ other messages:
    - { "sender":"samlet", "message": "show me some restaurants" }



