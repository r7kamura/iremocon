# Iremocon
Iremocon is a gem for managing [iRemocon](http://i-remocon.com/) through telnet.

## Installation

```
$ gem install iremocon
```

## Usage
iRemocon has following commands (for more details, please see [official document](http://i-remocon.com/development/)).

* au 接続確認用
* is 赤外線発信
* ic リモコン学習開始
* cc リモコン学習中止
* tm タイマーセット
* tl タイマー一覧取得
* td タイマー解除
* ts 現在時刻設定
* tg 現在時刻取得
* vr ファームバージョン番号の取得

You can call it as an instance method of Iremocon class.

```ruby
require "iremocon"

iremocon = Iremocon.new("192.168.0.2")

iremocon.au
#=> send "*au"

iremocon.is(1)
#=> send "*is;1"

iremocon.ic(1)
#=> send "*ic;1"

iremocon.cc
#=> send "*cc"

iremocon.tm(1, 946652400, 60)
#=> send "*tm;1;946652400;60"

iremocon.tm(1, Time.local(2000), 60)
#=> send "*tm;1;946652400;60"

iremocon.tm(1, Time.local(2000))
#=> send "*tm;1;946652400;0"

iremocon.tl
#=> send "*tl"

iremocon.td(1)
#=> send "*td;1"

iremocon.ts(946652400)
#=> send "*ts;946652400"

iremocon.ts(Time.local(2000))
#=> send "*ts;946652400"

iremocon.tg
#=> send "*tg"

iremocon.vr
#=> send "*vr"
```
