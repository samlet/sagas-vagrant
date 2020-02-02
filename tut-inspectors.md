# tut-inspectors.md
1. 自定义一个inspector(语法成分检查器), 这是构建nlu规则引擎的基础.
    
    * simplebot(https://github.com/samlet/simplebot)包含了查找表功能, 通过查找表来支持大量的菜肴(cuisines)和城市(cities), 以此训练出领域实体, 而cust_entity_inspector.py就是用于检查句子中指定成分是否是这两种领域实体.
    
    * agent_dispatcher(https://github.com/samlet/saai/tree/master/bots/agent_dispatcher)包含了所需的组件, 可以参照这个工程来创建新的工程.

■ 实体处理和分析工具: 精确语义理解
    + procs-rasa-entity-iob.ipynb
        (https://github.com/samlet/saai/blob/master/notebook/procs-rasa-entity-iob.ipynb)
        
        * 如何编写一个自定义的inspector: 这里是一个稍复杂的示范过程, 检测指定的句子成分里是否包含指定的领域实体(crf训练识别), 比如obl成分中是否包含cuisine实体

    + procs-parse-chunks.ipynb
        * 各语言的domains分析图
    + procs-crf.ipynb
        * 直接使用crf来进行实体的训练/提取
    
    0.1 cli toolkits:
        * se, sid, sf, sj/sja, ...
        * def
        * sagas vis
        * sagas.nlu.ruleset_procs
    0.2 procs-*.ipynb
    0.3 现有的inspectors
        * stack工程里有很多用于各种目的的inspectors, rules.py文件中有这些inspectors的使用范例.
    0.4 使用了查找表的领域实体训练:
        + ws/simple
    0.5 可以将agent_dispatcher作为工程模板, 新的模块可以基于这个模板进行创建;
        * https://github.com/samlet/saai/tree/master/bots/agent_dispatcher

    1. 自定义inspector:
        + sagas-ai/bots/agent_dispatcher/inspectors/cust_entity_inspector.py
    2. 注册inspector:
        + sagas-ai/bots/agent_dispatcher/assets/inspectors.json
    3. 在规则中使用自定义的inspector:
        + sagas-ai/bots/agent_dispatcher/assets/rs_common_en.yml
    4. 测试rulesets:
        $ sagas examples food en True  # 必须要在agent_dispatcher目录下执行, 因为注册文件和实现类都在这个目录下
    5. 应用rulesets:
        $ sagas ruleset 'how about french food?' food en True

    * 预处理: 领域实体置换; 依存分析将针对已经过滤后的句子;

2. rasa-nlu兼容的意图推断接口

■ 使用sagas/saai作为nlu, 提供精确语义理解, 来集成rasa对话管理和交互训练:
    * nlu-parse-api, actions, ..

    + sagas-ai/bots/agent_dispatcher/procs-ruleset-kit.ipynb
    + sagas-ai/bots/agent_dispatcher/servants/avatar_blueprints.py

    ■ 因为评估intent是按domains来进行的, 一个句子可能有多个domains, 所以在使用rasa-nlu格式整合的时候, 每个domains作为一个entity, 而相应的inspector数据则作为additional_info; start/end直接以中心词的位置来标记就可以了;
        + procs-nlu-integration.ipynb, procs-ruleset-kit.ipynb
        + sagas/tool/dynamic_rules.py, sagas/kit/rulesets_kit.py

    * intent providers: rasa-nlu, saai-rulesets, others(比如bert, snips-nlu, ...)

■ rasa-nlu兼容的意图推断的api实现:
    + sagas-ai/bots/agent_dispatcher/servants/nlu_dispatcher.py
    + sagas-ai/bots/agent_dispatcher/servants/nlu_mod.py
    
    + bots/agent_dispatcher/procs-nlu-integration.ipynb
    + bots/agent_dispatcher/procs-bot-actions.ipynb

- 过程比较复杂, 可能遇到的问题也会比较多. 到时候总结一下问题再做个新的指导视频吧.




