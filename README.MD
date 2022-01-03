<h1 align="center"><a href="https://sentrylab.cn/">哨兵望远镜</a></h1>

待参考文章
- [提升action运行效率参考：Github action 一个接一个运行两个进程](https://qa.1r1g.com/sf/ask/4684132631/?lastactivity)
- [Mark：ChildRepo仓库push提交，能够触发ParentRepo调用相关的workflow进行编译操作](https://www.cnblogs.com/aedjesse/p/14362530.html)

## 亟需完成

- TODO:
  - [ ] set `$1/$searchDomain` into github action env. not to type in 3 times while run scripts 3 way.
  - [x] test in action. `[2022/01/01/23:18:26 CST]`
  - [ ] use color_print_fun.sh glabolly.
  - [ ]function `_domain_checkValid_()` are in bug while program running, need to fix it.
  - ...

## 贡献者

| 仓库贡献者 | Pull & Request | 备注 |
| :--- | :--- | :--- |
| [@Yang2635 ](https://github.com/Yang2635) | - | <ul><li>[2021/12/25/12:35:25]<ADD::7zzs/chrome-linux></li><li>优化chrome可执行上传文件容量大小</li><li>优化：解压文件流程时取消显示进度和文件</li></ul> |


## Example usage

uses: actions/hello-world-docker-action@v1
with:
  who-to-greet: 'Mona the Octocat'