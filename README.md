# vague-input-python.vim

VIMでPythonが適当に都合よく入力できるように

'[prabirshrestha/asyncomplete.vim](https://github.com/prabirshrestha/asyncomplete.vim)'に依存

insert mode で以下の Keymap を定義

- CR
    - 補完ウィンドウが開いている→確定
    - その他は普通のCR
- TAB
    - 補完ウィンドウが開いている→次の選択肢（Ctrl-n）
    - インデントの位置→インデント増加（Ctrl-t）
    - その他→強制的に補完ウィンドウを開く
- Shift-TAB
    - 補完ウィンドウが開いている→前の選択肢（Ctrl-p）
    - その他→インデント減少（Ctrl-d）

## 設定方法

vimrc に以下を記述

```
augroup VagueInputPython
    autocmd!
    autocmd Filetype python call vagueinputpython#Configure()
augroup END
```
