# tut-date-time.md
* 关于时间和日期的抽取处理.
* DateInspector使用了多个provider来对日期时间等维度的实体进行提取, 主要的provider是duckling.
* actions未打印出相应的调试信息是因为honcho启动器的问题, 如果是使用logger方式输出调试信息的话, 就不会出现这个问题.

+ cli测试:
    curl -XPOST http://0.0.0.0:8000/parse --data 'locale=zh_CN&text=上星期天' | json
    curl -XPOST http://0.0.0.0:8000/parse --data 'locale=zh_Nothing&text=上星期天' | json
    curl -XPOST http://0.0.0.0:8000/parse --data 'locale=ja_Nothing&text=あしたは四月四日です。'

    curl -XPOST http://0.0.0.0:8000/parse --data 'locale=de_Nothing&text=Morgen mittag'
    curl -XPOST http://0.0.0.0:8000/parse --data 'locale=de_Nothing&text=Am letzten Sonntag'

+ stack/procs-duckling.ipynb  (访问duckling进行日期时间分析)
+ sagas/nlu/content_representers.py  (解读分析结果)
    $ python -m sagas.nlu.content_representers extract_duckling_dt '上个星期编辑'
    $ python -m sagas.nlu.content_representers extract_duckling_dt '周五下午7点到8点'
    $ python -m sagas.nlu.content_representers extract_duckling_dt '金曜日の午後7時から午後8時' ja
    $ python -m sagas.nlu.content_representers extract_duckling_dt 'fifty damage' en
+ sagas/nlu/extractor_cli.py  (处理分析结果)
    $ python -m sagas.nlu.extractor_cli duckling 'tomorrow at eight' en
    $ python -m sagas.nlu.extractor_cli duckling "3 mins" en
    $ python -m sagas.nlu.extractor_cli duckling "last week" en
    $ python -m sagas.nlu.extractor_cli duckling "明天是九月九日" zh
    $ python -m sagas.nlu.extractor_cli duckling 'あしたは四月四日です。' ja
    $ python -m sagas.nlu.extractor_cli duckling '上周' zh    

+ sagas/nlu/inspectors.py: DateInspector.duckling_provider  (封装分析结果)
    # 将解析结果附加到inspector的结果数据集中, 这个结果数据集将在backend-actions中被处理
    ctx.add_result(self.name(), self.provider, key, resp['data'])

* honcho: (启动基础的nlu服务组件, 包括duckling)
    sagas-ai/bots/agent_dispatcher/Procfile
    sagas-ai/bots/agent_dispatcher/Procfile_agent

    + 如果使用duckling, 则使用:
        $ docker run -it -p 8000:8000 rasa/duckling

+ sagas-ai/bots/agent_dispatcher/assets/rs_common_en.yml (规则集)
    intents: birth, date_and_time

+ sagas-ai/bots/agent_dispatcher/domain.yml (意图-命令映射)
    triggers: action_dump_info, action_date_and_time
+ sagas-ai/bots/agent_dispatcher/actions/actions.py: ActionDateAndTime  (backend-actions)
    rasa run actions -p 5077

+ saai/procs-bot-actions.ipynb  (在jupyter里演练agent-client-api)
    talk('I was born in the summer of 1999.')
+ sagas-ai/bots/agent_dispatcher/cli/dispatcher_cli.py  (命令行client调用)
    $ python -m cli.dispatcher_cli dump 'I was born in the summer of 1999.'



