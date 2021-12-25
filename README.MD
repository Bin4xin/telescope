# Hello world docker action

This action prints "Hello World" or "Hello" + the name of a person to greet to the log.

- [提升action运行效率参考：Github action 一个接一个运行两个进程](https://qa.1r1g.com/sf/ask/4684132631/?lastactivity)
- [Mark：ChildRepo仓库push提交，能够触发ParentRepo调用相关的workflow进行编译操作](https://www.cnblogs.com/aedjesse/p/14362530.html)

## Inputs

## `who-to-greet`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

## `time`

The time we greeted you.

## Example usage

uses: actions/hello-world-docker-action@v1
with:
  who-to-greet: 'Mona the Octocat'