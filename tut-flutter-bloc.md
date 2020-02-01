# tut-flutter-bloc.md
+ flutter bloc: bots的前端逻辑处理.
    sagas_meta: https://github.com/samlet/sagas-meta/tree/v0.x
    catalog: https://github.com/samlet/sagas-mobile-fe/tree/v0.x

* 后半段处于半休克状态的原因, 可能是docker使用的虚拟机(Docker for Mac uses HyperKit, Hyperkit is a lightweight macOS virtualization solution built on top of Hypervisor)与android模拟器的虚拟机有点冲突, 多次重启模拟器后就严重拖慢了系统的响应速度. 所以实际应用时, 向rabbitmq发送消息是非常快的, flutter的调试运行速度也不至于那么慢. 懒得重录了, 凑合看吧.

