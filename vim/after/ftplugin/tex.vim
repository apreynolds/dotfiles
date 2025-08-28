map <leader>vs :Start! open %:r-solutions.pdf <CR>
map <leader>vm :Start! open %:r-marker.pdf <CR>
map <leader>vi :Start! open %:r-instructor.pdf <CR>
map <leader>vc :Start! open %:r-coverpage.pdf <CR>
map <leader>vp :Start! open %:r-pf.pdf <CR>
map <leader>vh :Start! open %:r.html<CR>

map <F10> :VimtexCompile
map <F12> :Compile
map <leader>LL :call CompileBasic()<CR>
map <leader>LI :call CompileInstructor()<CR>
map <leader>LS :call CompileSolutions()<CR>
map <leader>LM :call CompileMarkerSolutions()<CR>
map <leader>LC :call CompileCover()<CR>
map <leader>LK :call CompileLectures()<CR>
map <leader>LE :call CompileEscape()<CR>

command! -nargs=0 GenerateBasic
      \ Start! latexmk -pdf -pdflatex="pdflatex --shell-escape \%O \%S" %  
      \ && latexmk -c % && 

command! -nargs=0 GenerateInstructor
      \ Start! latexmk -silent -pdf -jobname=%:r-instructor -pdflatex="pdflatex --shell-escape \%O '\def\MyComments{1} \def\Solutions{1} \input{\%S}'" %:r 
      \ && latexmk -c -jobname=%:r-instructor %:r 

command! -nargs=0 GenerateStudentCopy
      \ Start! latexmk -silent -pdf -jobname=%:r-student -pdflatex="pdflatex --shell-escape \%O '\def\StudentCopy{1} \input{\%S}'" %:r 
      \ && latexmk -c -jobname=%:r-student %:r 

command! -nargs=0 GenerateSolutions
      \ Start! latexmk -pdf -jobname=%:r-solutions -pdflatex="pdflatex --shell-escape \%O '\def\Solutions{1} \input{\%S}'" % 
      \ && latexmk -c -jobname=%:r-solutions % 

command! -nargs=0 GenerateMarker
      \ Start! latexmk -pdf -jobname=%:r-marker -pdflatex="pdflatex --shell-escape \%O '\def\Solutions{1} \def\MyComments{1} \input{\%S}'" % 
      \ && latexmk -c -jobname=%:r-marker % 

command! -nargs=0 GenerateCover
      \ Start! latexmk -pdf -jobname=%:r-coverpage -pdflatex="pdflatex --shell-escape \%O '\def\FirstPageOnly{1} \input{\%S}'" % 
      \ && latexmk -c -jobname=%:r-coverpage %

command! -nargs=0 CompileEscape write | Start! latexmk -pdf -pdflatex="pdflatex --shell-escape \%O \%S" % && latexmk -c % 

command! -nargs=1 MoveLectures call MoveLecturesFn( <q-args> )

function! MoveLecturesFn(number)
  let l:cwd = getcwd()
  lcd %:h

  let l:outputdir="/Users/preynol1/PDFExpert/Documents/"
  let l:pdfbasic = expand( '%:r' ) . ".pdf"
  let l:pdfinstructor = expand( '%:r' ) . "-instructor.pdf"

  if filereadable(l:pdfbasic)
    let tempcommand = 'rsync ' . l:pdfbasic . ' ' . l:outputdir . a:number . '/'
    call system(tempcommand)
  endif

  if filereadable(l:pdfinstructor)
    let tempcommandtwo = 'rsync ' . l:pdfinstructor . ' ' . l:outputdir . a:number . '/'
    call system(tempcommandtwo)
  endif

  execute "lcd " . l:cwd

endfunction

function! CompileBasic()
  let l:cwd = getcwd()
  lcd %:h

  execute 'write'
  execute 'GenerateBasic'
      
  execute "lcd " . l:cwd

endfunction

function! CompileInstructor()
  let l:cwd = getcwd()
  lcd %:h

  execute 'write'
  execute 'GenerateBasic'
  execute 'GenerateInstructor'
  execute "lcd " . l:cwd

endfunction

function! CompileLectures()
  let l:cwd = getcwd()
  lcd %:h

  execute 'write'
  execute 'GenerateBasic'
  execute 'GenerateInstructor'
  execute 'GenerateStudentCopy'
  execute "lcd " . l:cwd

endfunction

function! CompileSolutions()
  let l:cwd = getcwd()
  lcd %:h

  execute 'write'
  execute 'GenerateBasic'
  execute 'GenerateSolutions'
  execute "lcd " . l:cwd

endfunction

function! CompileMarkerSolutions()
  let l:cwd = getcwd()
  lcd %:h

  execute 'write'
  execute 'GenerateBasic'
  execute 'GenerateSolutions'
  execute 'GenerateMarker'
  execute "lcd " . l:cwd

endfunction

function! CompileCover()
  let l:cwd = getcwd()
  lcd %:h

  execute 'write'
  execute 'GenerateCover'
  execute "lcd " . l:cwd

endfunction
