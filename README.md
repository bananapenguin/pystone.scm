pystone.scm
========

What's pystone.scm?
------
pystone.scmは古典的ベンチマークDhrystoneをPythonに移植したpystone.pyをScheme(Elk)移植したものです。

How to use
-----------
`$ elk -l pystone.scm -h 102400`

-hオプションはヒープサイズ(KB)。デフォルトは512KBだったはず。ある程度大きく取る必要がありそうです。

ループ回数はスクリプト最下行の(main 100000)の値を変えてください

Can I use other implementation?
----------------
Elk以外では試してません。
多分(require 'unix)とか使っているので動かないと思います。

Bug?
-------
ループの数を増やすとこんなふうになってElkがcore吐きます。

`Panic: Visit: object not in prev space at 0xb750cfe0 ('pair') 93 97 (dumping core).`

ある程度ヒープを大きくすると回避できるようですが、100000回以上のループで成功した試しがありません。。。

多分これElkのガベコレ関連のバグだと思うんだけどなあ
