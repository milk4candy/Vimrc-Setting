"=========================================================================================
".vimrc 設定說明
"=========================================================================================
"    作者：Peter Lai --> milk4candy@gmail.com
"    版本：1.0 - 2010NOV12
"=========================================================================================
".vimrc 設定
"=========================================================================================
"
"一般設定：    
"
    	set nocompatible  "關閉vi相容模式
	set nobackup	  "編輯時不作備份
	set nowb	  "覆寫前不作備份
	set noswapfile    "?
        set number        "顯示行數
	set cmdheight=2	  "命令列高度
        set ruler	  "在狀態列顯示遊標所在處之狀態
        set bg=dark	  "背景爲dark
        colorscheme slate
"----------------------------------------------------------------------------------------
"
"排版設定：

	set autoindent	 		 "自動縮排
	set smartindent 		 
	set backspace=indent,eol,start   "backspace可刪去所有字元
	set expandtab
	set softtabstop=4                "按一次tab空出四個空白字元 
	set tabstop=8			 "tab長度爲八個字元（Ctrl+v+tab）
	set shiftwidth=4

        "補齊括弧
        :inoremap ( ()<ESC>i
        :inoremap ) <c-r>=ClosePair(')')<CR>
        :inoremap { {}<ESC>i
        :inoremap } <c-r>=ClosePair('}')<CR>
        :inoremap [ []<ESC>i
        :inoremap ] <c-r>=ClosePair(']')<CR>
        :inoremap < <><ESC>i
        :inoremap > <c-r>=ClosePair('>')<CR>

        function ClosePair(char)
            if getline('.')[col('.') - 1] == a:char
                return "\<Right>"
            else
                return a:char
            endif
        endf
"----------------------------------------------------------------------------------------
"
"文字編碼設定
"
	set fileencodings=utf8
	set termencoding=utf8
	set enc=utf8
	set tenc=utf8
"----------------------------------------------------------------------------------------
"
"搜尋設定
"
	set noignorecase  "搜尋需區分大小寫
	set incsearch	  "輸入搜尋字串時立即尋找
	set hlsearch	  "將符合搜尋之字串反白顯示
"----------------------------------------------------------------------------------------
"
"語法偵測
"
	syntax on		     "enable syntax highlight
	filetype plugin indent on    "檢查檔案類型並帶入語法規則
	set foldmethod=syntax        
"----------------------------------------------------------------------------------------
"
"命令設定
"
	set history=100     "保留過去100個命令紀錄
	set showcmd         "Show (partial) command in the last line of the screen.  
"
   "******************** autocmd setting*******************************************
   "                                                                              
	" Only do this part when compiled with support for autocommands.
	if has("autocmd")

  	" Enable file type detection.
  	" Use the default filetype settings, so that mail gets 'tw' set to 72,
  	" 'cindent' is on in C files, etc.
  	" Also load indent files, to automatically do language-dependent indenting.
  	filetype plugin indent on

  	" Put these in an autocmd group, so that we can delete them easily.
  	augroup vimrcEx
  	au!

  	" For all text files set 'textwidth' to 78 characters.
  	autocmd FileType text setlocal textwidth=78

  	" When editing a file, always jump to the last known cursor position.
  	" Don't do it when the position is invalid or when inside an event handler
  	" (happens when dropping a file on gvim).
  	" Also don't do it when the mark is in the first line, that is the default
  	" position when opening a file.
  	autocmd BufReadPost *
     \ if line("'\"") > 1 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

  	augroup END

	endif " has("autocmd")
   
   "************** End of autocmd setting *****************************************
"----------------------------------------------------------------------------------------
"
"錯誤訊息設定

	set noerrorbells	"無錯誤警示音
	set novisualbell	"無錯誤閃爍提醒
"----------------------------------------------------------------------------------------
"
"其他設定
"
" Don't use Ex mode, use Q for formatting
	map Q gq
	
"CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
	inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
	if has('mouse')
	   set mouse=a
	   endif

" Convenient command to see the difference between the current buffer and 
" the file it was loaded from, thus the changes you made.
" Only define it when not defined already.
	if !exists(":DiffOrig")
	  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		              \ | wincmd p | diffthis
    endif
"----------------------------------------------------------------------------------------
"========================================================================================
"                                      End of .vimrc
"========================================================================================
