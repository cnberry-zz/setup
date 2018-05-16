set nocompatible
syntax enable
behave xterm

" Keep tags file in $SRC, so this should work
set tags=./tags,../tags,../../tags,../../../tags,$SRC/tags

" 4 space tabs
set ts=4
set ai
set sw=4

" insert comment macro
map  O/* 70i-o70i-a*/O	

" perform p4 edit
function P4edit(check)
  if a:check == 1 && input("File is read only. p4 edit %? (y/n)") != "y"
    return
  end
  execute "!p4 edit %"
  execute "set noreadonly"
endfunction

" manual
map E :call P4edit(0)

" retrieve perforce log file for a specific changeset
function PerforceDescribe(changeset)
  execute "!p4 describe" a:changeset ">" a:changeset
  execute "split"
  execute "e" a:changeset
endfunction
command -nargs=* PD :call PerforceDescribe(<q-args>)
map <F4> :PD <cword> 

" decrypt a syn file and open it
function Decf()
  execute "!mkdir -p `dirname /tmp/%`"
  execute "!decsyn % /tmp/%.dec"
  execute "e /tmp/%.dec"
endfunction
map <c-d> :call Decf()

" encrypt a syn file
function Encf()
  execute "!mkdir -p `dirname /tmp/%`"
  execute "!encsyn % /tmp/%.enc"
  execute "e /tmp/%.enc"
endfunction
map <c-e> :call Encf()
